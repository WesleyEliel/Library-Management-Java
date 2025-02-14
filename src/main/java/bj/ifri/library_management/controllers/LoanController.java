package bj.ifri.library_management.controllers;

import bj.ifri.library_management.models.BookAvailability;
import bj.ifri.library_management.models.Loan;
import bj.ifri.library_management.services.BookService;
import bj.ifri.library_management.services.LoanService;
import bj.ifri.library_management.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/loans")
public class LoanController {

    @Autowired
    private BookService bookService;

    @Autowired
    private LoanService loanService;

    @Autowired
    private UserService userService;

    // Loans

    @GetMapping(value = "")
    public String listLoans(Model model) {

        model.addAttribute("loans", this.loanService.getAllLoans());

        return "loanList";
    }

    @GetMapping(value = "/add")
    public String addLoan(Model model) {
        model.addAttribute("loan", new Loan());
        model.addAttribute("availableBooks", this.bookService.getAvailableBooks());
        model.addAttribute("allUsers", this.userService.getAllUsers());
        model.addAttribute("availabilityStatuses", BookAvailability.values());
        return "loanAdd";
    }

    @PostMapping("/save")
    public String saveLoan(@ModelAttribute("book") Loan loan) {
        this.loanService.startLoan(loan);
        return "redirect:/loans";
    }

    @GetMapping("/{id}/end-loan")
    public String endLoan(@PathVariable(value = "id") Integer id) {
        this.loanService.endLoan(id);
        return "redirect:/loans";
    }

}