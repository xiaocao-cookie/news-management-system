
//下列函数的目的是:能通过左侧的导航栏来操作右侧的内容
$(function () {
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
    $("#pictureNews").click(function () {
        $("#pictureNewsListNav").tab('show')
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

//后台用户管理
//去修改用户
function toModifyUser(userId,loginName,password,phone,idCard,sex,userType){
    $("input[name='oldUserType']").val(userType);
    $("input[name='oldUserId']").val(userId);
    $("input[name='oldLoginName']").val(loginName);
    $("input[name='oldPassword']").val(password);
    $("input[name='oldPhone']").val(phone);
    $("input[name='oldIdCard']").val(idCard);
    $("input[type=radio][name=sex][value="+sex+"]").attr("checked",'checked');
}

//修改用户
function modifyUser() {
    var userId = $("input[name='oldUserId']").val();
    var userType = $("input[name='oldUserType']").val();
    var loginName = $("input[name='oldLoginName']").val();
    var password = $("input[name='oldPassword']").val();
    var phone = $("input[name='oldPhone']").val();
    var idCard = $("input[name='oldIdCard']").val();
    var sex = $("input[name='sex']").val();

    $.ajax({
        url: contextPath+"/user/modifyUser",
        method: 'post',
        data:{
            id: userId,
            loginName: loginName,
            password: password,
            phone: phone,
            sex: sex,
            idCard: idCard,
            userType: userType
        },
        success:function(jsonStr){
            var result = eval("("+jsonStr+")");
            if (result.status == 1){
                swal({
                        title: result.message,
                        type: "success",
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "OK",
                        closeOnConfirm: false
                    },function(isConfirm){
                    if (isConfirm) {
                        window.location.reload();
                    }
                })
            }else{
                swal({
                    title: result.message,
                    type: "error",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },function(isConfirm){
                    if (isConfirm) {
                        window.location.reload();
                    }
                });
            }
        }
    })
}

//删除用户
function delUser(userId){
    swal({
            title: "确定删除吗？",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定删除！",
            cancelButtonText: "取消删除！",
            closeOnConfirm: false,
            closeOnCancel: false
        },function(isConfirm){
        if (isConfirm) {
            $.ajax({
                url: contextPath+"/user/deleteUserById",
                method: 'post',
                data: {
                    id: userId
                },
                success:function(jsonStr){
                    var result = eval("("+jsonStr+")");
                    if (result.status == 1){
                        swal({
                            title: result.message,
                            type: "success",
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "OK",
                            closeOnConfirm: false
                        },function(isConfirm){
                            if (isConfirm) {
                                window.location.reload();
                            }
                        })
                    }else{
                        swal({
                            title: result.message,
                            type: "error",
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "OK",
                            closeOnConfirm: false
                        },function(isConfirm){
                            if (isConfirm) {
                                window.location.reload();
                            }
                        });
                    }
                }
            })
        } else {
            swal("取消！");
        }
    });
}

//添加用户
function addUser(){
    var loginName = $("#loginName").val();
    var password = $("input[name='password']").val();
    var sex = $('input:radio:checked').val()
    var phone = $("input[name='telphone']").val();
    var idCard = $("input[name='idCard']").val();
    var userType = '1';
    $.ajax({
        url: contextPath + "/user/addUser",
        method: 'post',
        data:{
            loginName: loginName,
            password: password,
            sex: sex,
            phone: phone,
            idCard: idCard,
            userType: userType
        },
        success:function(jsonStr){
            var result = eval("("+jsonStr+")");
            if (result.status == 1){
                swal({
                    title: result.message,
                    type: "success",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },function(isConfirm){
                    if (isConfirm) {
                        window.location.reload();
                    }
                })
            }else{
                swal({
                    title: result.message,
                    type: "error",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },function(isConfirm){
                    if (isConfirm) {
                        window.location.reload();
                    }
                });
            }
        }
    })
}

//后台主题管理
//去修改主题
function toModifyTopic(topicName,topicId) {
    $("input[name='topicName']").val(topicName);
    $("input[name='topicId']").val(topicId);
}

//添加或修改主题
function addAndModifyTopic(){
    var topicName = $("input[name='topicName']").val();
    var topicId = $("input[name='topicId']").val();
    if (topicName == "" || topicName == null){
        return;
    }
    $.ajax({
        url: contextPath + "/topic/addAndModifyTopicName",
        method: 'post',
        data:{
            topicId: topicId,
            topicName: topicName
        },
        success:function(jsonStr){
            var result = eval("("+jsonStr+")");
            if (result.status == 1){
                swal({
                    title: result.message,
                    type: "success",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },function(isConfirm){
                    if (isConfirm) {
                        window.location.reload();
                    }
                })
            }else{
                swal({
                    title: result.message,
                    type: "error",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },function(isConfirm){
                    if (isConfirm) {
                        window.location.reload();
                    }
                });
            }
        }
    })
}

//删除主题
function delTopic(topicId){
    swal({
        title: "确定删除吗？",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "确定删除！",
        cancelButtonText: "取消删除！",
        closeOnConfirm: false,
        closeOnCancel: false
    },function(isConfirm){
        if (isConfirm) {
            $.ajax({
                url: contextPath + "/topic/deleteTopic",
                method: 'post',
                data: {
                    id: topicId
                },
                success:function(jsonStr){
                    var result = eval("("+jsonStr+")");
                    if (result.status == 1){
                        swal({
                            title: result.message,
                            type: "success",
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "OK",
                            closeOnConfirm: false
                        },function(isConfirm){
                            if (isConfirm) {
                                window.location.reload();
                            }
                        })
                    }else{
                        swal({
                            title: result.message,
                            type: "error",
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "OK",
                            closeOnConfirm: false
                        },function(isConfirm){
                            if (isConfirm) {
                                window.location.reload();
                            }
                        });
                    }
                }
            })
        }else{
            swal("取消！");
        }
    })
}

//后台新闻管理
//删除新闻
function delNews(id){
    swal({
        title: "确定删除吗？",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "确定删除！",
        cancelButtonText: "取消删除！",
        closeOnConfirm: false,
        closeOnCancel: false
    },function(isConfirm){
        if (isConfirm) {
            $.ajax({
                url: contextPath + "/news/deleteNews",
                method: 'post',
                data:{
                    id: id
                },
                success:function(jsonStr){
                    var result = eval("("+jsonStr+")");
                    if (result.status == 1){
                        swal({
                            title: result.message,
                            type: "success",
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "OK",
                            closeOnConfirm: false
                        },function(isConfirm){
                            if (isConfirm) {
                                window.location.reload();
                            }
                        })
                    }else{
                        swal({
                            title: result.message,
                            type: "error",
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "OK",
                            closeOnConfirm: false
                        },function(isConfirm){
                            if (isConfirm) {
                                window.location.reload();
                            }
                        });
                    }
                }
            })
        }else{
            swal("取消！");
        }
    })

}

//删除图片新闻
function delPictureNews(id){
    swal({
        title: "确定删除吗？",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "确定删除！",
        cancelButtonText: "取消删除！",
        closeOnConfirm: false,
        closeOnCancel: false
    },function(isConfirm){
        if (isConfirm) {
            $.ajax({
                url: contextPath + "/news/deletePictureNews",
                method: 'post',
                data: {
                    id: id
                },
                success: function (jsonStr) {
                    var result = eval("("+jsonStr+")");
                    if (result.status == 1){
                        $("#ok").show();
                        $("#message").html(result.message);
                        setTimeout(function () {
                            window.location.reload();
                        },2000)
                    }else{
                        $("#remove").show();
                        $("#message").html(result.message);
                        setTimeout(function () {
                            window.location.reload();
                        },2000)
                    }
                }
            })
        }else {
            swal("取消！");
        }
    })

}

//添加图片新闻
function addNews() {
    var newsType = $("input[name='newsType']:checked").val();
    var title = $("input[name='title']").val();
    var topicId = $("#topic option:selected").val();
    var author = $("input[name='author']").val();
    var contents = $("#contents").val();
    var contentOne = $("#contentOne").val();
    var contentTwo = $("#contentTwo").val();
    var contentThree = $("#contentThree").val();
    var contentFour = $("#contentFour").val();

    if (title == null || title == ""){
        swal("标题不能为空");
        return;
    }
    if (topicId == null){
        swal("请选择主题");
        return;
    }
    if (author == null || author == ""){
        swal("作者不能为空");
        return;
    }
    if(newsType == 1 && (contents == null || contents == "")){
        swal("内容不能为空");
        return;
    }
    if (newsType == 2 && (contentOne == null || contentOne == "")){
        swal("请保证内容1不为空");
        return;
    }

    $.ajax({
        url: contextPath + "/news/addNews",
        method: 'post',
        data: {
            newsType: newsType,
            title: title,
            topicId: topicId,
            author: author,
            contents: contents,
            contentOne: contentOne,
            contentTwo: contentTwo,
            contentThree: contentThree,
            contentFour: contentFour
        },
        success:function(jsonStr){
            var result = eval("("+jsonStr+")");
            if (result.status == 1){
                swal({
                    title: result.message,
                    type: "success",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },function(isConfirm){
                    if (isConfirm) {
                        window.location.href = contextPath + result.url;
                    }
                })
            }else{
                swal({
                    title: result.message,
                    type: "error",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },function(isConfirm){
                    if (isConfirm) {
                        window.location.href = contextPath + result.url;
                    }
                });
            }
        }
    });
}

//新闻修改 -- 一般新闻
function modifyNews() {
    var nid = $("#newsId").val();
    var title = $("input[name='title']").val();
    var topicId = $("#topic option:selected").val();
    var author = $("input[name='author']").val();
    var contents = $("#contents").val();

    if (title == null || title == ""){
        swal("标题不能为空");
        return;
    }
    if (topicId == null){
        swal("请选择主题");
        return;
    }
    if (author == null || author == ""){
        swal("作者不能为空");
        return;
    }
    if(contents == null || contents == ""){
        swal("内容不能为空");
        return;
    }

    $.ajax({
        url: contextPath + "/news/modifyNews",
        method: 'post',
        data:{
            nid: nid,
            title: title,
            topicId: topicId,
            author: author,
            contents: contents
        },
        success:function(jsonStr){
            var result = eval("("+jsonStr+")");
            if (result.status == 1){
                swal({
                    title: result.message,
                    type: "success",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },function(isConfirm){
                    if (isConfirm) {
                        window.location.href = contextPath + result.url;
                    }
                })
            }else{
                swal({
                    title: result.message,
                    type: "error",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },function(isConfirm){
                    if (isConfirm) {
                        window.location.reload();
                    }
                });
            }
        }
    })
}

//新闻修改 -- 图片新闻
function modifyPicNews() {
    var pid = $("#picNewsId").val();
    var title = $("input[name='title']").val();
    var topicId = $("#topic option:selected").val();
    var author = $("input[name='author']").val();
    var contentOne = $("#contentOne").val();
    var contentTwo = $("#contentTwo").val();
    var contentThree = $("#contentThree").val();
    var contentFour = $("#contentFour").val();

    if (title == null || title == ""){
        swal("标题不能为空");
        return;
    }
    if (topicId == null){
        swal("请选择主题");
        return;
    }
    if (author == null || author == ""){
        swal("作者不能为空");
        return;
    }
    if (contentOne == null || contentOne == ""){
        swal("请保证内容1不为空");
        return;
    }

    $.ajax({
        url: contextPath + "/news/modifyPicNews",
        method: 'post',
        data: {
            pid: pid,
            title: title,
            topicId: topicId,
            author: author,
            contentOne: contentOne,
            contentTwo: contentTwo,
            contentThree: contentThree,
            contentFour: contentFour
        },
        success:function(jsonStr){
            var result = eval("("+jsonStr+")");
            if (result.status == 1){
                swal({
                    title: result.message,
                    type: "success",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },function(isConfirm){
                    if (isConfirm) {
                        window.location.href = contextPath + result.url;
                    }
                })
            }else{
                swal({
                    title: result.message,
                    type: "error",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "OK",
                    closeOnConfirm: false
                },function(isConfirm){
                    if (isConfirm) {
                        window.location.reload();
                    }
                });
            }
        }
    })
}
