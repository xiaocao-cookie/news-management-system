//发表评论--对于一般新闻
function addComment() {
    var cAuthorId = $("#cAuthorId").val();
    var cnid = $("#cnid").val();
    var content = $("#cContent").val();

    if (cAuthorId == null || cAuthorId == ""){
        swal({
                title: "评论新闻需要登录哦！",
                type: "info",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "去登录",
                cancelButtonText: "放弃评论",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function(isConfirm){
                if (isConfirm) {
                    window.location.href = contextPath + "/Login/toLogin";
                } else {
                    swal({
                        title: "已取消！",
                        type: "error"
                    }
                );
                }
            });
        return;
    }
    if (content == null || content == ""){
        swal("请您输入评论内容");
        return;
    }
    $.ajax({
        url: contextPath + "/comments/addComment",
        method: 'post',
        data:{
            cnid: cnid,
            cAuthorId: cAuthorId,
            content: content
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

//发表评论--对于图片新闻
function addPicComment() {
    var cAuthorId = $("#cAuthorId").val();
    var cpid = $("#cpid").val();
    var content = $("#cContent").val();

    if (cAuthorId == null || cAuthorId == ""){
        swal({
                title: "评论新闻需要登录哦！",
                type: "info",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "去登录",
                cancelButtonText: "放弃评论",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function(isConfirm){
                if (isConfirm) {
                    window.location.href = contextPath + "/Login/toLogin";
                } else {
                    swal({
                            title: "已取消！",
                            type: "error"
                        }
                    );
                }
            });
        return;
    }
    if (content == null || content == ""){
        swal("请您输入评论内容");
        return;
    }
    $.ajax({
        url: contextPath + "/comments/addPicComment",
        method: 'post',
        data:{
            cpid: cpid,
            cAuthorId: cAuthorId,
            content: content
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

//回复评论--去回复
function toReply(obj,id) {
    var name = $("#author"+id).val();
    $("#contents"+id).attr("placeholder","@"+name+"  说点什么吧。。。");
    $(obj).siblings().show();
    $("#replyForm"+id).show();
}
//回复评论--取消回复
function toCancelReply(obj,id) {
    $(obj).hide();
    $("#replyForm"+id).hide();
}
//回复评论--也称为追评
function replyComment(id) {
    var rAuthorId = $("#rAuthor"+id).val();
    var content = $("#contents"+id).val();

    if (rAuthorId == null || rAuthorId == ""){
        swal({
                title: "评论新闻需要登录哦！",
                type: "info",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "去登录",
                cancelButtonText: "放弃评论",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function(isConfirm){
                if (isConfirm) {
                    window.location.href = contextPath + "/Login/toLogin";
                } else {
                    swal({
                            title: "已取消！",
                            type: "error"
                        }
                    );
                }
            });
        return;
    }
    if (content == null || content == ""){
        swal("请您输入评论内容");
        return;
    }

    $.ajax({
        url: contextPath + "/comments/reply",
        method: 'post',
        data: {
            rcid: id,
            rAuthorId: rAuthorId,
            content: content
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

//回复评论的评论--去回复
function toReply2(obj,id) {
    var name = $("#reAuthor"+id).val();
    $("#contents2"+id).attr("placeholder","@"+name+"  说点儿什么吧。。。");
    $(obj).siblings().show();
    $("#replyForm2"+id).show();
}

//回复评论的评论--取消回复
function toCancelReply2(obj,id) {
    $(obj).hide();
    $("#replyForm2"+id).hide();
}

function replyComment2(id) {
    var rAuthorId = $("#rAuthor2"+id).val();
    var content = $("#contents2"+id).val();

    if (rAuthorId == null || rAuthorId == ""){
        swal({
                title: "评论新闻需要登录哦！",
                type: "info",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "去登录",
                cancelButtonText: "放弃评论",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function(isConfirm){
                if (isConfirm) {
                    window.location.href = contextPath + "/Login/toLogin";
                } else {
                    swal({
                            title: "已取消！",
                            type: "error"
                        }
                    );
                }
            });
        return;
    }
    if (content == null || content == ""){
        swal("请您输入评论内容");
        return;
    }

    $.ajax({
        url: contextPath + "/comments/reply2",
        method: 'post',
        data: {
            rid: id,
            rAuthorId: rAuthorId,
            content: content
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