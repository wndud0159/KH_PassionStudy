<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String sql = "SELECT * FROM NOTICE_B";

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection(url,"passion","passion");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(sql);	

%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <title>Welcome Passion StudyCafe~!</title>
  </head>
  <body>
  
    <div class="cont_header">
      <div class="cont_wrapper">
        <h1>커뮤니티</h1>
      </div>
    </div>

    <div class="tabtype">
      <div class="tabtype_wrapper" style="text-align: center;">
        <ul>
          <li>
            <a href="index.jsp?inc=./views/board/notice/board_notice_manager.jsp"><button class="btn1 on">공지사항</button></a>
          </li>
          <li>
            <a href="index.jsp?inc=./views/board/faq/board_faq_manager.jsp"><button class="btn2">자주하는 질문</button></a>
          </li>
          <li>
            <a href="index.jsp?inc=./views/board/1on1/board_1on1.jsp"><button class="btn3">1:1문의</button></a>
          </li>
        </ul>
      </div>
    </div>

    <section>
      <div id="board">
        <div id="board_main">
          <table class="table" id="main_table" width="50%" >
          	<thead>
          	<tr>
	            <th>번호</th>
	            <th>제목</th>
	            <th>작성자</th>
	            <th>작성일</th>
	            <th>조회</th>
	        </tr>
	        </thead>
	        <tbody>
	        <%while(rs.next()){ %>
            <tr>
              <!-- 첫번째 줄 시작 "board_notice_manager_detail.jsp?noticeNo=${n.noticeNo} -->
              <td><%=rs.getInt("N_NO")%></td>
              <td><a href="board_notice_detail?n_no=<%=rs.getInt("N_NO")%>"><%=rs.getString("N_TITLE")%></a></td>
              <td><%=rs.getString("N_WRITER")%></td>
              <td><%=rs.getDate("N_DATE")%></td>
              <td><%=rs.getInt("N_HIT")%></td>
            </tr>
            <!-- 첫번째 줄 끝-->
            </tbody>
            <%} %>
          </table>
          <div class="search_bar">
            <select name="f">
              <option ${(param.f == "title")?"selected":""} value="noticeTitle">제목</option>
              <option ${(param.f == "title")?"selected":""} value="noticeContent">내용</option>
            </select>
          <input type="text" name="q" value="${param.q}" id="search-box" />
          <button type="button" class="search-btn yb" style="float: none;">
            검색
          </button>
          </div>
        </div>
      </div>
    </section>

  </body>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</html>
<%
rs.close();
st.close();
con.close();
%>