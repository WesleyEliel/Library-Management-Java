package bj.ifri.library_management.controllers;

import java.util.List;

import bj.ifri.library_management.models.Book;
import bj.ifri.library_management.repositories.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/books")
public class BookController {

    @Autowired
    private BookRepository bookRepository;

    @GetMapping(value = "/")
    public String listBooks(Model model) {

        List<Book> booksBdd = bookRepository.findAll();

        model.addAttribute("books", booksBdd);

        return "books";
    }

    @GetMapping(value = "/add")
    public String addBook(Model model) {
        model.addAttribute("book", new Book());
        return "addBook";
    }

    @PostMapping("/save")
    public String saveBook(@ModelAttribute("book") Book book) {

        bookRepository.save(book);

        return "redirect:/books";
    }
}
