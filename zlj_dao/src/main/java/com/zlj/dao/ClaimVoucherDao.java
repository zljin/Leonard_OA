package com.zlj.dao;

import com.zlj.entity.ClaimVoucher;
import com.zlj.entity.StatisResult;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("claimVoucherDao")
public interface ClaimVoucherDao {

    void insert(ClaimVoucher claimVoucher);
    void update(ClaimVoucher claimVoucher);
    void delete(int id);
    ClaimVoucher select(int id);

    //查询一个员工所创建的所有报销单
    List<ClaimVoucher> selectByCreateSn(String csn);
    //查询某一个员工能够处理的所有报销单
    List<ClaimVoucher> selectByNextDealSn(String ndsn);

    //统计部门费用
    List<StatisResult> calculateStatis();

}
