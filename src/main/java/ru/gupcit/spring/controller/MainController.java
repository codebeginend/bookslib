package ru.gupcit.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.gupcit.spring.dao.BooksDaoImpl;
import ru.gupcit.spring.dao.CategoriesDaoImpl;
import ru.gupcit.spring.model.Books;
import ru.gupcit.spring.model.Categoryes;
import ru.gupcit.spring.model.Users;
import ru.gupcit.spring.service.AuthenticationService;

import java.security.Principal;
import java.util.List;

/**
 * Created by zaur on 22.12.16.
 */
@Controller
public class MainController {

    @Autowired
    BooksDaoImpl applicationsDao;
    @Autowired
    CategoriesDaoImpl categoriesDao;

    @Autowired
    AuthenticationService authenticationService;

    @RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Неправильный логин или пароль");
        }
        model.setViewName("/index");
        return model;
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public ModelAndView getError(Principal user){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        ModelAndView model = new ModelAndView();
        if(user!=null){
            model.addObject("errorMsg",userDetails.getAuthorities() + " " + userDetails.getUsername() + " у вас нет доступа к странице");
        }else {
            model.addObject("errorMsg", "у вас нет доступа к странице");
        }
        model.setViewName("/error");
        return model;

    }

    @RequestMapping(value = "/admin/books", method = RequestMethod.GET)
    public String getApplication(Model model){

        List<Books> allApplications = applicationsDao.getAllBooks();
        int size = allApplications.size();
        model.addAttribute("stat", size);
        model.addAttribute("list", allApplications);
        return "admin/books";
    }

    @RequestMapping(value = "/admin/add", method = RequestMethod.GET)
    public String getUsers(Model model){
        model.addAttribute("usersList", authenticationService.usersList());
        return "admin/add";
    }
    @RequestMapping(value= "/admin/add/user/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("setUser") Users users){
       authenticationService.addUser(users);
        return "redirect:/admin/administration";
    }

    @RequestMapping(value = "user/books", method = RequestMethod.GET)
    public String  getUserApplication(Model model){
        List<Books> bookss = applicationsDao.getAllBooks();
        List<Categoryes> categoryes = categoriesDao.getAllCategoryes();
        Users users = authenticationService.getUsersDao();
        model.addAttribute("app", bookss);
        model.addAttribute("categ", categoryes);
        model.addAttribute("setApp", new Books());
        model.addAttribute("userinfo", users);
        return "user/books";
    }
    @RequestMapping(value= "/user/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("setapp") Books applications){
       applicationsDao.setApplication(applications);
        return "redirect:/user/application";
    }

    @RequestMapping(value = "/admin/books/excel", method= RequestMethod.GET)
    public ModelAndView excel() {
        System.out.println("ExcelPDFController excel is called");

        List<Books> applicationses = applicationsDao.getAllBooks();

        //excelDocument - look excel-pdf-config.xml
        return new ModelAndView("excelDocument", "modelObject", applicationses);

    }

    @RequestMapping(value = "/admin/books/pdf", method= RequestMethod.GET)
    public ModelAndView pdf() {

        System.out.println("ExcelPDFController pdf is called");

        List<Books> applicationses = applicationsDao.getAllBooks();
        //pdfDocument - look excel-pdf-config.xml
        return new ModelAndView("pdfDocument", "modelObject", applicationses);

    }
}
