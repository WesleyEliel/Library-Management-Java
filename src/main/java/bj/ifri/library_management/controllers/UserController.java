package bj.ifri.library_management.controllers;

import bj.ifri.library_management.models.User;
import bj.ifri.library_management.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/users")
public class UserController {

    @Autowired
    private UserService userService;

    // Users
    @GetMapping(value = "")
    public String listUsers(Model model) {

        List<User> usersBdd = this.userService.getAllUsers();

        // Try to paginate the data after I got more knowledge
        model.addAttribute("users", this.userService.getAllUsers());

        System.out.println(usersBdd);

        return "userList";
    }

    @GetMapping(value = "/add")
    public String showUserFormForRecord(Model model) {
        model.addAttribute("user", new User());
        return "userAdd";
    }

    @PostMapping("/save")
    public String saveUser(Model model, @ModelAttribute("user") User user) {

        try {
            this.userService.saveUser(user);
        } catch (Exception e) {
            model.addAttribute("error",
                    "Une erreur s' est produite, veuillez réessayer");
            model.addAttribute("user", new User());

            return "userAdd";
        }
        return "redirect:/users";
    }

    @GetMapping("/{id}/update")
    public String showUserFormForUpdate(@PathVariable(value = "id") Integer id, Model model) {

        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "userUpdate";
    }

    @PostMapping("/{id}/update-save")
    public String updateUser(@PathVariable(value = "id") Integer id, @ModelAttribute("user") User user) {
        this.userService.updateUser(id, user);
        return "redirect:/users";
    }

    @GetMapping("/{id}/delete")
    public String deleteUser(@PathVariable(value = "id") Integer id) {

        this.userService.deleteUserById(id);
        return "redirect:/users";
    }

}