package bj.ifri.library_management.controllers;

import bj.ifri.library_management.models.Book;
import bj.ifri.library_management.models.BookAvailability;
import bj.ifri.library_management.services.BookService;
import bj.ifri.library_management.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/books")
public class BookController {

    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;

    // Books
    @GetMapping(value = "")
    public String listBooks(Model model) {

        List<Book> booksBdd = this.bookService.getAllBooks();

        model.addAttribute("books", booksBdd);

        return "bookList";
    }

    @GetMapping(value = "/add")
    public String showBookFormForRecord(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("allUsers", this.userService.getAllUsers());
        model.addAttribute("availabilityStatuses", BookAvailability.values());
        return "bookAdd";
    }

    @PostMapping("/save")
    public String saveBook(@ModelAttribute("book") Book book) {

        this.bookService.saveBook(book);

        return "redirect:/books";
    }

    @GetMapping("/{id}/update")
    public String showBookFormForUpdate(@PathVariable(value = "id") Integer id, Model model) {

        Book book = this.bookService.getBookById(id);
        model.addAttribute("book", book);
        model.addAttribute("allUsers", this.userService.getAllUsers());
        model.addAttribute("availabilityStatuses", BookAvailability.values());
        return "bookUpdate";
    }

    @PostMapping("/{id}/update-save")
    public String updateBook(@PathVariable(value = "id") Integer id, @ModelAttribute("book") Book book) {
        this.bookService.updateBook(id, book);
        return "redirect:/books";
    }

    @GetMapping("/{id}/delete")
    public String deleteBook(@PathVariable(value = "id") Integer id) {

        this.bookService.deleteBookById(id);
        return "redirect:/books";
    }
}