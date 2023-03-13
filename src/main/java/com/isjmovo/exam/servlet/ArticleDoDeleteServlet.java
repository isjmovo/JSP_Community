package com.isjmovo.exam.servlet;

import com.isjmovo.exam.util.DBUtil;
import com.isjmovo.exam.util.SecSql;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet("/article/doDelete")
public class ArticleDoDeleteServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");
    resp.setCharacterEncoding("UTF-8");
    resp.setContentType("text/html; charset-utf-8");

    // DB 연결 시작
    Connection conn = null;

    try {
      Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      System.out.printf("[ClassNotFoundException 예외, %s]", e.getMessage());
      System.out.println("DB 드라이버 클래스 로딩 실패");

      return;
    }

    String url = "jdbc:mysql://127.0.0.1:3306/JSP_Community?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeNehavior=convertToNull";
    String user = "isjmovo";
    String password = "Kim123";

    try {
      conn = DriverManager.getConnection(url, user, password);

      int id = Integer.parseInt(req.getParameter("id"));

      SecSql sql = SecSql.from("DELETE");
      sql.append("FROM article");
      sql.append("WHERE id = ?", id);

      DBUtil.delete(conn, sql);
      resp.getWriter().append(String.format("<script> alert('%d번 글이 삭제되었습니다.'); location.replace('list'); </script>", id));
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      try {
        if (conn != null && !conn.isClosed()) {
          conn.close();
        }
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    // DB 연결 끝
  }
}