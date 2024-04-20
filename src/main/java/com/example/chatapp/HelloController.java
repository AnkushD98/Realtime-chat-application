package com.example.chatapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/")
    public String index() throws InterruptedException {
        Thread.sleep(Long.parseLong("5000"));
        return "Yolo";
    }
}
