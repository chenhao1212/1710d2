<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index3.css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	
	var gid=${param.gid}+"";
	$(function(){
		$.post("queryAllBrand.do","",function(data1){
			$(data1).each(function(i,val){
				$("#brand").append("<option value='"+this.bid+"'>"+this.bname+"</option>")
			})
			
			$.post("queryAllSkind.do","",function(data2){
				$(data2).each(function(i,val2){
					$("#skind").append("<option value='"+this.sid+"'>"+this.sname+"</option>")
				})
				
				$.post("queryGood.do","gid="+gid,function(data3){
					$("[name=gid]").val(data3.gid);
					$("[name=gname]").val(data3.gname);
					$("#brand option").each(function(i,val3){
						if($(this).val() == data3.brand.bid){
							$(val3).prop("selected",true)
						}
					})
					$("#skind option").each(function(i,val4){
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
	
	function tijiao(){
		var form=$("form").serialize();
		$.post("updateGood.do",form,function(data){
			if(data){
				alert("修改成功");
				location.href="list.do";
			}else{
				alert("修改失败");
			}
		},"json")
	}
</script>
</head>
<body>
	<form>
		<input type="hidden" name="gid">
		商品名称:<input type="text" name="gname"><br>
		商品品牌:<select id="brand" name="brand.bid">
				</select><br>
		商品种类:<select id="skind" name="skind.sid">
				</select><br>
		商品尺寸:<input type="text" name="size"><br>
		商品价格:<input type="text" name="price"><br>
		商品数量:<input type="text" name="count"><br>
		商品标签:<input type="text" name="lable"><br>
		<input type="button" onclick="tijiao()" value="提交">
	</form>
</body>
</html>