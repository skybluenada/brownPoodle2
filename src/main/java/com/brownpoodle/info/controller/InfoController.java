package com.brownpoodle.info.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class InfoController {
   Logger logger = Logger.getLogger(InfoController.class);
   
   @RequestMapping(value = "info", method = RequestMethod.GET)
   public String selectTest3() {
      return "info/info";      
   }
}