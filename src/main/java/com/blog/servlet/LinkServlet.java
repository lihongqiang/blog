package com.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.dao.LinkDao;
import com.blog.dto.Link;


public class LinkServlet extends HttpServlet{
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
    	String name = request.getParameter("name");
    	String url = request.getParameter("url");
    	String blogid = request.getParameter("blogid");
    	int intid = 0,bid=0;
    	
    	int opt = 0; //�������   1,add  2,update  3,delete
    	int f = 0; //�жϲ���
    
    	if("add".equals(action)){
    		opt = 1;
    	}else if("update".equals(action)){
    		opt = 2;
    	}else if("delete".equals(action)){
    		opt = 3;
    	}
    	Link  user = null;
    	LinkDao   dao = new LinkDao(); //�������ݿ��������
    	
    	switch(opt){
    	case  1:
    		if(blogid!=null||blogid!=""){
    		  bid = Integer.parseInt(blogid);
    	    } 
    		user =  new Link(bid,intid,name,url);//ʵ����bean����    	
    		f = dao.add(user);
    		  if(f>0){
    			  msg ="��ӳɹ�!";
    		  }else{
    			  msg ="���ʧ��!";
    		  }
    		  break;
    	case  2:
    		if(id!=null||!id.equals("null")){
        		intid = Integer.parseInt(id);
        	}
    		if(blogid!=null||blogid!=""){
        		bid = Integer.parseInt(blogid);
        	}
    		user =  new Link(bid,intid,name,url);//ʵ����bean����    	
    		f = dao.update(user);
		      if(f>0){
			     msg ="�޸ĳɹ�!";
		      }else{
			     msg ="�޸�ʧ��!";
		      } 
		      break;
    	case  3:
    		if(id!=null||!id.equals("null")){
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
    	out.println("<script language=\"javascript\"> alert(\" "+msg+" \");self.location='admin/L_list.jsp'; </script>"); //�������  
    }
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws
    ServletException,IOException{
    	this.doGet(request, response);
    }
}
