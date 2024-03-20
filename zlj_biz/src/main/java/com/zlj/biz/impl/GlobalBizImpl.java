package com.zlj.biz.impl;

import com.zlj.biz.GlobalBiz;
import com.zlj.dao.EmployeeDao;
import com.zlj.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


@Service("globalBiz")
public class GlobalBizImpl implements GlobalBiz {

    @Qualifier("employeeDao")
    @Autowired
    private EmployeeDao employeeDao;


    @Override
    public Employee login(String sn, String password) {
        Employee employee = employeeDao.select(sn);
        return (employee!=null&&password.equals(employee.getPassword()))?employee:null;
    }

    @Override
    public void changePassword(Employee employee) {
        employeeDao.update(employee);
    }
}
