package com.example.chatapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/yolo")
    public String index() throws InterruptedException {
        return "Yolo";
    }

}
