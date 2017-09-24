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
	<strong>错误！</strong>所有信息均不能为空。
</div>
  
  <div id="mydiv">
  	<input class="btn btn-success" data-toggle="modal" data-target="#myModal" type="button" value="新建"/>
	<input class="btn btn-warning" id="updata" type="button"  value="修改" disabled="disabled"/>
	<input class="btn btn-danger" id= "deldata" data-toggle="modal" data-target="#delModal" type="button" value="删除" disabled="disabled"/>
	<input class="btn btn-default" style="float: right;" onclick="javascript:method1('#example','studentToos')"  type="button" value="下载当前表格" />
  </div>
    <table id="example" class="display" width="100%">
    <thead>
        <tr>
            <th>学生学号</th>
            <th>学生姓名</th>
            <th>身份证号</th>
            <th>学生性别</th>
            <th>学生系别</th>
            <th>入学时间</th>
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
		<label>学生学号</label>
		<input type="text" name="studentNumber" id="add_Number" class="form-control" placeholder="请输入学号" /><br>
		<label>学生姓名</label>
		<input type="text" name="studentName" id="add_Name" class="form-control" placeholder="请输入姓名" /><br>	
		<label>身份证号</label>
		<input type="text" name="studentCard" id="add_Card" class="form-control" placeholder="请输入身份证" /><br>
		<label>学生性别</label>
		<select class="form-control" name="studentSex" id="add_Sex">
			<option>男</option>
			<option>女</option>
		</select><br>
		<label>学生系别</label>
		<select class="form-control" name="studentTie" id="add_Tie">
			<option>信息工程系</option>
			<option>机电工程系</option>
			<option>电子工程系</option>
			<option>经济管理系</option>
			<option>电气工程系</option>
			<option>汽车工程系</option>
			<option>数字艺术系</option>
		</select><br>
		<label>入学时间</label>
        <select class="form-control" name="studentDate" id="add_Date">
			<option>2010-09-01</option>
			<option>2011-09-01</option>
			<option>2012-09-01</option>
			<option>2013-09-01</option>
			<option>2014-09-01</option>
			<option>2015-09-01</option>
			<option>2016-09-01</option>
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
		<label>学生学号</label>
		<input type="text" name="studentNumber" id="up_Number" class="form-control" readonly /><br>
		<label>学生姓名</label>
		<input type="text" name="studentName" id="up_Name" class="form-control" placeholder="请输入姓名" /><br>	
		<label>身份证号</label>
		<input type="text" name="studentCard" id="up_Card" class="form-control" placeholder="请输入身份证" /><br>
		<label>学生性别</label>
		<select class="form-control" name="studentSex" id="" >
			<option>男</option>
			<option>女</option>
		</select><br>
		<label>学生系别</label>
		<select class="form-control" name="studentTie" id="" >
			<option>信息工程系</option>
			<option>机电工程系</option>
			<option>电子工程系</option>
			<option>经济管理系</option>
			<option>电气工程系</option>
			<option>汽车工程系</option>
			<option>数字艺术系</option>
		</select><br>
		<label>入学时间</label>
        <select class="form-control" name="studentDate" id="" >
			<option>2010-09-01</option>
			<option>2011-09-01</option>
			<option>2012-09-01</option>
			<option>2013-09-01</option>
			<option>2014-09-01</option>
			<option>2015-09-01</option>
			<option>2016-09-01</option>
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
    	"ajax": {"url":"all_Student.do",
    	"dataSrc": ""	},
    	"columns":[
				{"data":"studentNumber"},
				{"data":"studentName"},
				{"data":"studentCard"},
				{"data":"studentSex"},
				{"data":"studentTie"},
				{"data":"studentDate"}
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
    	if($("#add_Number").val()=="" || $("#add_Name").val()=="" || $("#add_Card").val()==""){
    		$("#alert").removeClass("hide");
    		window.setTimeout(function(){
    		$("#alert").addClass("hide");
			},3000);
    	}else{
    		$.ajax({
     		type: "post",
     		url: "add_Student.do",
     		datatype: "text",
     		data: $("#form-table").serializeArray(),
     		error: function( e ){
				alert("请求错误，请检查网络!");
     		},
     		success: function( data ){
     			if(data == "error"){
     				alert("学生添加失败!");
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
		var studentNumber = null;
		var nTrs = table.fnGetNodes();
     		for (var i = 0; i < nTrs.length; i++) {
				 if($(nTrs[i]).is(".selected")){   
                studentNumber = table.fnGetData(nTrs[i]).studentNumber;     
           }
        } 
    	$("#delModal").modal("hide");
     	$.ajax({
     		type: "post",
     		url: "del_Student.do",
     		data: {"studentNumber":studentNumber},
     		error: function( e ){
				alert("请求错误，请检查网络!");
     		},
     		success: function( data ){
     			if(data == "error"){
     				alert("学生删除失败!");
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
                $("#up_Number").val(table.fnGetData(nTrs[i]).studentNumber);
                $("#up_Name").val(table.fnGetData(nTrs[i]).studentName);
                $("#up_Card").val(table.fnGetData(nTrs[i]).studentCard);
           }
        } 
	});
    	$("#upbutton").click(function() {
    	$("#upModal").modal("hide");
    	if($("#up_Number").val()=="" || $("#up_Name").val()=="" || $("#up_Card").val()==""){
    		$("#alert").removeClass("hide");
    		window.setTimeout(function(){
    		$("#alert").addClass("hide");
			},3000);
    	}else{
    		$.ajax({
     		type: "post",
     		url: "up_Student.do",
     		datatype: "text",
     		data: $("#up-table").serializeArray(),
     		error: function( e ){
				alert("请求错误，请检查网络!");
     		},
     		success: function( data ){
     			if(data == "error"){
     				alert("学生修改失败!");
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
