package com.zlj.biz.impl;

import com.zlj.biz.EmployeeBiz;
import com.zlj.dao.EmployeeDao;
import com.zlj.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("employeeBiz")
public class EmployeeBizImpl implements EmployeeBiz {

    @Autowired
    @Qualifier("employeeDao")
    private EmployeeDao employeeDao;

    @Override
    public void add(Employee employee) {
        employee.setPassword("000000");
        employeeDao.insert(employee);
    }

    @Override
    public void edit(Employee employee) {
        employeeDao.update(employee);
    }

    @Override
    public void remove(String sn) {
        employeeDao.delete(sn);
    }

    @Override
    public Employee get(String sn) {
        return employeeDao.select(sn);
    }

    @Override
    public List<Employee> getAll() {
        return employeeDao.selectAll();
    }
}
