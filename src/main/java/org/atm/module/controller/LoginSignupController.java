package org.atm.module.controller;

import javax.servlet.http.HttpSession;

import org.atm.module.models.UserDetails;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginSignupController {

	@Autowired
	private SessionFactory sessionFactory;
	private UserDetails userdet;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(HttpSession httpSession, @RequestParam("acc_no") int acc_no,
			@RequestParam("pin") String pin) {
		ModelAndView model;
		Session session = sessionFactory.openSession();
		userdet = (UserDetails) session.get(UserDetails.class,acc_no);
		if (userdet != null) {
					if (userdet.getPin().equals(pin)) {
							httpSession.setAttribute("SESSION_email", userdet.getEmail());
							httpSession.setAttribute("SESSION_name", userdet.getName());
							if((String) httpSession.getAttribute("SESSION_email")!=null){
								model = new ModelAndView("dashboard");
								model.addObject("Name", userdet.getName());
								model.addObject("acc_no",acc_no);
								
								
				               }
							else{
								model = new ModelAndView("index");
								model.addObject("invalid", "LOG IN FIRST TO CONTINUE");
							}
			} else {
				model = new ModelAndView("index");
				model.addObject("invalid", "invalid details");
			}
		}

		else {
			model = new ModelAndView("index");
			model.addObject("norecord", "no record found");
		}
		session.close();
		return model;
	}
	
	
	
	
	

}