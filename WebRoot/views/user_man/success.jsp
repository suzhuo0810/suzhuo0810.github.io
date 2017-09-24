<%@page import="com.spring.model.user_Model"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <style type="text/css">
    	#mydiv input{
    		margin-bottom: 10px;
    	}
    </style>
   <script type="text/javascript" src="js/out-excel.js"></script>
  </head>
  
  <body>
  
  <div class="alert alert-danger hide fade in " id="alert">
	<strong>错误！</strong>用户名或密码不能为空。
</div>
  
  <div id="mydiv">
  	<input class="btn btn-success" data-toggle="modal" data-target="#myModal" type="button" value="新建"/>
	<input class="btn btn-warning" id="updata" type="button"  value="修改" disabled="disabled"/>
	<input class="btn btn-danger" id= "deldata" data-toggle="modal" data-target="#delModal" type="button" value="删除" disabled="disabled"/>
	<input class="btn btn-default" style="float: right;" onclick="javascript:method1('#example','userToos')"  type="button" value="下载当前表格" />
  </div>
    <table id="example" class="display" width="100%">
    <thead>
        <tr>
            <th>用户 I D</th>
            <th>用户账号</th>
            <th>用户密码</th>
            <th>是否管理员</th>
            <th>注册时间</th>
            <th>最后登录时间</th>
        </tr>
    </thead>
    <tbody></tbody>
	</table>
	
	<!-- 新建 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">新建一行数据</h4>
			</div>
	<div class="modal-body">
	<form id="form-table" method="post" action="">
	<div class="form-group">
		<label>用户账号</label>
		<input name="userName" id="add_name" type="text" class="form-control" placeholder="请输入账号" /><br>
		<label>用户密码</label>
		<input name="userPass" id="add_pass" type="password" class="form-control" placeholder="请输入密码" /><br>
		<label>是否管理员</label>
		<select name="userTitle" class="form-control">
			<option>true</option>
			<option>false</option>
		</select><br>
		<div class="modal-footer">
		<input type="button" class="btn btn-success" id="submit"  value="保存" />
		<input type="button" class="btn btn-warning" data-dismiss="modal" value="关闭" />
	</div>
	</div>
</form>
				
</div>
			
</div>
</div>
</div>



<!-- 删除 -->
<div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">删除一行数据</h4>
            </div>
            <div class="modal-body">确定要删除这条信息吗?</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">取消</button>
                <button type="button" id="delbutton" class="btn btn-warning">确定</button>
            </div>
        </div>
    </div>
</div>
	

<!-- 修改 -->
	<div class="modal fade" id="upModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">修改一行数据</h4>
			</div>
	<div class="modal-body">
	<form id="up-table" method="post" action="">
	<div class="form-group">
		<label>用户账号</label>
		<input name="userName" id="userName" type="text" class="form-control" readonly  unselectable="on" /><br>
		<label>用户密码</label>
		<input name="userPass" id="upPass" type="password" class="form-control" placeholder="请输入密码" /><br>
		<label>是否管理员</label>
		<select name="userTitle" id= "userTitle" class="form-control">
			<option>true</option>
			<option>false</option>
		</select><br>
		<div class="modal-footer">
		<input type="button" class="btn btn-success" id="upbutton"  value="修改" />
		<input type="button" class="btn btn-warning" data-dismiss="modal" value="关闭" />
	</div>
	</div>
</form>
				
</div>		
</div>
</div>
</div>

	
	
	
	
	<script type="text/javascript">

		$(document).ready( function () {
    	var table = $("#example").dataTable({
    	"ajax": {"url":"all_Select.do",
    	"dataSrc": ""	},
    	"columns":[
				{"data":"userId"},
				{"data":"userName"},
				{"data":"userPass"},
				{"data":"userTitle"},
				{"data":"userNowDate"},
				{"data":"userLogDate"}
				],
    	"oLanguage": {
				"sLengthMenu": "每页显示 _MENU_ 条记录",
				"sZeroRecords": "对不起，查询不到任何相关数据",
				"sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_条记录",
				"sInfoEmtpy": "找不到相关数据",
				"sInfoFiltered": "数据表中共为 _MAX_ 条记录)",
				"sProcessing": "正在加载中...",
				"sSearch": "搜索",
				"oPaginate": {
				"sFirst": "第一页",
				"sPrevious":" 上一页 ",
				"sNext": " 下一页 ",
				"sLast": " 最后一页 "
			}
		},
	});
				
    	$("#example").removeClass("display");
        $("#example").addClass("table table-striped table-bordered");
    		
    	$("#example tbody").on("click", "tr", function () {
    	$("#deldata,#updata").removeAttr("disabled");
        if ( $(this).is(".selected") ) {
            $(this).removeClass("selected");
        }
        else {
            table.$("tr.selected").removeClass("selected");
            $(this).addClass("selected");
        }
    } );
    //添加
    $("#submit").click(function() {
    	$("#myModal").modal("hide");
    	if($("#add_name").val()=="" || $("#add_pass").val()==""){
    		$("#alert").removeClass("hide");
    		window.setTimeout(function(){
    		$("#alert").addClass("hide");
			},3000);
    	}else{
    		$.ajax({
     		type: "post",
     		url: "add_User.do",
     		datatype: "text",
     		data: $("#form-table").serializeArray(),
     		error: function( e ){
				alert("请求错误，请检查网络!");
     		},
     		success: function( data ){
     			if(data == "error"){
     				alert("用户添加失败!");
     			}else{
     				table.api().ajax.reload();
     			}
     		}
     	});
     	$("#deldata,#updata").attr("disabled","disabled");
    	}
     	$("#form-table")[0].reset();
	});
	//删除
	$("#delbutton").click(function() {
		var userId = null;
		var nTrs = table.fnGetNodes();
     		for (var i = 0; i < nTrs.length; i++) {
				 if($(nTrs[i]).is(".selected")){   
                userId = table.fnGetData(nTrs[i]).userId;     
           }
        } 
    	$("#delModal").modal("hide");
     	$.ajax({
     		type: "post",
     		url: "del_User.do",
     		data: {"userId":userId},
     		error: function( e ){
				alert("请求错误，请检查网络!");
     		},
     		success: function( data ){
     			if(data == "error"){
     				alert("用户删除失败!");
     			}else{
     				table.api().ajax.reload();
     			}
     		}
     	});
     	$("#deldata,#updata").attr("disabled","disabled");
	});
    //修改
    	$("#updata").click(function() {
    	$("#upModal").modal("show");
		var nTrs = table.fnGetNodes();
     		for (var i = 0; i < nTrs.length; i++) {
				 if($(nTrs[i]).is(".selected")){    
                $("#userName").val(table.fnGetData(nTrs[i]).userName);
           }
        } 
	});
    	$("#upbutton").click(function() {
    	$("#upModal").modal("hide");
    	if($("#upPass").val() == ""){
    		$("#alert").removeClass("hide");
    		window.setTimeout(function(){
    		$("#alert").addClass("hide");
			},3000);
    	}else{
    		$.ajax({
     		type: "post",
     		url: "up_User.do",
     		datatype: "text",
     		data: $("#up-table").serializeArray(),
     		error: function( e ){
				alert("请求错误，请检查网络!");
     		},
     		success: function( data ){
     			if(data == "error"){
     				alert("用户修改失败!");
     			}else{
     				table.api().ajax.reload();
     			}
     		}
     	});
     	$("#deldata,#updata").attr("disabled","disabled");
    	}
     	$("#up-table")[0].reset();
	});
    	
    	
} );
	</script>
	
  </body>
</html>
