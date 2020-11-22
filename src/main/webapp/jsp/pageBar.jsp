<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PageBar</title>
    <link href="../bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!--  必须先引入jQuery.js，bootstrap才会起作用   -->
    <script src="../bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
    <script src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.all.js"></script>
</head>
<body>
<div id="pageBar"></div>
<script>
    layui.use('laypage',function () {
        var laypage = layui.laypage;

        laypage.render({
            elem:'pageBar',
            count:'50',
            theme:'#2F4056',
            layout:['prev','page','next','limit','count'],
            limit: 5,
            limits:[5,10,15,20],
            groups:3,
            jump:function (obj,first) {
                console.log(obj.curr);
                console.log(obj.limit);

                if (!first){

                }
            }
        })
    })
</script>
</body>
</html>
