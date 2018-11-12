<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/message.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		
		getMsg();
	});
	
	function getMsg(){
		
		$.ajax({
			url : "http://localhost:8081/message/getMsgById",
			type : "post",
			data : {"mid" : ${param.mid} },
			dataType : "JSON",
			success : function(msg){
				
				// 显示
				var html = 
				"<div class=\"msg_title\">"+
				"	<span>"+msg.title+"</span>"+
				"	<a href=\"#cc\">回复</a>"+
				"	<a href=\"#\">收藏</a>"+
				"	<a href=\"#\">只看楼主</a>"+
				"</div>"+
				"<div class=\"msg_item\">"+
				"	<div class=\"msg_info\">"+
				"		<div class=\"user\">"+
				"			<img src=\"img/head.jpg\"/>"+
				"			<div><a href=\"#\">"+msg.auther+"</a></div>"+
				"			<div ><span class=\"level\">初级粉丝</span></div>"+
				"		</div>"+
				"		<div class=\"context\">"+ msg.mcontext +
				"		</div>"+
				"		<div class=\"clear\"></div>"+
				"	</div>"+
				"	<div class=\"msg_time\">"+
				"		<span>1楼</span>"+
				"		<span>"+msg.mDate+"</span>"+
				"		<a href=\"#\">回复</a>"+
				"	</div>"+
				"</div>";

				$(".msg").html(html);
				
				getReply();
			}
			
			
		});
	}
	
	function getReply(){
		
		$.ajax({
			url : "http://localhost:8081/reply/getReplyByMid",
			type : "post",
			data : {"mid" : ${param.mid} },
			dataType : "JSON",
			success : function(replyList){
				
				var html = "";
				$.each(replyList, function(index, reply){
					
					html +=
						"<div class=\"msg_item\">"+
						"	<div class=\"msg_info\">"+
						"		<div class=\"user\">"+
						"			<img src=\"img/head.jpg\"/>"+
						"			<div><a href=\"#\">"+reply.rname+"</a></div>"+
						"			<div ><span class=\"level\">初级粉丝</span></div>"+
						"		</div>"+
						"		<div class=\"context\">"+ reply.rcontext +
						"		</div>"+
						"		<div class=\"clear\"></div>"+
						"	</div>"+
						"	<div class=\"msg_time\">"+
						"		<span>"+ (index+2) +"楼</span>"+
						"		<span>"+reply.rDate+"</span>"+
						"		<a href=\"#\">回复</a>"+
						"	</div>"+
						"</div>";
				});
				
				$(".reply_list").html(html);
			}
		});
	}
	
	function addReply(){
		// 构造数据
		var rname = $("input[name='rname']").val();
		var rcontext = $("textarea").val();
		
		// ajax 异步请求
		$.ajax({
			url : "http://localhost:8081/reply/add",
			type : "post",
			data : {"rname": rname, "rcontext": rcontext, "mid": ${param.mid}},
			dataType : "JSON",
			success : function(res){
				
				alert(res.msg);
				
				getReply();
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
				<img src="img/logo1.png" />
			</div>
		</div>

		<div class="msg"></div>
		<div class="reply_list"></div>
		<div class="addform" id="cc">
			<form>
				<input type="text" name="rname" placeholder="请填写名字" />
				<textarea rows="10" cols="80" name="rcontext"></textarea>
				<br /> <input type="submit" value="发表" onclick="return addReply();" />
			</form>
		</div>
	</div>
</body>
</html>