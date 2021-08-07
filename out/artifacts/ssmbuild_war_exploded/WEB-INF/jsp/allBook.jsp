<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhangyunqing
  Date: 2021/8/5
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
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
                        <small>书籍列表 ---- 显示所有书籍</small>
                    </h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 column">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBook">新增书籍</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/allBook">显示全部书籍</a>
                </div>
                <div class="col-md-4 column"></div>
                <div class="col-md-4 column" style="float: right">
                    <%-- 查询书籍--%>
                    <form action="${pageContext.request.contextPath}/book/queryBook" method="post">
                        <input type="text" name="queryBookName" placeholder="请输入要查询的书籍名称" class="form-comtrol">
                        <input class="btn btn-primary" type="submit" value="查询" >
                    </form>
                </div>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>书籍编号</th>
                            <th>书籍名称</th>
                            <th>书籍详情</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${list}">
                            <tr>
                                <td>${book.bookID}</td>
                                <td>${book.bookName}</td>
                                <td>${book.detail}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/book/toUpdateBook?id=${book.bookID}">修改</a>
                                    &nbsp;| &nbsp;
<%--                                    常规风格的删除--%>
<%--                                    <a href="${pageContext.request.contextPath}/book/delete?id=${book.bookID}">删除</a>--%>
<%--                                    Restful风格的删除--%>
                                    <a href="${pageContext.request.contextPath}/book/delete/${book.bookID}">删除</a>
                                </td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<h1></h1>
</body>
</html>
