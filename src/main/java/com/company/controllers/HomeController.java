package com.company.controllers;

import java.util.Iterator;
import java.util.List;
import java.util.Locale;



import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.company.daoImpl.HibernateDaoImpl;
import com.company.model.ServiceContact;

@RestController
public class HomeController {
	
	@Autowired
	private HibernateDaoImpl hibernateDaoImpl;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("This is the HomeController");
		
		Session session = hibernateDaoImpl.getSessionFactory().openSession();
	    session.beginTransaction();	
		//Query query = session.createQuery("from Service_Contact");
	   
	    //List<ServiceContact> li = session.createQuery("from ServiceContact").list(); 
//	    List<ServiceContact> li = session.createSQLQuery("select {sc.*} from service_contact sc").addEntity("sc", ServiceContact.class).list();
//	    session.createQuery("insert into ServiceContact(contact_last_name,title) values (?,?)")
//	    .setParameter(0, "test_last_name").setParameter(1, "test_title").executeUpdate();
	    session.createSQLQuery("insert into Service_Contact (contact_last_name,title) values (?,?)")
	    .setParameter(0,"test_last_name").setParameter(1, "test_title").executeUpdate();
	
		session.getTransaction().commit();
		session.flush();
		session.close();
		
//		Iterator<ServiceContact> it = li.iterator();
//		while(it.hasNext()){
//			System.out.println("" + it.next().getTitle());
//		}
		return "home";
	}
}