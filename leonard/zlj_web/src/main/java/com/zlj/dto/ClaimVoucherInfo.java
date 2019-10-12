package com.zlj.dto;

import com.zlj.entity.ClaimVoucher;
import com.zlj.entity.ClaimVoucherItem;

import java.util.List;

//dto:将service提供的数据进行封装,给页面提供使用的bean对象
//这个类的对象封装将专门给页面使用
public class ClaimVoucherInfo {

    private ClaimVoucher claimVoucher;
    private List<ClaimVoucherItem> items;

    public ClaimVoucher getClaimVoucher() {
        return claimVoucher;
    }

    public void setClaimVoucher(ClaimVoucher claimVoucher) {
        this.claimVoucher = claimVoucher;
    }

    public List<ClaimVoucherItem> getItems() {
        return items;
    }

    public void setItems(List<ClaimVoucherItem> items) {
        this.items = items;
    }

}
