package bj.ifri.library_management.controllers;

import bj.ifri.library_management.models.Book;
import bj.ifri.library_management.repositories.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "hdhhdh")
public class HomeController {

    @Autowired
    private BookRepository bookRepository;

    @GetMapping(value = "/")
    public String listBooks(Model model) {

        List<Book> booksBdd = bookRepository.findAll();

        model.addAttribute("books", booksBdd);

        return "books";
    }
}
