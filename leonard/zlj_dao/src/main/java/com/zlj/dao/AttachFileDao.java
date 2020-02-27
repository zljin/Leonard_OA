package com.zlj.dao;

import com.zlj.entity.AttachFile;
import org.springframework.stereotype.Repository;

@Repository("attachFileDao")
public interface AttachFileDao {
    void insert(AttachFile attachFile);
    AttachFile select(Integer cid);
}
