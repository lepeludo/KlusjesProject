package be.klusjes.web;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import be.klusjes.entities.Visitor;
import be.klusjes.service.VisitorService;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	VisitorService visitorService;

	@RequestMapping(method = RequestMethod.GET)
	public String showIndex(HttpServletRequest request) {
		String userIpAddress = request.getRemoteAddr();
		String userAgent = request.getHeader("user-agent");
		Visitor visitor = new Visitor();
		visitor.setDate(Calendar.getInstance().getTime());
		visitor.setIpAddress(userIpAddress);
		visitor.setUserAgent(userAgent);
		visitorService.create(visitor);
		return "index";
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String showIndexInfo() {
		return "i";
	}
}
