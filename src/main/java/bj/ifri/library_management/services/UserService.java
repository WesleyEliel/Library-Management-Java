package bj.ifri.library_management.services;

import bj.ifri.library_management.models.User;
import bj.ifri.library_management.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {


    @Autowired
    private UserRepository userRepository;

    public Long count() {
        return userRepository.count();
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(Integer id) {
        Optional<User> optionalUser = this.userRepository.findById(id);
        User user = null;
        if (optionalUser.isPresent()) {
            user = optionalUser.get();
        } else {
            throw new RuntimeException("Utilisateur non trouvé por l'id : " + id);
        }
        return user;
    }

    public Page<User> findPaginated(int pageNum, int pageSize, String sortField, String sortDirection) {
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() :
                Sort.by(sortField).descending();
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize, sort);
        return this.userRepository.findAll(pageable);
    }

    public void saveUser(User user) {
        this.userRepository.save(user);
    }


    public User updateUser(int id, User user) {
        User updatedUser = this.getUserById(id);

        updatedUser.setFullName(user.getFullName());
        updatedUser.setEmail(user.getEmail());
        updatedUser.setPhone(user.getPhone());

        return this.userRepository.save(updatedUser);
    }

    public void deleteUserById(Integer id) {
        this.userRepository.deleteById(id);
    }

}