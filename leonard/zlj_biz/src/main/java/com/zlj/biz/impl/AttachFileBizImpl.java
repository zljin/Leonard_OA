package com.zlj.biz.impl;

import com.zlj.biz.AttachFileBiz;
import com.zlj.dao.AttachFileDao;
import com.zlj.entity.AttachFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("attachFileBiz")
public class AttachFileBizImpl implements AttachFileBiz {

    @Autowired
    @Qualifier("attachFileDao")
    private AttachFileDao attachFileDao;

    @Override
    public void insert(AttachFile attachFile) {
        attachFileDao.insert(attachFile);
    }

    @Override
    public AttachFile select(Integer cid) {
        return attachFileDao.select(cid);
    }
}
