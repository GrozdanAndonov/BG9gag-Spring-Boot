package com.bg.controller;

import java.sql.SQLException;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bg.model.Post;
import com.bg.model.PostDao;
import com.bg.model.User;
import com.bg.model.UserDao;
import com.bg.util.Validator;

/**
 * This controller checks whether you are logged or not
 * and other methods forward to this controller 
 */

@Controller
public class WelcomeController {
	@Autowired
	PostDao pd;

	@RequestMapping(method = RequestMethod.GET)
	public String welcome(Model m, HttpSession s) {
		try {
			HashSet<Post> posts = pd.getAllPosts();
			m.addAttribute("posts", posts);
			
		} catch (SQLException e) {
			e.getMessage();
		}
		
		if(Validator.notLogged(s)) {
			return "notLogged";
		}else {
			return "logged";
		}
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String welcome2(Model m, HttpSession s) {
		
		try {
			HashSet<Post> posts = pd.getAllPosts();
			m.addAttribute("posts", posts);
		} catch (SQLException e) {
			e.getMessage();
		}
		
		if(Validator.notLogged(s)) {
			return "notLogged";
		}else {
			return "logged";
		}
	}
}
