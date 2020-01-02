package uz.yt.tli.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainConroller {

    @RequestMapping(value = "/")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/registration")
    public String reg() {
        return "registration";
    }

    @RequestMapping(value = "/payment")
    public String payment() {
        return "payment";
    }

    @RequestMapping(value = "/reports")
    public String reports() {
        return "report";
    }
}
