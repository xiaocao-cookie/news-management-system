$(function () {
     //下列函数的目的是:能通过左侧的导航栏来操作右侧的内容
     $("#userList").click(function () {
         $("#userListNav").tab('show');
     });
     $("#personal").click(function () {
         $("#personalNav").tab('show');
     });
     $("#topicList").click(function () {
         $("#topicListNav").tab('show')
     });
     $("#newsList").click(function () {
         $("#newsListNav").tab('show')
     });
     $("#personComments").click(function () {
         $("#personCommentNav").tab('show')
     });
     $("#allComments").click(function () {
         $("#allCommentsNav").tab('show');
     });
     //因为添加用户需要显示的是模态框，所以通过按钮单击事件是模态框显示
     $("#userAdd").click(function () {
         $("#addUserModal").modal({
             show: true
         });
     });
     //添加主题
     $("#topicAdd").click(function () {
         $("#addTopicModal").modal({
             show: true
         })
     });
     //添加新闻
     $("#newsAdd").click(function () {
         $("#addNewsModal").modal({
             show: true
         })
     });
     //查看个人详细信息
     $("#viewMessage").click(function () {
        $("#rPhone").hide();
        $("#rPassword").hide();
        $("#rIdCard").hide();
        $("#showPhone").show();
         $("#showPassword").show();
         $("#showIdCard").show();
     });
     //隐藏个人详细信息
     $("#hideMessage").click(function () {
         $("#rPhone").show();
         $("#rPassword").show();
         $("#rIdCard").show();
         $("#showPhone").hide();
         $("#showPassword").hide();
         $("#showIdCard").hide();
     });
     $(".list-group a").click(function () {
         $(this).siblings().removeClass("active");
         $(this).addClass("active");
     });
     //点击右侧为左侧添加样式
    //用户管理
    $("#personalNav").click(function () {
        $("#personal").siblings().removeClass("active");
        $("#personal").addClass("active");
    });
    $("#userListNav").click(function () {
        $("#userList").siblings().removeClass("active");
        $("#userList").addClass("active");
    });
    $("#userAddNav").click(function () {
        $("#userAdd").siblings().removeClass("active");
        $("#userAdd").addClass("active");
    });
 });