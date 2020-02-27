package com.zlj.controller;

import com.zlj.biz.ClaimVoucherBiz;
import com.zlj.biz.GlobalBiz;
import com.zlj.entity.ClaimVoucher;
import com.zlj.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller("globalController")
public class GlobalController {

    @Autowired
    private GlobalBiz globalBiz;

    @Autowired
    private ClaimVoucherBiz claimVoucherBiz;


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
        session.setAttribute("times",overtime(claimVoucherBiz.getForSelf(sn)));
        return "redirect:self";
    }

    //超时处理
    private int overtime(List<ClaimVoucher> list){
        int times = 0;
        Date nowTime = new Date();
        int limitHours = 9;
        for(int i=0;i<list.size();i++){
            Date createTime = list.get(i).getCreateTime();
            long diffHours  = (nowTime.getTime()-createTime.getTime())/ (1000 * 60 * 60);
            if(limitHours>diffHours){
                times++;
            }
        }
        return times;
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
