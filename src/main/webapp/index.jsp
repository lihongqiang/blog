<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.blog.dao.ArticleDao,com.blog.dto.Article" %>

<% 
  String      list_con = "";
  ArticleDao  dao = new ArticleDao();
  
  List     lista =  dao.getList(0,10);           
  Iterator  ita = lista.iterator();
  while(ita.hasNext()){
     Article  l = (Article)ita.next();
     list_con +=  "<h2 class=\"title\"><a href='show_art.jsp?id="+l.getId()+"'>"+l.getTitle()+"</a></h2>"
			   +" <p class=\"byline\"><small>日期:"+l.getPubtime()+" </small></p>"
		       +" <div class=\"entry\"> "
			   +"<blockquote><p>&#8220;"+l.getContent()+" &#8221;</p></blockquote></div>";				
  }
  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>博客</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="wrapper">
<!-- start header -->
<div id="header">
	<h1>个人博客 </h1>
	<p>Red Roses Blog</p>
</div>
<!-- end header -->
<%@include file="dh.jsp"  %>
<!-- start page -->
<div id="page">
	<!-- start content -->
	<div id="content">
		<div class="post">
			<h1 class="title">关于本站</h1>
			<p class="byline"><small>Posted on October 6th, 2015 by <a href="#">lhq</a> | <a href="#">Edit</a></small></p>
			<div class="entry">
				<p> 
				   这是第一个的博客，不知道说什么，先这样吧。
                </p>
			</div>
			<p class="meta"><a href="list_article.jsp" class="more">最新文章列表</a> </p>
		</div>
		<div class="post">
			<%=list_con  %>
			<p class="meta"><a href="list_article.jsp" class="more">最新文章列表</a> </p>
		</div>
	</div>
	<!-- end content -->
	<!-- start sidebar -->
	<%@include file="left.jsp" %>
	<!-- end sidebar -->
</div>
</div>
<!-- end page -->
<%@include file="bottom.jsp" %>
</body>
</html>
