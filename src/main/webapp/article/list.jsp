<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% List<Map<String, Object>> articleRows = (List<Map<String, Object>>) request.getAttribute("articleRows"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시물 리스트</title>
</head>
<body>
    <h1>게시물 리스트</h1>
    <ul>
        <%
        for (Map<String, Object> articleRow : articleRows) {
        %>
        <li><%= articleRow.get("id") %>번, <%= (String) articleRow.get("regDate") %>, <%= (String) articleRow.get("updateDate") %>, <%= (String) articleRow.get("title") %></li>
        <%
        }
        %>
    </ul>
</body>
</html>