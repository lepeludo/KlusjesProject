package be.klusjes.web;

import java.util.Calendar;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import be.klusjes.entities.User;
import be.klusjes.service.UserService;

@Controller
public class LogInController {
	@Autowired
	UserService userService;

	@RequestMapping("/confirmation")
	public String confirmUser(@RequestParam String confirm,
			@RequestParam String username) {
		User user = userService.read(username);
		System.out.println(user.getUsername());
		if (user.getRandomUUID().equals(confirm)) {
			user.setEnabled(true);
			user.setRandomUUID(null);
			userService.update(user);
			return "/login";
		}
		return "loginutils/confirmation/failure";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLogin() {
		return "login";
	}

	@RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
	public String forgotPasswordGet(Model model,
			@ModelAttribute ForgotPasswordForm forgotPasswordForm) {
		return "loginutils/forgotpassword";
	}

	@RequestMapping(value = "/forgotpassword", method = RequestMethod.POST)
	public String forgotPasswordPost(Model model,
			@Valid @ModelAttribute ForgotPasswordForm forgotPasswordForm,
			BindingResult result) throws MessagingException {
		System.out.println(result.getErrorCount());
		if (result.hasErrors()) {
			System.out.println("ik ben hier");
			return "loginutils/forgotpassword";
		}
		if (!result.hasErrors()) {
			User user = userService.readByEmail(forgotPasswordForm.getEmail());
			if (user != null) {
				userService.resetPassword(user);
			} else {

				return "loginutils/nosuchemail";
			}
		}
		return "loginutils/forgotpasswordsuccess";
	}

	@RequestMapping(value = "/changepassword", method = RequestMethod.GET)
	public String changePassword(
			@ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm) {
		return "loginutils/changepassword";
	}

	@RequestMapping(value = "/changepassword", method = RequestMethod.POST)
	public String changePasswordPost(
			@Valid @ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm,
			BindingResult result) {
		if (result.hasErrors()) {
			return "loginutils/changepassword";
		}

		if (!result.hasErrors()) {
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			User user = userService.read(auth.getName());
			userService.changePassword(user, changePasswordForm.getPassword());
			return "loginutils/changepasswordsuccess";
		}
		return "loginutils/changepassword";
	}

	@RequestMapping(value = "/resetpassword", method = RequestMethod.GET)
	public String reset(
			Model model,
			@RequestParam String confirm,
			@RequestParam String username,
			@ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm) {
		User user = userService.read(username);
		System.out.println(user.getEmail());
		if (user != null) {
			if (user.getRandomUUID().equals(confirm)) {
				double passedminutes = (Calendar.getInstance().getTime()
						.getTime() - user.getRandomUUIDDate().getTime()) / 1000 / 60;
				if (passedminutes > 5.0) {
					user.setRandomUUID(null);
					userService.update(user);
					return "loginutils/forgotpasswordfailure";
				}
				model.addAttribute("confirm", confirm);
				model.addAttribute("username", username);
				return "loginutils/resetpassword";
			}
		}

		return "loginutils/forgotpasswordfailure";

	}

	@RequestMapping(value = "/resetpassword", method = RequestMethod.POST)
	public String doReset(
			Model model,
			@RequestParam String confirm,
			@RequestParam String username,
			@Valid @ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm,
			BindingResult result) {
		if (!result.hasErrors()) {
			User user = userService.read(username);
			if (user != null) {
				userService.changePassword(user,
						changePasswordForm.getPassword());
				return "redirect:/login";
			}
		}
		return "loginutils/resetpassword";
	}

	// points to deactivation
	@RequestMapping(value = "/startdeactivation", method = RequestMethod.GET)
	public String startDeactivation(Model model) {
		return "deactivate";
	}

	// allow user to deactivate account
	@RequestMapping(value = "/deactivate", method = RequestMethod.POST)
	public String deactivateAccount(Model model) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User user = userService.read(auth.getName());
		userService.deactivateAccound(user);
		SecurityContextHolder.clearContext();
		return "deactivated";
	}
}
