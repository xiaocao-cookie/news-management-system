package com.zhang.service.impl;

import com.zhang.dao.AdvertiseMapper;
import com.zhang.service.AdvertiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdvertiseServiceImpl implements AdvertiseService {

    @Autowired
    public AdvertiseMapper advertiseMapper;
}
