package bj.ifri.library_management.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import bj.ifri.library_management.models.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {

}
