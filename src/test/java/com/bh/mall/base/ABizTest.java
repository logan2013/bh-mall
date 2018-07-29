package com.bh.mall.base;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bh.mall.bo.IAccountBO;
import com.bh.mall.bo.IUserBO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/applicationContext.xml",
        "classpath:spring/spring_bo.xml" })
public abstract class ABizTest {

    protected Logger logger = LoggerFactory.getLogger(ABizTest.class);

    @Autowired
    IUserBO userBO;

    @Autowired
    IAccountBO accountBO;

}
