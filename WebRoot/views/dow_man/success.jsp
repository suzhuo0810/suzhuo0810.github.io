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
  <div id="mydiv">
	<input class="btn btn-danger" id= "deldata" data-toggle="modal" data-target="#delModal" type="button" value="删除" disabled="disabled"/>
  	<input class="btn btn-default" id="dowtableOn" onclick="javascript:method1('#example','downloadToos');" type="button" value="下载当前表格" />
  </div>
    <table id="example" class="display" width="100%">
    <thead>
        <tr>
            <th>下载序号</th>
            <th>操作用户</th>
            <th>下载表格</th>
            <th>客户端 I P</th>
            <th>客户端系统</th>
            <th>客户端浏览器</th>
            <th>下载时间</th>
        </tr>
    </thead>
    <tbody></tbody>
	</table>
	
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
	
	<script type="text/javascript">

		$(document).ready( function () {
    	var table = $("#example").dataTable({
    	"ajax": {"url":"all_Dow.do",
    	"dataSrc": ""	},
    	"columns":[
				{"data":"dowId"},
				{"data":"dowName"},
				{"data":"dowText"},
				{"data":"dowIp"},
				{"data":"dowSystem"},
				{"data":"dwoExp"},
				{"data":"dowDate"},
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
		
		$("#dowtableOn").click(function() {		
			sleep(300);
			table.api().ajax.reload();
		});	
		
		/*休眠函数*/
		function sleep(numberMillis) {
			var now = new Date();
			var exitTime = now.getTime() + numberMillis;
			while (true) {
				now = new Date();
				if (now.getTime() > exitTime)
					return;
				}
		}
				
    	$("#example").removeClass("display");
        $("#example").addClass("table table-striped table-bordered");
    		
    	$("#example tbody").on("click", "tr", function () {
    	$("#deldata").removeAttr("disabled");
        if ( $(this).is(".selected") ) {
            $(this).removeClass("selected");
        }
        else {
            table.$("tr.selected").removeClass("selected");
            $(this).addClass("selected");
        }
    } );
	//删除
	$("#delbutton").click(function() {
		var dowId = null;
		var nTrs = table.fnGetNodes();
     		for (var i = 0; i < nTrs.length; i++) {
				 if($(nTrs[i]).is(".selected")){   
                dowId = table.fnGetData(nTrs[i]).dowId;     
           }
        } 
    	$("#delModal").modal("hide");
     	$.ajax({
     		type: "post",
     		url: "del_Dow.do",
     		data: {"dowId":dowId},
     		error: function( e ){
				alert("请求错误，请检查网络!");
     		},
     		success: function( data ){
     			if(data == "error"){
     				alert("记录删除失败!");
     			}else{
     				table.api().ajax.reload();
     			}
     		}
     	});
     	$("#deldata").attr("disabled","disabled");  	
	}); 
} );
	</script>
	
  </body>
</html>
