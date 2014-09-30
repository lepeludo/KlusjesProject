package be.klusjes.web;

import java.util.Calendar;

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

import be.klusjes.entities.AdministratorMessage;
import be.klusjes.service.AdministratorMessageService;
import be.klusjes.service.UserService;

@Controller
@RequestMapping("/administratormessages")
public class AdministratorMessagesController {

	@Autowired
	private AdministratorMessageService administratorMessageService;
	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public String composeMessage(
			Model model,
			@ModelAttribute("administratorMessageForm") AdministratorMessageForm administratorMessageForm) {	
		return "administratormessages/compose";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String postMessage(
			Model model,
			@Valid @ModelAttribute("administratorMessageForm") AdministratorMessageForm administratorMessageForm, BindingResult result) {	
		if(result.hasErrors()){
			return "administratormessages/compose";
		}	
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		AdministratorMessage administratorMessage = new AdministratorMessage();
		administratorMessage.setDate(Calendar.getInstance().getTime());
		administratorMessage.setReadBool(false);
		administratorMessage.setText(administratorMessageForm.getText());
		administratorMessage.setSubject(administratorMessageForm.getSubject());
		administratorMessage.setUser(userService.read(auth.getName()));
		System.out.println(administratorMessageForm.getText());
		administratorMessageService.create(administratorMessage);
		return "administratormessages/messagesend";
	}
	
	@RequestMapping(value="/administrator",method = RequestMethod.GET)
	public String readMessages(
			Model model) {	
		model.addAttribute("messages",administratorMessageService.findUnreadMessages());
		return "administratormessages/administrator";
	}
}
