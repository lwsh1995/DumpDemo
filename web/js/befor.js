function check1(){
	if($("input[name='password']").val()==$("input[name='password1']").val()){
		return true;
	}
	else{
		alert("密码不一致");
		return false;
	}
}
function check() {
	if ($("#email1").val() == "") {
		alert("邮箱不能为空");
		return false;
	}
	if (!$("#email1")
			.val()
			.match(
					/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)) {
		alert("格式不正确！请重新输入");
		$("#email1").focus();
		return false;
	}
}
function windows(){
	var rValue = confirm("确定修改");
	if (rValue) {
		$("#delForm").submit();
	} else {
	}
}