<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index3.css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	function fanhui(){
		location.href="list.do";
	}
	var gid=${param.gid}+"";
	$(function(){
		$.post("queryAllBrand.do","",function(data1){
			$(data1).each(function(i,val){
				$("[name=brand]").append("<option value='"+this.bid+"'>"+this.bname+"</option>")
			})
			
			$.post("queryAllSkind.do","",function(data2){
				$(data2).each(function(i,val2){
					$("[name=skind]").append("<option value='"+this.sid+"'>"+this.sname+"</option>")
				})
				
				$.post("queryGood.do","gid="+gid,function(data3){
					$("[name=gname]").val(data3.gname);
					$("[name=brand] option").each(function(i,val3){
						if($(this).val() == data3.brand.bid){
							$(val3).prop("selected",true)
						}
					})
					$("[name=skind] option").each(function(i,val4){
						if($(this).val() == data3.skind.sid){
							$(val4).prop("selected",true)
						}
					})
					$("[name=size]").val(data3.size);
					$("[name=price]").val(data3.price);
					$("[name=count]").val(data3.count);
					$("[name=lable]").val(data3.lable);
				},"json")
			},"json")
		},"json")
		
	})
</script>
</head>
<body>
	<form >
		商品名称:<input type="text" name="gname"><br>
		商品品牌:<select name="brand">
				</select><br>
		商品种类:<select name="skind">
				</select><br>
		商品尺寸:<input type="text" name="size"><br>
		商品价格:<input type="text" name="price"><br>
		商品数量:<input type="text" name="count"><br>
		商品标签:<input type="text" name="lable"><br>
	</form>
	<input type="button" onclick="fanhui()" value="返回"> 
</body>
</html>