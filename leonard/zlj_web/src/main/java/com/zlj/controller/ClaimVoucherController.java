package com.zlj.controller;

import com.zlj.biz.AttachFileBiz;
import com.zlj.biz.ClaimVoucherBiz;
import com.zlj.dto.ClaimVoucherInfo;
import com.zlj.entity.AttachFile;
import com.zlj.entity.DealRecord;
import com.zlj.entity.Employee;
import com.zlj.entity.StatisResult;
import com.zlj.global.Contant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

@Controller("claimVoucherController")
@RequestMapping("/claim_voucher")
public class ClaimVoucherController{

    @Autowired
    private ClaimVoucherBiz claimVoucherBiz;

    @Autowired
    private AttachFileBiz attachFileBiz;

    @RequestMapping("/to_add")
    public String toAdd(Map<String,Object> map){
        map.put("items", Contant.getItems());
        map.put("info",new ClaimVoucherInfo());
        return "claim_voucher_add";
    }

    @RequestMapping("/add")
    public String add(HttpSession session,ClaimVoucherInfo info,MultipartFile file) throws IOException {
        Employee e = (Employee)session.getAttribute("employee");
        info.getClaimVoucher().setCreateSn(e.getSn());
        claimVoucherBiz.save(info.getClaimVoucher(),info.getItems());

        if(!file.isEmpty()){
            this.up(file,session,info);
        }

        return "redirect:deal";//return "redirect:detail?id="+info.getClaimVoucher().getId();
    }

    public void up(MultipartFile file,HttpSession session,ClaimVoucherInfo info) throws IOException {
        String path = session.getServletContext().getRealPath("upload");//下载图片的地址
        int index = info.getClaimVoucher().getId();
        String fileName = index+"_"+ file.getOriginalFilename();
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        file.transferTo(dir);

        AttachFile attachFile = new AttachFile();
        attachFile.setFilename(fileName);
        attachFile.setPath(path);
        attachFile.setCid(index);
        attachFileBiz.insert(attachFile);
    }

    @RequestMapping("/download")
    public void download(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String cid = request.getParameter("cid");
        int ccid = Integer.valueOf(cid);
        AttachFile attachFile = attachFileBiz.select(Integer.valueOf(ccid));
        if(attachFile!=null) {
            String fileName = attachFile.getPath() + "/" + attachFile.getFilename();
            InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
            String filename = "附件下载.jpg";

            filename = URLEncoder.encode(filename, "UTF-8");
            response.addHeader("Content-Disposition", "attachment;filename=" + filename);
            response.setContentType("multipart/form-data");

            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
            int len = 0;
            while ((len = bis.read()) != -1) {
                out.write(len);
                out.flush();
            }
            out.close();
        }else{
            response.sendRedirect(request.getContextPath()+"/claim_voucher/detail?id="+ccid);
        }
    }


    @RequestMapping("/detail")
    public String detail(int id,Map<String,Object> map){
        map.put("claimVoucher",claimVoucherBiz.get(id));
        map.put("items",claimVoucherBiz.getItems(id));
        map.put("records",claimVoucherBiz.getRecords(id));
        return "claim_voucher_detail";
    }

    @RequestMapping("/self")
    public String self(HttpSession session,Map<String,Object> map){
        Employee e = (Employee)session.getAttribute("employee");
        map.put("list",claimVoucherBiz.getForSelf(e.getSn()));
        return "claim_voucher_self";
    }

    @RequestMapping("/deal")
    public String deal(HttpSession session,Map<String,Object> map){
        Employee e = (Employee)session.getAttribute("employee");
        map.put("list",claimVoucherBiz.getForDeal(e.getSn()));
        return "claim_voucher_deal";
    }


    @RequestMapping("/to_update")
    public String toUpdate(int id,Map<String,Object> map){
        map.put("items", Contant.getItems());
        ClaimVoucherInfo info = new ClaimVoucherInfo();
        info.setClaimVoucher(claimVoucherBiz.get(id));
        info.setItems(claimVoucherBiz.getItems(id));
        map.put("info",info);
        return "claim_voucher_update";
    }

    @RequestMapping("/update")
    public String update(HttpSession session,ClaimVoucherInfo info){
        Employee e = (Employee)session.getAttribute("employee");
        info.getClaimVoucher().setCreateSn(e.getSn());
        claimVoucherBiz.update(info.getClaimVoucher(),info.getItems());
        return "redirect:deal";
    }

    @RequestMapping("/submit")
    public String submit(int id){
        claimVoucherBiz.submit(id);
        return "redirect:deal";
    }

    @RequestMapping("/to_check")
    public String toCheck(int id,Map<String,Object> map){
        map.put("claimVoucher",claimVoucherBiz.get(id));
        map.put("items",claimVoucherBiz.getItems(id));
        map.put("records",claimVoucherBiz.getRecords(id));
        DealRecord dealRecord =new DealRecord();
        dealRecord.setClaimVoucherId(id);
        map.put("record",dealRecord);
        return "claim_voucher_check";
    }
    @RequestMapping("/check")
    public String check(HttpSession session, DealRecord dealRecord){
        Employee employee = (Employee)session.getAttribute("employee");
        dealRecord.setDealSn(employee.getSn());
        claimVoucherBiz.deal(dealRecord);
        return "redirect:deal";
    }

    @RequestMapping(value = "/upfile",method = RequestMethod.POST)
    @ResponseBody
    public String upfile(MultipartFile file, HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }

        file.transferTo(dir);
        return fileName;
    }

    @RequestMapping("/downfile")
    public void downfile(HttpServletRequest request, HttpServletResponse response) throws IOException{

        String fileName = request.getSession().getServletContext().getRealPath("upload")+"/报销单.jpg";
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        String filename = "下载文件.jpg";

        filename = URLEncoder.encode(filename,"UTF-8");
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        response.setContentType("multipart/form-data");

        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }

    @RequestMapping(value = "/statistics")
    public String statistics(Map<String,String> map){
        List<StatisResult> sr = claimVoucherBiz.calculateStatis();
        StringBuffer sb = new StringBuffer();
        sb.append("[");
        for(int i = 0;i<sr.size();i++){
            if(i==sr.size()-1){
                sb.append(sr.get(i).getTotal()+"]");
            }else{
                sb.append(sr.get(i).getTotal()+",");
            }
        }
        map.put("total",sb.toString());
        sb.setLength(0);
        sb.append("[");
        for(int i = 0;i<sr.size();i++){
            if(i==sr.size()-1){
                sb.append("'"+sr.get(i).getDepartName()+"'"+"]");
            }else{
                sb.append("'"+sr.get(i).getDepartName()+"'"+",");
            }
        }
        map.put("deptname",sb.toString());
        return "claim_voucher_statistics";
    }
}
