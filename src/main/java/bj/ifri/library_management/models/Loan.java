package bj.ifri.library_management.models;

import jakarta.persistence.*;

import java.util.Date;

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

    private Date loanDate;

    private Date expectedReturnDate;

    @Enumerated(value = EnumType.STRING)
    private LoanStatus status;

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
    public Date getLoanDate() {
        return loanDate;
    }

    /**
     * @param loanDate the loanDate to set
     */
    public void setLoanDate(Date loanDate) {
        this.loanDate = loanDate;
    }


    /**
     * @return the expectedReturnDate
     */
    public Date getExpectedReturnDate() {
        return expectedReturnDate;
    }

    /**
     * @param expectedReturnDate the expectedReturnDate to set
     */
    public void setExpectedReturnDate(Date expectedReturnDate) {
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