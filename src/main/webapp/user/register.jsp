<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <link rel="stylesheet" href="../css/register.css"/>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <title></title>
</head>
<body>
<center>
    <div class="all">
        <div class="container">
            <div class="header">
                <h1>Register</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="panel1">
                    <div class="panel-body1">
                        <form id="pipporum" method="post">
                            <div class="formgroup">
                                <div class="mygroup">
                                    <br/>UserName:&nbsp;<input type="text" name="username" class="form-control"
                                                               required/>
                                </div>
                            </div>
                            <br/>

                            <div class="formgroup">
                                <div class="mygroup">
                                    Password:&nbsp;&nbsp;&nbsp;<input type="password" class="form-control"
                                                                      name="password" required/>
                                </div>
                            </div>
                            <br/>

                            <div class="formgroup">
                                <div class="mygroup">
                                    Again:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password"
                                                                                                       name="again"
                                                                                                       class="form-control"/>
                                </div>
                            </div>
                            <br/>&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" id="back" class="btn">Back
                            </button>
                            <button type="button" id="reg" class="btn">Register
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</center>
<script>
    $(function () {
        $("#reg").click(function () {
            var us = $("input[name='username']").val();
            var pa = $("input[name='password']").val();
            var ag = $("input[name='again']").val();
            $.post("<%=path%>/register.action", {
                username: us,
                password: pa,
                again: ag
            }, function (data, textStatus) {
                if (data == "true") {
                    location.href = "/user/login.jsp";
                } else if (data == "exist") {
                    alert("用户名已存在！");
                } else {
                    alert("密码输入不一致！");
                }
            });
        });

        $('#back').click(function () {
            location.href = "/user/login.jsp";
        })
    })
</script>
</body>
</html>
