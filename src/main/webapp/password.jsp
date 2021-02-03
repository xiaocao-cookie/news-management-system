<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<script>
    function password() {
        var testV = 1;//计数器，记录密码错误次数
        var psw = prompt("请输入身份证后六位","");
        while (testV < 3) {
            if (psw == '288036' || psw == '086020') {
                location.href = '${pageContext.request.contextPath}/Home/index.html';//密码正确，跳到指定页面
                break;
            }
            testV+=1;
            psw=prompt("请输入身份证后六位","");
        }
        if ((psw!='288036' || psw!= '086020') && testV ==3){
            alert("错错错！！！，请刷新重新输入密码");//密码输入错误达到3次
        }
        return " ";
    }
    password();
</script>
<body>

</body>
</html>
