package com.example.demo.config;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LayoutInterceptor implements HandlerInterceptor {

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {

        // If controller didn't return a view (e.g. redirect), skip
        if (modelAndView == null || !modelAndView.hasView()) {
            return;
        }

        String originalViewName = modelAndView.getViewName();

        // If it's login or error page, don't use template
        if (originalViewName.equals("login") || originalViewName.startsWith("redirect:")) {
            return;
        }

        // Add original view as contentPage
        modelAndView.addObject("contentPage", originalViewName + ".jsp");

        // Replace view with template
        modelAndView.setViewName("template");
    }
}
