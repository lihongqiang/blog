package com.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.dao.UserDao;
import com.blog.dto.User;

public class UserServlet extends HttpServlet{
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
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	String subject = request.getParameter("subject");
    	String email = request.getParameter("email");
    	String image = request.getParameter("image");
    	int intid = 0;
    	
    	
    	int opt = 0; //�������   1,add  2,update  3,delete
    	int f = 0; //�жϲ���
    
    	if("add".equals(action)){
    		opt = 1;
    	}else if("update".equals(action)){
    		opt = 2;
    	}else if("delete".equals(action)){
    		opt = 3;
    	}
    	User  user = null;
    	UserDao   dao = new UserDao(); //�������ݿ��������
    	
    	switch(opt){
    	case  1: 
    		user = new User(intid,username,password,subject,email,image,1);//ʵ����bean����    	
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
    		user = new User(intid,username,password,subject,email,image,1);//ʵ����bean����    	
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
    	out.println("<script language=\"javascript\">alert(\" "+msg+" \");self.location='admin/U_list.jsp'; </script>"); //�������  
    }
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws
    ServletException,IOException{
    	this.doGet(request, response);
    }
}
