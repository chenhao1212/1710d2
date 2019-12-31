<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index3.css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	function tijiao(){
		var form=$("form").serialize();
		$.post("addGoods.do",form,function(data){
			if(data){
				alert("添加成功")
				location.href="list.do"
			}else{
				alert("添加失败")
			}
			
		},"json");
	}
</script>
</head>
<body>
	<form action="addGoods.do" method="post">
		商品名称:<input type="text" name="gname"><br>
		商品品牌:<select name="brand.bid">
					<c:forEach items="${brands}" var="b">
						<option value="${b.bid}">${b.bname}</option>
					</c:forEach>
				</select><br>
		商品种类:<select name="skind.sid">
					<c:forEach items="${skinds}" var="s">
						<option value="${s.sid}">${s.sname}</option>
					</c:forEach>
				</select><br>
		商品尺寸:<input type="text" name="size"><br>
		商品价格:<input type="text" name="price"><br>
		商品数量:<input type="text" name="count"><br>
		商品标签:<input type="text" name="lable"><br>
		商品图片:<input type="file" name="Myfile"><br>
		<input type="button" onclick="tijiao()" value="提交">
	</form>
</body>
</html>