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
        <h1>관리메뉴</h1>
      </div>
    </div>


    <div class="tabtype btn_align_center tabtype_style_edit">
      <div class="tabtype_wrapper">
        <ul class="manager_ul_style">
          <li>
            <button class="btn1 on">회원 관리</button>
          </li>
          <li>
            <button class="btn2">매출 조회</button>
          </li>
          <li>
            <button class="btn3">상품 관리</button>
          </li>
        </ul>
      </div>
    </div>

    <!-- 회원 관리와 관련된 박스-->

    <section class="manager_member__section manager_section">
      <div class="membersearch-box">
        <form class="membersearch">
          <label for="membersearch--input" class="membersearch--label"
            >이름 또는 전화번호 4자리</label
          >
          <br />
          <input type="search" class="membersearch--input" />
          <input type="submit" value="검색" />
        </form>
      </div>

      <div class="membersearch__member_box">
        <!-- 검색이 완료되면 표시 되는 부분-->
        <div class="membersearch__member_detail_box">
          <div class="member-icon-box">🔥</div>
          <!-- 블랙리스트면 '💀'로 표시-->
          <h1 class="member_detail_name">이름 : 김떡만</h1>
          <hr />
          <h1 class="member_detail_point">Coupon: 2개</h1>
          <hr />
          <h1 class="member_detail_coupon">포인트 : 3000p</h1>
          <hr />
        </div>

        <!-- 관리자가 설정하기 위한 부분-->

        <div class="membersearch__member_edit_box">
          <!-- 비밀번호 변경 설정 -->

          <div class="input-group mb-3">
            <input
              type="text"
              class="form-control"
              placeholder="비밀번호 변경"
              aria-label="Recipient's username"
              aria-describedby="button-addon2"
            />

            <div class="input-group-append">
              <button
                class="btn btn-outline-secondary"
                type="button"
                id="button-addon2"
              >
                EDIT
              </button>
            </div>
          </div>

          <!-- 포인트 설정 -->

          <div class="input-group mb-3">
            <input
              type="text"
              class="form-control"
              placeholder="포인트 변경"
              aria-label="Recipient's username"
              aria-describedby="button-addon2"
            />
            <div class="input-group-append">
              <button
                class="btn btn-outline-secondary"
                type="button"
                id="button-addon2"
              >
                EDIT
              </button>
            </div>
          </div>

          <!-- 회원 쿠폰 설정 -->

          <div class="input-group mb-3">
            <input
              type="text"
              class="form-control"
              placeholder="회원 쿠폰 설정"
              aria-label="Recipient's username"
              aria-describedby="button-addon2"
            />
            <div class="input-group-append">
              <button
                class="btn btn-outline-secondary"
                type="button"
                id="button-addon2"
              >
                EDIT
              </button>
            </div>
          </div>

          <!-- 블랙리스트 설정 -->

          <div class="input-group mb-3">
            <input
              type="text"
              class="form-control"
              placeholder="블랙리스트 설정"
              aria-label="Recipient's username"
              aria-describedby="button-addon2"
            />
            <div class="input-group-append">
              <button
                class="btn btn-outline-secondary"
                type="button"
                id="button-addon2"
              >
                EDIT
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>

  
  </body>

  <script src="resources/JS/pagesjs/manager_managing_click.js"></script>
  </html>