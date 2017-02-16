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
    BooksDaoImpl booksDao;
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
        List<Books> allBooks = booksDao.getAllBooks();
        List<Categoryes> categoryesList = categoriesDao.getAllCategoryes();
        int size = allBooks.size();
        model.addAttribute("stat", size);
        model.addAttribute("list", allBooks);
        model.addAttribute("listCategoryes", categoryesList);
        model.addAttribute("addbook", new Books());
        return "admin/books";
    }

    @RequestMapping("/admin/books/{id_category}")
    public String removeBook(@PathVariable("id_category") int id, Model model){
        List<Books> categoryBooks = booksDao.getCategoryBooks(id);
        List<Categoryes> categoryesList = categoriesDao.getAllCategoryes();
        int size = categoryBooks.size();
        model.addAttribute("stat", size);
        model.addAttribute("list", categoryBooks);
        model.addAttribute("listCategoryes", categoryesList);
        model.addAttribute("addbook", new Books());
        return "/admin/books";
    }
    @RequestMapping(value= "/admin/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("addbook") Books books){
        booksDao.addBook(books);
        return "redirect:/admin/books";
    }

    @RequestMapping(value = "user/books", method = RequestMethod.GET)
    public String  getUserBooks(Model model){
        List<Books> bookss = booksDao.getAllBooks();
        List<Categoryes> categoryes = categoriesDao.getAllCategoryes();
        Users users = authenticationService.getUsersDao();
        model.addAttribute("app", bookss);
        model.addAttribute("categ", categoryes);
        model.addAttribute("userinfo", users);
        return "user/books";
    }

    @RequestMapping(value = "/admin/books/excel", method= RequestMethod.GET)
    public ModelAndView excel() {
        System.out.println("ExcelPDFController excel is called");

        List<Books> applicationses = booksDao.getAllBooks();
        //excelDocument - look excel-pdf-config.xml
        return new ModelAndView("excelDocument", "modelObject", applicationses);

    }

    @RequestMapping(value = "/admin/books/pdf", method= RequestMethod.GET)
    public ModelAndView pdf() {
        List<Books> applicationses = booksDao.getAllBooks();
        //pdfDocument - look excel-pdf-config.xml
        return new ModelAndView("pdfDocument", "modelObject", applicationses);

    }
}
