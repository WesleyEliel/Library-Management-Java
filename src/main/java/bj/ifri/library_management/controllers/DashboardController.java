package bj.ifri.library_management.controllers;

import bj.ifri.library_management.models.Book;
import bj.ifri.library_management.services.BookService;
import bj.ifri.library_management.services.LoanService;
import bj.ifri.library_management.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@Controller
@RequestMapping(path = "")
public class DashboardController {

    @Autowired
    private BookService bookService;

    @Autowired
    private LoanService loanService;

    @Autowired
    private UserService userService;

    // Dashboard
    @GetMapping({"/", "/dashboard"})
    public String dashboard(Model model, Locale locale) {
        model.addAttribute("totalUsers", this.userService.count());
        model.addAttribute("totalBooks", this.bookService.count());
        model.addAttribute("totalLoans", this.loanService.count());
        model.addAttribute("totalActiveLoans", this.loanService.countOnGoingLoans());

        // Find last 10 record
        Page<Book> paginatedBooksList = this.bookService.findPaginated(1, 10, "id", Sort.Direction.DESC.name());

        model.addAttribute("lastBooks", paginatedBooksList.getContent());

        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm", locale);
        String formattedTime = dateFormat.format(new Date());

        model.addAttribute("formattedTime", formattedTime);

        return "dashboard";
    }
}