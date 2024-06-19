package com.example.demo.web;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/{message}")
public class HelloController {

	@RequestMapping(value = "")
	public String sayHello(@PathVariable("message") String message) {
		return message;
	}

	@RequestMapping(value = "/{id}")
	public String sayHelloFromId(@PathVariable("message") String message, @PathVariable("id") long id) {
		return message + " FROM " + id;
	}

	@PostMapping("/test")
	public String testing(){
		return "Test15";
	}
}
