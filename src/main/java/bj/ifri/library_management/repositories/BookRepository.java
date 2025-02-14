package bj.ifri.library_management.repositories;

import bj.ifri.library_management.models.Book;
import bj.ifri.library_management.models.BookAvailability;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Integer> {

    List<Book> findByIsAvailable(BookAvailability isAvailable);

}
