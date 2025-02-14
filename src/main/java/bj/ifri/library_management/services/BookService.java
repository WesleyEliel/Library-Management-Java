package bj.ifri.library_management.services;

import bj.ifri.library_management.models.Book;
import bj.ifri.library_management.models.BookAvailability;
import bj.ifri.library_management.repositories.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BookService {


    @Autowired
    private BookRepository bookRepository;

    public Long count() {
        return this.bookRepository.count();
    }

    public List<Book> getAllBooks() {
        return this.bookRepository.findAll();
    }

    public List<Book> getAvailableBooks() {
        return this.bookRepository.findByIsAvailable(BookAvailability.OUI);
    }

    public Book getBookById(Integer id) {
        Optional<Book> optionalBook = this.bookRepository.findById(id);
        Book book = null;
        if (optionalBook.isPresent()) {
            book = optionalBook.get();
        } else {
            throw new RuntimeException("Livre non trouvé por l'id : " + id);
        }
        return book;
    }

    public Page<Book> findPaginated(int pageNum, int pageSize, String sortField, String sortDirection) {
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() :
                Sort.by(sortField).descending();
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize, sort);
        return this.bookRepository.findAll(pageable);
    }

    public void saveBook(Book book) {
        this.bookRepository.save(book);
    }


    public Book updateBook(int id, Book book) {
        Book updatedBook = this.getBookById(id);

        updatedBook.setTitle(book.getTitle());
        updatedBook.setGenre(book.getGenre());
        updatedBook.setPublishedAt(book.getPublishedAt());
        updatedBook.setIsAvailable(book.getIsAvailable());
        updatedBook.setAuthor(book.getAuthor());

        return this.bookRepository.save(updatedBook);
    }


    public Book updateBookAvailability(Book book, BookAvailability availability) {
        book.setIsAvailable(availability);
        return this.bookRepository.save(book);
    }

    public void deleteBookById(Integer id) {
        this.bookRepository.deleteById(id);
    }

}