package com.zlj.dto;

import java.util.List;

public class ChartsDataInfo {
    private List<String> departmentName;
    private List<Integer> totalMoney;
    private String name;

    @Override
    public String toString() {
        return "ChartsDataInfo{" +
                "departmentName=" + departmentName +
                ", totalMoney=" + totalMoney +
                ", name='" + name + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(List<String> departmentName) {
        this.departmentName = departmentName;
    }

    public List<Integer> getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(List<Integer> totalMoney) {
        this.totalMoney = totalMoney;
    }
}
