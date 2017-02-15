package ru.gupcit.spring.service;

/**
 * Created by zaur on 10.01.17.
 */
import java.util.Arrays;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.gupcit.spring.dao.UsersDaoImpl;
import ru.gupcit.spring.model.Users;

@Service
public class AuthenticationService implements UserDetailsService {

    private UsersDaoImpl usersDao;
    public void setUsersDao(UsersDaoImpl usersDao){
        this.usersDao = usersDao;
    }
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        Users users = usersDao.getUserInfo(username);
        GrantedAuthority authority = new SimpleGrantedAuthority(users.getRole());
        UserDetails userDetails = (UserDetails)new User(users.getUsername(),
                users.getPassword(), Arrays.asList(authority));
        return userDetails;
    }
    public Users getUsersDao (){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Users users = usersDao.getUserInfo(userDetails.getUsername());
        return users;
    }
    public void addUser (Users users){
        usersDao.addUser(users);
    }
    public List<Users> usersList(){
        return usersDao.getAllUserInfo();
    }
}
