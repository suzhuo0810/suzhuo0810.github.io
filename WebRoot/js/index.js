$(document).ready(function(){
	
	$("#userName").focus(function() {
		$("#userName").animate({
		height:"55px"},"slow");
		$("#spanName").animate({
		top:"25%"},"slow");
	});
	$("#userPass").focus(function() {
		$("#userPass").animate({
		height:"55px"},"slow");
		$("#spanPass").animate({
		top:"40%"},"slow");
	});
	
	$("#userName").blur(function() {
		if($("#userName").val() == ""){
			$("#userName").animate({
			height:"50px"},"slow");
			$("#spanName").animate({
			top:"31.5%"},"slow");
		}
	});
	$("#userPass").blur(function() {
		if($("#userName").val() == ""){
			$("#userPass").animate({
			height:"45px"},"slow");
			$("#spanPass").animate({
			top:"46.5%"},"slow");
		}
	});
	
	$("#submit").mouseover(function(){
		$("#submit").css("cursor","pointer");
	});
	$("#submit").mouseout(function(){
		$("#submit").css("cursor","auto");
	});
	
	var data = $("#verues").attr("name");
    if(data == "0"){
    	$("#error").animate({
		opacity:"1"},1500);
    }
});