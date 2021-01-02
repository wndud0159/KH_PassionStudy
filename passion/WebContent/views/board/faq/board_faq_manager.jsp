<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <a href="index.jsp?inc=./views/board/notice/board_notice_manager.jsp"><button class="btn1">공지사항</button></a>
          </li>
          <li>
            <a href="index.jsp?inc=./views/board/faq/board_faq_manager.jsp"><button class="btn2 on">자주하는 질문</button></a>
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
          <div id="buttons">
            <a href="index.jsp?inc=./views/board/faq/board_faq_write.jsp">
              <button type="button" class="write_btn yb" style="float: none">
                글쓰기
              </button></a
            >
            <button type="button" class="remove_btn yb" style="float: none">
              삭제
            </button>
            <select
              id="board_select"
              name="board_select"
              title="문의선택"
              class="sel"
            >
              <option value="member_inquiry">회원문의</option>
              <option value="reservation_inquiry">예약문의</option>
              <option value="payment_inquiry">결제문의</option>
              <option value="product_inquiry">상품문의</option>
              <option value="cancel_inquiry">취소문의</option>
            </select>
          </div>
          <table class="table" id="main_table" width="50%">
            <tr>
	            <th><input type="checkbox" class="checkbox" /></th>
	            <th>카테고리</th>
	            <th>제목</th>
	            <th></th>
            </tr>
            <tr>
              <!-- 첫번째 줄 시작-->
              <td><input type="checkbox" class="checkbox" /></td>
              <td>회원문의</td>
              <td>아이디와 비밀번호는 어떻게 찾을 수 있나요?</td>
              <td></td>
            </tr>
            <!-- 첫번째 줄 끝-->
            <tr>
              <!-- 두번째 줄 시작-->
              <td><input type="checkbox" class="checkbox" /></td>
              <td>서비스 이용 및 기타</td>
              <td>결제내역을 어떻게 확인하나요?</td>
              <td></td>
            </tr>
            <!-- 두번째 줄 끝-->
            <tr>
              <!-- 세번째 줄 시작-->
              <td><input type="checkbox" class="checkbox" /></td>
              <td>쿠폰/적립금</td>
              <td>적립금은 유효기간이 있나요?</td>
              <td></td>
            </tr>
            <!-- 두번째 줄 끝-->
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