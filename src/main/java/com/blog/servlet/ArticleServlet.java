package com.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.dao.ArticleDao;
import com.blog.dto.Article;


public class ArticleServlet extends HttpServlet{
    public void init(ServletConfig config)throws ServletException{
    	
    }
    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws
    ServletException,IOException{
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        
    	PrintWriter  out = response.getWriter();
    	String   msg = "";    	
    	String action = request.getParameter("action"); //ҳ����������
    	String id = request.getParameter("id");
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	String pubtime = request.getParameter("pubtime");
    	String sortid = request.getParameter("sortid");
    	String blogid = request.getParameter("blogid");
    //	System.out.println("------sortid--"+sortid);
    	
    	int intid = 0,bid=0,sid=0;
    	
    	
    	int opt = 0; //�������   1,add  2,update  3,delete
    	int f = 0;   //�жϲ���
    
    	if("add".equals(action)){
    		opt = 1;
    	}else if("update".equals(action)){
    		opt = 2;
    	}else if("delete".equals(action)){
    		opt = 3;
    	}
    	Article  user =  null;
    	ArticleDao   dao = new ArticleDao(); //�������ݿ��������
    	
    	switch(opt){
    	case  1:
    		if(blogid!=null||blogid!=""){
    			System.out.println("blog = "+blogid);
        		bid = Integer.parseInt(blogid);
        	}
        	if(sortid!=null||sortid!=""){
        		sid = Integer.parseInt(sortid);
        	}
    		  user =  new Article();//ʵ����bean����   
    		  System.out.println(bid + ' ' + content + ' ' + pubtime + ' ' + sid + ' ' + title);
    		  user.setBlogid(bid);
    		  user.setContent(content);
    		  user.setPubtime(pubtime);
    		  user.setSortid(sid);
    		  user.setTitle(title);
    		  
    		  f = dao.add(user);
    		  if(f>0){
    			  msg ="��ӳɹ�!";
    		  }else{
    			  msg ="���ʧ��!";
    		  }
    		  break;
    	case  2:
    		if(id!=null||id!=""){
        		intid = Integer.parseInt(id);
        	}
        	if(sortid!=null||sortid!=""){
        		sid = Integer.parseInt(sortid);
        	}
        	
        	  user =  new Article();//ʵ����bean����    	
        	  user.setId(intid);
        	  user.setContent(content);
        	  user.setPubtime(pubtime);
        	  user.setSortid(sid);
        	  user.setTitle(title);
        	  
    		  f = dao.update(user);
		      if(f>0){
			     msg ="�޸ĳɹ�!";
		      }else{
			     msg ="�޸�ʧ��!";
		      } 
		      break;
    	case  3:
    		if(id!=null||id!=""){
        		intid = Integer.parseInt(id);
        	}
    		f = dao.delete(intid);
		     if(f>0){
			     msg ="ɾ���ɹ�!";
		      }else{
			     msg ="ɾ��ʧ��!";
		      }  
		      break;
        default :msg = "�������㣬����ʧ��!"; break;
    	}
    	out.println("<script language=\"javascript\">alert(\" "+msg+" \");self.location='admin/A_list.jsp'; </script>"); //�������  
    }
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws
    ServletException,IOException{
    	this.doGet(request, response);
    }
}
