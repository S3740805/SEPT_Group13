package com.web;

import com.model.User;
import com.service.SecurityService;
import com.service.UserService;
import com.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    //GET register form
    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    //POST register form
    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        // save new user
        userService.save(userForm);
        // auto login
        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());
        return "redirect:/welcome";
    }

    // GET login form
    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    //Navigation to pages
    //General
    @GetMapping({"/", "/welcome"})
    public String welcome(SecurityContextHolderAwareRequestWrapper request) {
        // Check if the user is Admin
        boolean isAdmin = request.isUserInRole("ROLE_ADMIN");
        System.out.println("ROLE_ADMIN=" + isAdmin);
        // If user is admin
        if (isAdmin)
            return "welcomeAdmin";
            // If user is patient
        else return "welcomePatient";
    }

    // Access denied handling
    @GetMapping("/403")
    public String accessDenied(Model model) {
        return "error/403Page";
    }

    //Admin
    @GetMapping("/admin/doctor")
    public String doctor(Model model) {
        return "admin/doctor";
    }

    @GetMapping("/admin/booking")
    public String bookingAdmin(Model model) {
        return "admin/bookingAdmin";
    }

    @GetMapping("/admin/patient")
    public String patientAdmin(Model model) {
        return "admin/patientAdmin";
    }

    //Patient/ User
    @GetMapping("/patient/booking")
    public String booking(Model model) {
        return "patient/booking";
    }

    @GetMapping("/patient/profile")
    public String profile(Model model) {
        return "patient/profile";
    }

    @GetMapping("/patient/bookinghistory")
    public String bookingPatient(Model model) {
        return "patient/bookingHistory";
    }

    @GetMapping("/patient/about")
    public String about(Model model) {
        return "patient/about";
    }


}
