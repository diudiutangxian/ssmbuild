<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/book/updateBook" method="post">
<%--        出现的问题：我们提交了修改的SQL,但是修改失败
            初次可考虑是事务问题，配置完毕事务，依旧失败
            看一下SQL语句能够执行成功，sql执行失败，修改
--%>
<%--        前端传递隐藏域--%>
        <input type="hidden" name="bookID" value="${QBook.bookID}">
        <div class="form-group">
            <label for="bkname">书籍名称</label>
            <input type="text" name="bookName" class="form-control" id="bkname" value="${QBook.bookName}">
        </div>
        <div class="form-group">
            <label for="bkcount">书籍数量</label>
            <input type="text" name="bookCounts" class="form-control" id="bkcount" value="${QBook.bookCounts}">
        </div>
        <div class="form-group">
            <label for="bkdesp">书籍描述</label>
            <input type="text" name="detail" class="form-control" id="bkdesp" value="${QBook.detail}">
        </div>

        <button type="submit" class="btn btn-primary">修改</button>
    </form>
</div>
<h1></h1>
</body>
</html>
