package com.bh.mall.ao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bh.mall.ao.ICartAO;
import com.bh.mall.bo.IAgentPriceBO;
import com.bh.mall.bo.ICartBO;
import com.bh.mall.bo.IProductBO;
import com.bh.mall.bo.ISpecsBO;
import com.bh.mall.bo.base.Paginable;
import com.bh.mall.core.EGeneratePrefix;
import com.bh.mall.core.OrderNoGenerater;
import com.bh.mall.core.StringValidater;
import com.bh.mall.domain.AgentPrice;
import com.bh.mall.domain.Cart;
import com.bh.mall.domain.Product;
import com.bh.mall.domain.Specs;
import com.bh.mall.exception.BizException;

@Service
public class CartAOImpl implements ICartAO {

    @Autowired
    ICartBO cartBO;

    @Autowired
    IProductBO productBO;

    @Autowired
    ISpecsBO specsBO;

    @Autowired
    IAgentPriceBO agentPriceBO;

    @Override
    public String addCart(String userId, String specsCode, String quantity) {

        if (StringValidater.toInteger(quantity) <= 0) {
            throw new BizException("xn00000", "添加数量不能少于零");
        }

        Cart data = cartBO.getCartByProductCode(userId, specsCode);
        AgentPrice specsPrice = agentPriceBO.getPriceByLevel(specsCode, 6);

        String code = OrderNoGenerater.generate(EGeneratePrefix.Cart.getCode());
        if (data != null) {
            code = data.getCode();
            data.setQuantity(
                data.getQuantity() + StringValidater.toInteger(quantity));
            cartBO.refreshCart(data);
        } else {
            data = new Cart();
            data.setCode(code);
            data.setUserId(userId);

            data.setProductCode(data.getProductCode());
            data.setSpecsCode(specsCode);
            data.setQuantity(StringValidater.toInteger(quantity));
            data.setPrice(specsPrice.getPrice());
            cartBO.saveCart(data);
        }

        return code;
    }

    @Override
    public void editCart(String code, String quantity) {
        Cart data = cartBO.getCart(code);
        // Product pData = productBO.getProduct(data.getProductCode());
        // if (pData.getRealNumber() < StringValidater.toInteger(quantity)
        // || StringValidater.toInteger(quantity) < 0) {
        // throw new BizException("xn00000", "产品数量不足或小于零");
        // }
        data.setQuantity(StringValidater.toInteger(quantity));
        cartBO.refreshCart(data);
    }

    @Override
    public void dropCart(List<String> list) {
        for (String code : list) {
            Cart data = cartBO.getCart(code);
            cartBO.removeCart(data);
        }
    }

    @Override
    public Paginable<Cart> queryCartPage(int start, int limit, Cart condition) {
        Paginable<Cart> page = cartBO.getPaginable(start, limit, condition);
        for (Cart data : page.getList()) {
            Product product = productBO.getProduct(data.getProductCode());
            data.setProduct(product);
            Specs specs = specsBO.getSpecs(data.getSpecsCode());
            data.setSpecsName(specs.getName());
        }
        return page;
    }

    @Override
    public List<Cart> queryCartList(Cart condition) {
        return cartBO.queryCartList(condition);
    }

    @Override
    public Cart getCart(String code) {
        Cart data = cartBO.getCart(code);
        Product product = productBO.getProduct(data.getProductCode());
        data.setProduct(product);
        Specs specs = specsBO.getSpecs(data.getSpecsCode());
        data.setSpecsName(specs.getName());
        return data;
    }

    @Override
    public Product getCartProduct(String productSpecsCode) {
        Specs psData = specsBO.getSpecs(productSpecsCode);
        List<Specs> list = new ArrayList<Specs>();
        list.add(psData);
        Product data = productBO.getProduct(psData.getProductCode());
        data.setSpecsList(list);
        return data;
    }

}
