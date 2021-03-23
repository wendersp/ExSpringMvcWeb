/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.wpsistemas.exspringmvcweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author wender
 */
@Controller
@RequestMapping("/")
public class HomeController {

    @GetMapping
    public String welcome() {
        return "welcome";
    }

    @RequestMapping(value = "/teste", method = RequestMethod.GET)
    public ModelAndView teste() {
        ModelAndView view = new ModelAndView("welcome");
        view.addObject("teste", "Olá, eu sou o spring MVC.");
        return view;
    }

}
