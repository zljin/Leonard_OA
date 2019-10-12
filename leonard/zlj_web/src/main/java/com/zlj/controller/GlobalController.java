package com.zlj.controller;

import com.zlj.biz.GlobalBiz;
import com.zlj.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller("globalController")
public class GlobalController {

    @Autowired
    private GlobalBiz globalBiz;


    @RequestMapping("/to_login")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/login")
    public String login(HttpSession session, @RequestParam String sn, @RequestParam String password){
        Employee e = globalBiz.login(sn,password);
        if(e==null){
            return "redirect:to_login";
        }
        session.setAttribute("employee",e);
        return "redirect:self";
    }

    @RequestMapping("/self")
    public String self(){
        return  "self";
    }


    @RequestMapping("/quit")
    public String quit(HttpSession session){
        session.setAttribute("employee",null);
        return "redirect:to_login";
    }

    @RequestMapping("/to_modify_password")
    public String toModifyPassWord(){
        return "modify_password";
    }

    @RequestMapping("/modify_password")
    public String modifyPassword(HttpSession session,@RequestParam String old,@RequestParam String new1,@RequestParam String new2){
        Employee e = (Employee) session.getAttribute("employee");
        if(old.equals(e.getPassword())){
            if(new1.equals(new2)){
                e.setPassword(new1);
                globalBiz.changePassword(e);
                return "redirect:self";
            }
        }
        return "redirect:to_modify_password";
    }
}
