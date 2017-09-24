$(document).ready(function(){
		var identifying = "defli";
    	$("ul li").click(function() {
    		$("ul li").removeClass("active");
			$(this).attr("class","active");
		});
		$(".navbar-brand").click(function(){
			$("ul li").removeClass("active");
			$("#defli").attr("class","active");
		});		
		
		$("#table-responsive").load("views/user_man/success.jsp");
		
		$("#studli").click(function(){		
			if(identifying != "studli"){
				identifying = "studli";
				$("#table-responsive").load("views/stud_man/success.jsp");
			}	
		});	
		
		$("#dowli").click(function(){		
			if(identifying != "dowli"){
				identifying = "dowli";
				$("#table-responsive").load("views/dow_man/success.jsp");
			}	
		});		
		
		$("#defli").click(function(){
			if(identifying != "defli"){
				identifying = "defli";
				$("#table-responsive").load("views/user_man/success.jsp");
			}	
		});	
		
 });