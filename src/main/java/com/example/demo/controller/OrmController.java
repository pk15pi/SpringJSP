package com.example.demo.controller;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/orm")
public class OrmController {

    @PersistenceContext
    private EntityManager entityManager;

    @GetMapping({"", "/"})
    public String ormPage() {
        return "orm"; // Returns orm.jsp or orm.html depending on your view resolver
    }

    @ResponseBody
    @GetMapping("/rawsql")
    public Object rawsql(@RequestParam(required=false)String w) {
        // Correct SQL syntax - adjust column name as per your table
        String sql = "SELECT * FROM Questions ORDER BY id DESC LIMIT 1";
        
        Query query = entityManager.createNativeQuery(sql);
        Object result = query.getSingleResult();
        
        if("yes".equals(w)) {
        	Map<String, String> res = new HashMap<>();
        	Object[] row = (Object[]) result;
        	for(int i = 0; i<row.length; i++) {
            	res.put(String.valueOf(i), row[i] != null ? row[i].toString() : null);
        	}
        	return res;
        }
        return result;
    }
}
