package org.atm.module.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.atm.module.models.CreditTransactions;
import org.atm.module.models.DebitTransactions;
import org.atm.module.models.UserDetails;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TransactionsController {

	
	@Autowired
	private SessionFactory sessionFactory;
	private UserDetails userdet;
	private DebitTransactions dbt;
	private CreditTransactions cdt;
	
	@RequestMapping(value = "/balance", method = RequestMethod.POST)
	public ModelAndView balance(HttpSession httpSession, @RequestParam("acc_no") int acc_no
			) {
		ModelAndView model;
		Session session = sessionFactory.openSession();
		userdet = (UserDetails) session.get(UserDetails.class,acc_no);
		if (userdet != null) {
				
						
							if((String) httpSession.getAttribute("SESSION_email")!=null){
								model = new ModelAndView("balance");
								model.addObject("Name", userdet.getName());
								model.addObject("acc_no",acc_no);
								model.addObject("balance",userdet.getBalance());
								DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
								   LocalDateTime now = LocalDateTime.now();  
								model.addObject("time",dtf.format(now).toString());
								
				               }
							else{
								model = new ModelAndView("index");
								model.addObject("invalid", "LOG IN FIRST TO CONTINUE");
							}
			} else {
				model = new ModelAndView("index");
				model.addObject("invalid", "invalid details");
			}
		
		session.close();
		return model;
	}
	
	@RequestMapping(value = "/debit", method = RequestMethod.POST)
	public ModelAndView debit(HttpSession httpSession, @RequestParam("acc_no") int acc_no
			) {
		ModelAndView model;
		Session session = sessionFactory.openSession();
		
		Query q=session.createSQLQuery("Select * from debittransactions where user_id=" + acc_no );
		q.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			
		List debit=q.list();
		
		
		System.out.println(debit.toString());
			
		if(q!=null){
			
			 model = new ModelAndView("debit");
			 model.addObject("title","DEBIT");
			 model.addObject("data",debit);
			 model.addObject("acc_no",acc_no);
		}
		else
			{model=new ModelAndView("dashboard");
				model.addObject("mgs","no transactions found");
			}
		session.close();
		return model;
	}
	
	@RequestMapping(value = "/credit", method = RequestMethod.POST)
	public ModelAndView credit(HttpSession httpSession, @RequestParam("acc_no") int acc_no
			) {
		ModelAndView model;
		Session session = sessionFactory.openSession();
		
		Query q=session.createSQLQuery("Select * from credittransactions where user_id=" + acc_no );
		q.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			
		List credit=q.list();
		
		
		System.out.println(credit.toString());
			
		if(q!=null){
			
			 model = new ModelAndView("debit");

			 model.addObject("title","CREDIT");
			 model.addObject("data",credit);
			 model.addObject("acc_no",acc_no);
		}
		else
			{model=new ModelAndView("dashboard");
				model.addObject("mgs","no transactions found");
			}
		session.close();
		return model;
	}
	
	
}
