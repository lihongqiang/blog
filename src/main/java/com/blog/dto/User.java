package com.blog.dto;

public class User {

//	���                 id		    int    
//	�û���	  username	    VARCHAR (20) 	
//	����                 password	    VARCHAR (20) 	
//	���ͱ���	  subject		VARCHAR (100)  	
//	�����ʼ�	  email		    VARCHAR (50) 
//	ͷ��	      image	  	    VARCHAR (100)
//	���ʴ���	  visitcount    int  
	
	private   int     id;
	private   String  username;
	private   String  password;
	private   String  subject;
	private   String  email;
	private   String  image;
	private   int      visitcount;
	
	public User(){
		
	}
	
	public User(int id,String username,String password,String subject, 
			String email,String image,int visitcount) {
	super();
	this.email = email;
	this.id = id;
	this.image = image;
	this.password = password;
	this.subject = subject;
	this.username = username;
	this.visitcount = visitcount;
}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}
}
