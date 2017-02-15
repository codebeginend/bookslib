package ru.gupcit.spring.dao;

/**
 * Created by zaur on 09.01.17.
 */
import ru.gupcit.spring.model.Books;

import java.util.List;

public interface IBooksDao {
    public List getAllBooks();
    public List getApplicationsFromUser();
    public void setApplication(Books application);
}
