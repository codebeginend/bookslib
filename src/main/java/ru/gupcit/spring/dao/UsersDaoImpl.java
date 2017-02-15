package ru.gupcit.spring.dao;

/**
 * Created by zaur on 10.01.17.
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import ru.gupcit.spring.model.Users;
public class UsersDaoImpl implements IUsersDao{

    private JdbcTemplate jdbcTemplate;
    public void setTemplate(JdbcTemplate template) {
        this.jdbcTemplate = template;
    }

    public Users getUserInfo(String username){
        String sql = "SELECT u.username name, u.password pass, a.authority role ,u.lastname ln," +
                "u.firstname fn, u.patronimyc pn FROM "+
                "users u INNER JOIN authorities a on u.id=a.id_user WHERE "+
                "u.enabled =1 and u.username = ?";
        Users users = (Users)jdbcTemplate.queryForObject(sql, new Object[]{username},
                new RowMapper<Users>() {
                    public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Users user = new Users();
                        user.setUsername(rs.getString("name"));
                        user.setPassword(rs.getString("pass"));
                        user.setRole(rs.getString("role"));
                        user.setLastname(rs.getString("ln"));
                        user.setFirstname(rs.getString("fn"));
                        user.setPatronimyc(rs.getString("pn"));
                        return user;
                    }
                });
        return users;
    }
    public void addUser(Users users) {
        String sql = "INSERT INTO scgupcit.users " +
                "(username, password, id_organization, firstname, lastname, patronimyc, enabled) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, new Object[] {users.getUsername(), users.getPassword(), users.getId_organization(),users.getLastname(),users.getFirstname(), users.getPatronimyc(), users.getEnable()});
    }

    public List<Users> getAllUserInfo(){
        String sql = "SELECT u.id id, u.username name, u.password pass, o.name orgname, a.authority role ,u.lastname ln," +
                "u.firstname fn, u.patronimyc pn FROM "+
                "users u INNER JOIN authorities a on (u.id=a.id_user)"+
                "INNER JOIN scgupcit.organizations o ON (u.id_organization=o.id)";
        return jdbcTemplate.query(sql,
                new RowMapper<Users>() {
                    public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Users user = new Users();
                        user.setId(rs.getInt("id"));
                        user.setUsername(rs.getString("name"));
                        user.setPassword(rs.getString("pass"));
                        user.setName_organization(rs.getString("orgname"));
                        user.setRole(rs.getString("role"));
                        user.setLastname(rs.getString("ln"));
                        user.setFirstname(rs.getString("fn"));
                        user.setPatronimyc(rs.getString("pn"));
                        return user;
                    }
                });
    }
}
