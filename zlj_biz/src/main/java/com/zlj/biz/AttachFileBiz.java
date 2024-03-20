package com.zlj.biz;

import com.zlj.entity.AttachFile;

public interface AttachFileBiz {
    void insert(AttachFile attachFile);
    AttachFile select(Integer cid);
}
