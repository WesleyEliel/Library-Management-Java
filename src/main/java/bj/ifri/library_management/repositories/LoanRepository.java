package bj.ifri.library_management.repositories;

import bj.ifri.library_management.models.Loan;
import bj.ifri.library_management.models.LoanStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LoanRepository extends JpaRepository<Loan, Integer> {

    List<Loan> findByStatus(LoanStatus status);

}
