<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css" />

<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript">
	$(function(){
		
		getAll();
	});
	function getAll(){
		$.ajax({
			url : "http://localhost:8081/message/getAll",
			type : "post",
			data : {},
			dataType : "JSON",
			success : function (data){
				
				var html = "";
				$.each(data.data, function(index, msg){
					html += 
						"<div class=\"msgitem\">" +
						"	<div class=\"col col-1\">" +
						"		<span>"+msg.rcount+"</span>" +
						"	</div>" +
						"	<div class=\"col col-2\">" +
						"		<div class=\"title\"><a href=\"message.jsp?mid="+msg.mid+"\">"+msg.title+"</a></div>" +
						"		<div class=\"context\">"+msg.mcontext+"</div>" +
						"	</div>" +
						"	<div class=\"col col-3\">" +
						"		<img src=\"img/auther.png\"/>" +
						"		<span>"+msg.auther+"</span>" +
						"	</div>" +
						"	<div class=\"col col-4\">" + msg.mDate +
						"	</div>" +
						"	<div class=\"clear\"></div>" +
						"</div>";
				});
				
				$(".msglist").html(html);
			}
		});
	}
	function addMsg(){
		// 构造数据
		var auther = $("input[name='auther']").val();
		var title = $("input[name='title']").val();
		var mcontext = $("textarea").val();
		

		// ajax 异步请求
		$.ajax({
			url : "http://localhost:8081/message/add",
			type : "post",
			data : {"auther": auther, "title": title, "mcontext" : mcontext},
			dataType : "JSON",
			success : function(res){
				
				alert(res.msg);
				
				getAll();
			}
		});
		
		
		return false;
	}

</script>
</head>
<body>
	<div class="container">
		<div class="ad">
			<div>
				<img src="img/logo1.png"/>
			</div>
		</div>
		<div class="title_top">
			<h1>最新热帖</h1>
		</div>
		<div class="msglist">
			<div class="msgitem">
				<div class="col col-1">
					<span>0</span>
				</div>
				<div class="col col-2">
					<div class="title"><a href="#">title</a></div>
					<div class="context">context</div>
				</div>
				<div class="col col-3">
					<img src="img/auther.png"/>
					<span>作者</span>
				</div>
				<div class="col col-4">
					8-15
				</div>
				<div class="clear"></div>
			</div>
			
			<div class="msgitem">
				<div class="col col-1">
					<span>0</span>
				</div>
				<div class="col col-2">
					<div class="title"><a href="#">title</a></div>
					<div class="context">context</div>
				</div>
				<div class="col col-3">
					<img src="img/auther.png"/>
					<span>作者</span>
				</div>
				<div class="col col-4">
					8-15
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="addform">
			<form >
				<input type="text" name="auther" placeholder="请填写名字"/>
				<input type="text" name="title" placeholder="请填写标题"/>
				<textarea rows="10" cols="80" name="mcontext"></textarea><br/>
				<input type="submit" value="发表" onclick="return addMsg();"/>
			</form>
		</div>
	</div>
</body>
</html>