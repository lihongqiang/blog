<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.blog.dao.LinkDao,com.blog.dto.Link" %>

<% 
  String   list_con = "",part_msg = "",spage = "",type_str="";
  spage =request.getParameter("pg"); //获取传递来的参数
  String  total = "";
  String  current = "";
  String  totalpage = "";
  LinkDao  dao = new LinkDao();
  
  int      up=1,down=1;  
  int      pgSize = 10; //每页显示的条数
  int      cpage = 0;    //当前显示的条数
  
  if(spage!=null){
      cpage = Integer.parseInt(spage);				
   }  
  List     lista =  dao.getList(cpage,pgSize);           
  Iterator  ita = lista.iterator();
  while(ita.hasNext()){
     Link  l = (Link)ita.next();
     list_con +=  "<li><a href='"+l.getUrl()+"' target=\"_blank\">"+ l.getName() +"</a></li>";			  			
  }
  
  total = new Integer(dao.getTotal()).toString();
  current = new Integer(dao.getCPages()).toString();
  totalpage = new Integer(dao.getTPages()).toString();
  
  //分页运算
  up = dao.getCPages()-1;
  down = dao.getCPages()+1;    
  if(up<1){
     up = 1;
  }  
  if(down>=dao.getTPages()){
     down = dao.getTPages();
  }    
  part_msg = "共"+total+"条数据，分"+totalpage+"页，当前为第"+current+"页 <a href='link.jsp?pg="+up+"'> 上一页</a> <a href='link.jsp?pg="+down+"'>下一页 </a>";
  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>友情链接_红色玫瑰</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="wrapper">
<!-- start header -->
<div id="header">
	<h1>红色玫瑰 </h1>
	<p>Red Roses </p>
</div>
<!-- end header -->
<%@include file="dh.jsp"  %>
<!-- start page -->
<div id="page">
	<!-- start content -->
	<div id="content">
		<div class="post">
			<h1 class="title">友情链接</h1>			
			<div class="entry">
				<p> 
				 <%=list_con %>				
                </p>
                <p class="meta"><%=part_msg  %></p>
			</div>			
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
