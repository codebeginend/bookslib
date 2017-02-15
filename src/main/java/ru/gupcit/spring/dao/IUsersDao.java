package ru.gupcit.spring.dao;

import ru.gupcit.spring.model.Users;

import java.util.List;

/**
 * Created by zaur on 19.01.17.
 */
public interface IUsersDao {
    public Users getUserInfo(String username);
}
