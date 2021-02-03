function jumpPage(currentPage) {
    $.ajax({
        url: contextPath + "/news/index.html",
        method: "post",
        data: {
            currentPage: currentPage,
        },
        success: function (newsList) {
            for (var i in newsList) {
                var ntitle = $("#ntitle");
                var nauthor = $("#nauthor");
                ntitle.innerHTML = newsList[i].ntitle;
                nauthor.innerHTML = newsList[i].nauthor;
            }
        }
    });
}