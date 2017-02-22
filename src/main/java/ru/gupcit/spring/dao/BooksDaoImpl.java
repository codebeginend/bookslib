package ru.gupcit.spring.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import ru.gupcit.spring.model.Books;
import ru.gupcit.spring.model.Users;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by zaur on 09.01.17.
 */
public class BooksDaoImpl implements IBooksDao {

    JdbcTemplate jdbcTemplate;
    public void setTemplate(JdbcTemplate template) {
        this.jdbcTemplate = template;
    }
    private UsersDaoImpl usersDao;
    public void setUsersDao(UsersDaoImpl usersDao){
        this.usersDao = usersDao;
    }

    public List<Books> getAllBooks(){
        String sql = "SELECT bookslib.books.image image, bookslib.categories.name categoryname, bookslib.books.id id, bookslib.books.title title, bookslib.books.text text," +
                " bookslib.books.author author, bookslib.books.year year  FROM "+
                "bookslib.books INNER JOIN bookslib.categories ON bookslib.categories.id = bookslib.books.id_category ORDER BY bookslib.books.id DESC";
        return  jdbcTemplate.query(sql,
                new RowMapper<Books>() {
                    public Books mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Books books = new Books();
                        books.setId(rs.getInt("id"));
                        books.setTitle(rs.getString("title"));
                        books.setText(rs.getString("text"));
                        books.setAuthor(rs.getString("author"));
                        books.setYear(rs.getString("year"));
                        books.setImages(rs.getString("image"));
                        books.setName_category(rs.getString("categoryname"));
                        return books;
                    }
                });

    }

    public List<Books> getCategoryBooks(int id_category) {
        String sql = "SELECT bookslib.books.image image, bookslib.categories.name categoryname, bookslib.books.id id, bookslib.books.title title, bookslib.books.text text," +
                " bookslib.books.author author, bookslib.books.year year  FROM "+
                "bookslib.books INNER JOIN bookslib.categories ON bookslib.categories.id = bookslib.books.id_category where bookslib.books.id_category = ? ORDER BY bookslib.books.id DESC";
        return jdbcTemplate.query(sql, new Object[]{id_category},
                new RowMapper<Books>() {
                    public Books mapRow(ResultSet rs, int i) throws SQLException {
                        Books books = new Books();
                        books.setId(rs.getInt("id"));
                        books.setTitle(rs.getString("title"));
                        books.setText(rs.getString("text"));
                        books.setAuthor(rs.getString("author"));
                        books.setYear(rs.getString("year"));
                        books.setImages(rs.getString("image"));
                        books.setName_category(rs.getString("categoryname"));
                        return books;
                    }
                });
    }

    public void addBook(Books books) {
        String sql = "INSERT INTO bookslib.books "+
                "(title, text, author, year, id_category, image) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, new Object[]{books.getTitle(), books.getText(), books.getAuthor(),books.getYear(), books.getId_category(), books.getImages()});
    }


}