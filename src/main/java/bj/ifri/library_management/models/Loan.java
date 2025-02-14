package bj.ifri.library_management.models;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "loans")
public class Loan {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne()
    @JoinColumn(name = "related_book_id")
    private Book relatedBook;

    @ManyToOne()
    @JoinColumn(name = "related_user_id")
    private User relatedUser;

    private LocalDate loanDate;

    private LocalDate expectedReturnDate;

    @Enumerated(value = EnumType.STRING)
    private LoanStatus status = LoanStatus.EN_COURS;

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }


    /**
     * @return the relatedBook
     */
    public Book getRelatedBook() {
        return relatedBook;
    }

    /**
     * @param relatedBook the book to set
     */
    public void setRelatedBook(Book relatedBook) {
        this.relatedBook = relatedBook;
    }


    /**
     * @return the relatedUser
     */
    public User getRelatedUser() {
        return relatedUser;
    }

    /**
     * @param relatedUser the book to set
     */
    public void setRelatedUser(User relatedUser) {
        this.relatedUser = relatedUser;
    }


    /**
     * @return the loanDate
     */
    public LocalDate getLoanDate() {
        return loanDate;
    }

    /**
     * @param loanDate the loanDate to set
     */
    public void setLoanDate(LocalDate loanDate) {
        this.loanDate = loanDate;
    }


    /**
     * @return the expectedReturnDate
     */
    public LocalDate getExpectedReturnDate() {
        return expectedReturnDate;
    }

    /**
     * @param expectedReturnDate the expectedReturnDate to set
     */
    public void setExpectedReturnDate(LocalDate expectedReturnDate) {
        this.expectedReturnDate = expectedReturnDate;
    }

    /**
     * @return the status
     */
    public LoanStatus getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(LoanStatus status) {
        this.status = status;
    }

}