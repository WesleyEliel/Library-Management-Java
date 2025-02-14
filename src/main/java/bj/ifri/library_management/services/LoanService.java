package bj.ifri.library_management.services;

import bj.ifri.library_management.models.BookAvailability;
import bj.ifri.library_management.models.Loan;
import bj.ifri.library_management.models.LoanStatus;
import bj.ifri.library_management.repositories.LoanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LoanService {

    @Autowired
    private LoanRepository loanRepository;

    @Autowired
    private BookService bookService;

    public Long count() {
        return this.loanRepository.count();
    }

    public Integer countOnGoingLoans() {
        return this.loanRepository.findByStatus(LoanStatus.EN_COURS).size();
    }

    public List<Loan> getAllLoans() {
        return this.loanRepository.findAll();
    }

    public Loan getLoanById(Integer id) {
        Optional<Loan> optionalLoan = this.loanRepository.findById(id);
        Loan loan = null;
        if (optionalLoan.isPresent()) {
            loan = optionalLoan.get();
        } else {
            throw new RuntimeException("Prêt non trouvé pour l'id : " + id);
        }
        return loan;
    }

    public Loan saveLoan(Loan loan) {
        this.loanRepository.save(loan);
        return loan;
    }


    public Loan updateLoan(int id, Loan loan) {
        Loan updatedLoan = this.getLoanById(id);

        updatedLoan.setRelatedBook(loan.getRelatedBook());
        updatedLoan.setRelatedUser(loan.getRelatedUser());
        updatedLoan.setStatus(loan.getStatus());
        updatedLoan.setLoanDate(loan.getLoanDate());
        updatedLoan.setExpectedReturnDate(loan.getExpectedReturnDate());

        return this.loanRepository.save(updatedLoan);
    }

    public void startLoan(Loan loan) {
        Loan savedLoan = this.saveLoan(loan);
        this.loanRepository.save(loan);
        this.bookService.updateBookAvailability(savedLoan.getRelatedBook(), BookAvailability.NON);
    }

    public void endLoan(int id) {
        Loan loan = this.getLoanById(id);

        loan.setStatus(LoanStatus.FINI);
        this.loanRepository.save(loan);
        this.bookService.updateBookAvailability(loan.getRelatedBook(), BookAvailability.OUI);
    }

    public void deleteLoanById(Integer id) {
        this.loanRepository.deleteById(id);
    }

}