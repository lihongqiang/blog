<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.blog.dao.ArticleDao,com.blog.dto.Article" %>

<% 
  String   list_con = "",part_msg = "",spage = "";
  spage =request.getParameter("pg"); //获取传递来的参数
  String  total = "";
  String  current = "";
  String  totalpage = "";
  
  int      up=1,down=1;  
  int      pgSize = 30; //每页显示的条数
  int      cpage = 0;    //当前显示的条数
  
  if(spage!=null){
      cpage = Integer.parseInt(spage);				
   }
  ArticleDao  dao = new ArticleDao();
  
  List     list =  dao.getList(cpage,pgSize);           
  Iterator  it = list.iterator();
  while(it.hasNext()){
     Article  l = (Article)it.next();
     list_con += "<tr align='center'  height='25'><td><a href='../show_art.jsp?id="+l.getId()+"' target=\"_blank\">"+l.getTitle()+"</a></td><td>"+l.getSort()+"</td><td>"+l.getPubtime()+"</td>"
              + "<td><a href='A_update.jsp?id="+l.getId()+"'>修改</a> | <a href='/BlogVer1_0/article?action=delete&id="+l.getId()+"' >删除</a> </td></tr> \n";
    // System.out.println(list_con);
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

  part_msg = "共"+total+"条数据，分"+totalpage+"页，当前为第"+current+"页 <a href='A_list.jsp?pg="+up+"'> 上一页</a> <a href='A_list.jsp?pg="+down+"'>下一页 </a>";
  
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>内容页面</title>
    <link href="Css/Style.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  
   <table width="100%" cellpadding="0" class="Table1" bordercolor="#4ab902" border="1" cellspacing="0">
      <tr align='center'  height='30'>
      <th>标题</th>
      <th>类别</th>
      <th>日期</th>
       <th>管理操作</th></tr>
       <%=list_con %>
      </table>
      <br/>
      <%=part_msg %>
      
  </body>
</html>
