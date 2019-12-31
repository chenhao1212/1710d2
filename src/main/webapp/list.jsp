<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index3.css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	function fenye(pageNum){
		$("[name=pageNum]").val(pageNum);
		$("form").submit();
	}
	function addGoods(){
		location.href="queryAllBrandAndSkind.do";
	}
	function xuanze(){
		if($("#check1").prop("checked")==true){
			$("[name=check]").each(function(){
				$(this).prop("checked",true)
			})
		}else{
			$("[name=check]").each(function(){
				$(this).prop("checked",false)
			})
		}
	}
	
	function pishan(){
		var ids="";
		$("[name=check]:checked").each(function(){
			ids+=$(this).val()+",";
		})
		if(confirm("确定要删除吗")){
			location.href="deleteAll.do?ids="+ids;
		}
	}
	function danshan(gid){
		if(confirm("确定要删除吗")){
			location.href="deleteOne.do?gid="+gid;
		}
	}
</script>
</head>
<body>
<form action="list.do" method="post">
	<input type="hidden" name="pageNum" value="${con.pageNum}">
	商品名称:<input type="text" name="gname" value="${con.gname}">
	<input type="submit" value="查询">	
</form>
		<a onclick="addGoods()">添加</a>&nbsp;&nbsp;<a onclick="pishan()">批删</a>
	<table>
		<tr>
			<td><input type="checkbox" id="check1" onclick="xuanze()"></td>
			<td>商品名称</td>
			<td>商品品牌</td>
			<td>商品种类</td>
			<td>尺寸</td>
			<td>单价</td>
			<td>数量</td>
			<td>标签</td>
			<td>图片</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list}" var="g">
			<tr>
				<td><input type="checkbox" name="check" value="${g.gid}"></td>
				<td>${g.gname}</td>
				<td>${g.brand.bname}</td>
				<td>${g.skind.sname}</td>
				<td>${g.size}</td>
				<td>${g.price}</td>
				<td>${g.count}</td>
				<td>${g.lable}</td>
				<td>${g.image}</td>
				<td><a onclick="danshan(${g.gid})">删除</a>/<a href="update.jsp?gid=${g.gid}">编辑</a>/<a href="address.jsp?gid=${g.gid}">详情</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="10">
				<a onclick="fenye(1)">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a onclick="fenye(${page.prePage==0?1:page.prePage})">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a onclick="fenye(${page.nextPage==0?page.pages:page.nextPage})">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a onclick="fenye(${page.pages})">尾页</a>&nbsp;&nbsp;
				当前第${page.pageNum}/${page.pages},共${page.total}条数据
			</td>
		</tr>
	</table>
</body>
</html>