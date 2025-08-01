package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ch.qos.logback.core.joran.spi.HttpUtil.RequestMethod;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/login";
	}
	
    // Show login page
    @GetMapping("/login")
    public String showLoginPage(HttpSession session) {
    	if (session.getAttribute("username") != null) {
    		return "home";
    	} else {
    		return "login";   // resolves to your login JSP page
    	}
    }

	@PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session) {
        if ("admin".equals(username) && "1234".equals(password)) {
            session.setAttribute("username", username);
            return "home";
        } else {
            return "redirect:/login?error=1";
        }
    }
}


/*
 * The above class can be written using requestmapping and GET and POST method
 * can be handled togather like this
 */

/*
 
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(@RequestParam(required = false) String username,
	                    @RequestParam(required = false) String password,
	                    HttpSession session,
	                    HttpServletRequest request) {
	    
	    @GetMapping("/logout")
		public String logout(HttpSession session) {
		    session.invalidate();
		    return "redirect:/login";
		}
			    
	    // If GET, simply show the login page
	    if (request.getMethod().equalsIgnoreCase("GET")) {
	        return "login.jsp";
	    }
	
	    // If POST, process the login
	    if ("admin".equals(username) && "1234".equals(password)) {
	        session.setAttribute("username", username);
	        return "redirect:/index.jsp";
	    } else {
	        return "redirect:/login?error=1";
	    }
	}
	}

*/
