package com.validator;

import com.model.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    // Input-data validation for registration
    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
        //USERNAME
        //Empty field
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        //Invalid length
        if (user.getUsername().length() < 6 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userForm.username");
        }
        // User special character
        if (!user.getUsername().matches("[0-9a-zA-Z_.-]*")) {
            errors.rejectValue("username", "Invalid.username");
        }
        // username already taken
        if (userService.findByUsername(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        //PASSWORD
        // Empty field
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        // Invalid length
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }
        // Passwords not match
        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }
    }
}
