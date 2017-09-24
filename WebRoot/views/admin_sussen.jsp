<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>信息管理系统</title>
	
    <!-- CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
    <link href="css/dashboard.css" type="text/css" rel="stylesheet">
    <!-- JS -->
     <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/holder/2.9.2/holder.min.js"></script>
	<script type="text/javascript" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
   <script type="text/javascript" src="js/admin_sussen.js"></script>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">欢迎您  :  ${user }</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right ">
            <li><a href="#">注销</a></li>
            <li><a href="#">设置</a></li>
            <li><a href="#">关于</a></li>
            <li><a href="#">帮助</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active" id="defli"><a>用户管理</a></li>
            <li id="studli"><a>学生管理</a></li>
            <li id="courli"><a>课程管理</a></li>
            <li id="currli"><a>选课管理</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li id="dowli"><a>下载记录</a></li>

          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <div id="table-responsive">
          
          
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
