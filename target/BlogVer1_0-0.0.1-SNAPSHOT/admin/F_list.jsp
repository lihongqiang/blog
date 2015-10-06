<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.blog.dao.FeedbackDao,com.blog.dto.Feedback" %>

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
  FeedbackDao  dao = new FeedbackDao();
  
  List     list =  dao.getList(cpage,pgSize);           
  Iterator  it = list.iterator();
  while(it.hasNext()){
     Feedback  l = (Feedback)it.next();
     list_con += "<tr align='center'  height='25'><td>"+l.getId()+"</td><td>"+l.getArticleid()+"</td><td>"+l.getUname()+"</td><td>"
              +l.getIp()+"</td><td>"+l.getPubtime()+"</td> <td> <a href='/BlogVer1_0/feedback?action=delete&id="+l.getId()+"' >删除</a> </td></tr> \n";
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

  part_msg = "共"+total+"条数据，分"+totalpage+"页，当前为第"+current+"页 <a href='F_list.jsp?pg="+up+"'> 上一页</a> <a href='F_list.jsp?pg="+down+"'>下一页 </a>";
  
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
      <th>ID</th>
      <th>文章ID</th>
      <th>昵称</th>
      <th>ip地址</th>
      <th>发布日期</th>
       <th>删除评论</th></tr>
       <%=list_con %>
      </table>
      <br/>
      <%=part_msg %>
      
  </body>
</html>
