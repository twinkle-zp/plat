package com.plat.controller;

import com.alibaba.fastjson.JSON;
import com.plat.entity.Activity;
import com.plat.entity.ActivityCategory;
import com.plat.entity.Goods;
import com.plat.entity.User;
import com.plat.service.ActivityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/activity")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @RequestMapping("/findCategory")
    public void findCategory(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        List<ActivityCategory> categoryList = activityService.findAll();
        String json = JSON.toJSONString(categoryList);
        response.setCharacterEncoding("utf-8");
        PrintWriter writer = response.getWriter();
        writer.write(json);
        writer.flush();
    }

    @RequestMapping("/add")
    public String add(HttpServletRequest request, HttpServletResponse response, Model model){
        String name = request.getParameter("name");
        String categoryid = request.getParameter("category");
        String address = request.getParameter("address");
        String content = request.getParameter("content");
        User user = (User)request.getSession().getAttribute("user");
        Activity activity = new Activity();
        activity.setUid(user.getUid());
        activity.setCid(Integer.valueOf(categoryid));
        activity.setAddress(address);
        activity.setName(name);
        activity.setContent(content);
        activityService.add(activity);
        return null;
    }
}