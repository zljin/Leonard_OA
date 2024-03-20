package com.zlj.biz;

import com.zlj.entity.Employee;

public interface GlobalBiz {

    Employee login(String sn,String password);
    void changePassword(Employee employee);
}
