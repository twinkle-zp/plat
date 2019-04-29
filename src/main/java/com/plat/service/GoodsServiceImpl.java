package com.plat.service;

import com.plat.dao.GoodsMapper;
import com.plat.entity.Goods;
import com.plat.entity.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    public void add(Goods goods) {

        Date date = new Date();//获得系统时间.
        SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd " );
        String nowTime = sdf.format(date);
        Date time = null;
        try {
            time = sdf.parse(nowTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        goods.setDate(time);
        goods.setFlag(0);
        int ok = goodsMapper.insert(goods);

    }

    public Page findList(String currPage) {
        if(currPage==null)
        {
            currPage = "1";
        }
        Page result = new Page();
        int totalCount = goodsMapper.getTotalCount();

        result.setTotalCount(totalCount);
        result.setCurrPage(Integer.valueOf(currPage));

        List<Goods> list = goodsMapper.findPage(result.getBeginRows(),result.getPageSize());
        result.setList(list);
        return result;
    }

    public Goods findById(Integer id) {
        return goodsMapper.selectByPrimaryKey(id);
    }
}