package bj.ifri.library_management.models;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "books")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String title;

    private String genre;

    private Date publishedAt;

    @Enumerated(value = EnumType.STRING)
    private BookAvailability isAvailable;

    @ManyToOne()
    @JoinColumn(name = "author_id")
    private User author;

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
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the genre
     */
    public String getGenre() {
        return genre;
    }

    /**
     * @param genre the genre to set
     */
    public void setGenre(String genre) {
        this.genre = genre;
    }

    /**
     * @return the publication date
     */
    public Date getPublishedAt() {
        return publishedAt;
    }

    /**
     * @param publishedAt the published date to set
     */
    public void setPublishedAt(Date publishedAt) {
        this.publishedAt = publishedAt;
    }

    /**
     * @return the isAvailable
     */
    public BookAvailability getIsAvailable() {
        return isAvailable;
    }

    /**
     * @param isAvailable the status to set
     */
    public void setIsAvailable(BookAvailability isAvailable) {
        this.isAvailable = isAvailable;
    }

    /**
     * @return the author
     */
    public User getAuthor() {
        return author;
    }

    /**
     * @param author the book to set
     */
    public void setAuthor(User author) {
        this.author = author;
    }

}
