package bj.ifri.library_management.repositories;

import bj.ifri.library_management.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {

}
