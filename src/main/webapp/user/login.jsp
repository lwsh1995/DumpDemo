<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String path = request.getContextPath();%>
<html>
<head>
    <link rel="stylesheet" href="../css/login.css"/>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <title></title>
</head>
<div class="test">
    <center>
        <div class="all">
            <div class="container">
                <div class="header">
                    <h1 id="ti">Login</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel1">
                        <div class="panel-body">
                            <form id="pipporum" method="post">
                                <div class="formgroup">
                                    <div class="mygroup">
                                        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
                                                                                              name="username"
                                                                                              class="form-control"
                                                                                              required/>
                                    </div>
                                </div>
                                <br/>

                                <div class="formgroup">
                                    <div class="mygroup">
                                        Password:&nbsp;<input type="password" class="form-control" name="password"
                                                              required/>
                                    </div>
                                </div>
                                <br/>&nbsp;&nbsp;&nbsp;&nbsp;
                                <div style="margin-left:-62px" class="ab">
                                    <button type="button" class="btn" id="signin">Sign in
                                    </button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                            </form>
                            <div style="margin-top:-48px" class="bc">
                                <button type="button" id="register" class="btn">Register
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </center>
</div>
<script>
    $(function () {
        $('#signin').click(function () {
            var us = $("input[name='username']").val();
            var pa = $("input[name='password']").val();
            $.post("<%=path%>/login.action", {username: us, password: pa}, function (data, textStatus) {
                if (data == "true") {
                    location.href = "/index.jsp";
                } else {
                    alert("用户名不存在或密码错误！");
                }
            });
        });

        $("#register").click(function () {
            location.href = "/user/register.jsp";
        });
    });
</script>
</body>
</html>
