package bj.ifri.library_management.repositories;

import bj.ifri.library_management.models.Loan;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LoanRepository extends JpaRepository<Loan, Integer> {

}
