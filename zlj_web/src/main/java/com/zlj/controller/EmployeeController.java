package com.zlj.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zlj.biz.DepartmentBiz;
import com.zlj.biz.EmployeeBiz;
import com.zlj.entity.Employee;
import com.zlj.global.Contant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller("employeeController")
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeBiz employeeBiz;

    @Autowired
    private DepartmentBiz departmentBiz;

    @RequestMapping(value = "/list", params = "pageNum")
    public String list(Map<String, Object> map, @RequestParam(value = "pageNum", required = false) String pageNum) {

        int pagenum = Integer.valueOf(pageNum);
        PageHelper.startPage(pagenum, 4);
        List<Employee> employeeList = employeeBiz.getAll();
        PageInfo pageInfo = new PageInfo(employeeList);
        int totalPage = pageInfo.getPages();//总的页数

        map.put("list", employeeList);
        map.put("totalPage", totalPage);
        map.put("pageInfo", pageInfo);

        return "employee_list";
    }


    @RequestMapping(value="/listByDepartmentName",params = "pageNum")
    public String listByDepartmentName(HttpSession session,Map<String, Object> map, @RequestParam(value = "pageNum", required = false) String pageNum) {

        Employee employee = (Employee) session.getAttribute("employee");
        String department_name = employee.getDepartment().getName();

        int pagenum = Integer.valueOf(pageNum);
        PageHelper.startPage(pagenum, 4);
        List<Employee> employeeList = employeeBiz.getAllByDepartmentName(department_name);
        PageInfo pageInfo = new PageInfo(employeeList);
        int totalPage = pageInfo.getPages();//总的页数

        map.put("list", employeeList);
        map.put("totalPage", totalPage);
        map.put("pageInfo", pageInfo);

        return "employee_list_byDept";
    }





    @RequestMapping("/to_add")
    public String toAdd(Map<String,Object> map){
        map.put("employee",new Employee());
        map.put("dlist",departmentBiz.getAll());
        map.put("plist", Contant.getPosts());
        return "employee_add";
    }

    @RequestMapping("/add")
    public String add(Employee employee){
        employeeBiz.add(employee);
        return "redirect:list?pageNum=1";
    }

    @RequestMapping(value = "/to_update" ,params = "sn")
    public String toUpdate(String sn,Map<String,Object> map){
        map.put("employee",employeeBiz.get(sn));
        map.put("dlist",departmentBiz.getAll());
        map.put("plist", Contant.getPosts());
        return "employee_update";
    }


    @RequestMapping("/update")
    public String update(Employee employee){
        employeeBiz.edit(employee);
        return "redirect:list";
    }


    @RequestMapping(value="/remove",params="sn")
    public String remove(String sn){
        employeeBiz.remove(sn);
        return "redirect:list";
    }
}
