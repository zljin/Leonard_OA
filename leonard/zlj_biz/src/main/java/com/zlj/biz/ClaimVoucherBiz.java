package com.zlj.biz;

import com.zlj.entity.ClaimVoucher;
import com.zlj.entity.ClaimVoucherItem;
import com.zlj.entity.DealRecord;
import org.springframework.stereotype.Service;

import java.util.List;

//报销单业务功能
public interface ClaimVoucherBiz {

    //填写报销单
    void save(ClaimVoucher claimVoucher, List<ClaimVoucherItem> items);

    //展示报销单的三大内容:看页面
    ClaimVoucher get(int id);
    List<ClaimVoucherItem> getItems(int cvid);
    List<DealRecord> getRecords(int cvid);


    //查看自己的报销单
    List<ClaimVoucher> getForSelf(String sn);

    //查看待处理报销单
    List<ClaimVoucher> getForDeal(String sn);


    //更新报销单
    void update(ClaimVoucher claimVoucher, List<ClaimVoucherItem> items);

    //提交报销单
    void submit(int id);

    //打款
    void deal(DealRecord dealRecord);

}
