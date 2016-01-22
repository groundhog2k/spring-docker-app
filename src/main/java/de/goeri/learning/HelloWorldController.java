package de.goeri.learning;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Goeran on 22.01.16.
 */
@RestController
public class HelloWorldController {
    @RequestMapping("/")
    public String start() {
        return "Hello world! - Greetings from spring-boot!";
    }
}
