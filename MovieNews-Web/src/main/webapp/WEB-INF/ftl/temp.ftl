<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<style type="text/css">
	#name+#email{
		color:red;
	}

</style>
<body>
${user}
    <form action="" name='xx'>
		<p id="name"><label for="" >姓名 <input name="name" type="text"></label> </p>
		<p><label for="">电话 <input type="text"></label></p>
		<p id="email"><label for="">邮箱 <input type="text"> </label></p>
		<!-- 设置组 -->
		<fieldset>
			<legend>披萨大小</legend><!-- 设置组名称 -->
			<label for=""><input type="radio" name="size"> 小</label>
			<label for=""><input type="radio" name="size"> 中</label>
			<label for=""><input type="radio" name="size"> 大</label>
		</fieldset>
		<!-- 设置组 -->
		<fieldset>
			<legend>披萨配料</legend><!-- 设置组名称 -->
			<label for=""><input type="checkbox" name=""> 1</label>
			<label for=""><input type="checkbox" name="">3</label>
			<label for=""><input type="checkbox" name=""> 2</label>
			<label for=""><input type="checkbox" name=""> 4</label>
		</fieldset>
		<p><label for="">配送时间<input type="time" min="11:00" max="21:00" step="900"></label></p>
		<p><button type="submit">提交</button></p>
        <p><button type="button" onclick="reset1()">取消</button></p>
	</form>
</body>
<script type="text/javascript">
    var form=document.forms.xx;
    console.dir(form);
    function reset1(){
        form.reset();
    }
    form.addEventListener('reset',function(){
        console.log(1);
    })
</script>
</html>
