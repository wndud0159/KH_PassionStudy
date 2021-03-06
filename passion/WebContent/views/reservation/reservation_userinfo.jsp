<%@ page import="com.passionStudy.passion.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Welcome Passion StudyCafe~!</title>
	<script src="/passion/resources/JS/pagesjs/reservation_change_page.js"></script>
  </head>
<%
	if (loginMember == null) {
%>
<script>
	alert('로그인 후 이용 가능한 컨텐츠입니다.');
	location.href = 'index.jsp';
</script>
<%
	}
%>
  <body>
    <div class="cont_header">
      <div class="cont_wrapper">
        <h1>예약 / 결제</h1>
      </div>
    </div>


    <div class="tabtype btn_align_center">
      <div class="tabtype_wrapper">
        <ul>
          <li style="width: 33%;">
            <a href="index.jsp?inc=./views/reservation/reservation_roominfo.jsp" >
              <button class="btn1">예약하기</button>
            </a>
          </li>
          <li style="width: 33%;">
            <button class="btn2 on" disabled>예약자 정보입력</button>
          </li>
          <li style="width: 33%;">
            <button class="btn3" style="cursor:not-allowed; background-color: rgb(190, 190, 190); color: black;" disabled>결제하기</button>
          </li>
        </ul>
      </div>
    </div>

    <section class="section">
	<form name='formInfoData' method='post' action='reservation.payment'>
      <div class="container">
        <div class="reservation_space">
          <h5 class="reservation_space_title">예약공간</h5>
          <hr class="line" />
          <table class="reservation_space_content">
            <tr>
              <td class="room_img" rowspan="3">
                <img
                  src="resources/images/rooms/6-8_Room01.jpg"
                  width="480px"
                  height="400px"
                />
              </td>
              <td class="room_title">
                <h5 class="room_person_number">${param.roomMin } ~ ${param.roomMax }인실</h5>
                <h5 class="room_time_price">총 ${param.total_time } 시간</h5>
              </td>
            </tr>
            <tr>
              <td class="room_introduce">
                <p>
                  ${param.roomMin }인 테이블입니다.
                  <br />
                  책상 없이 의자만 추가하면 최대 ${param.roomMax }인까지 이용 가능합니다:)
                  <br />
                  추가적인 필수 주문사항 없습니다.
                  <br />
                  필요하신 대여 장비만 비용 확인 후 예약해주세요 :)
                </p>
              </td>
            </tr>
            <tr>
              <td class="room_item">
                <ul class="room_item_list">
                  <li>
                    <img
                      src="resources/images/icon/multi.png"
                      class="room_item_img"
                      width="30px"
                      height="30px"
                    />
                    <span class="room_item_name"
                      >유선랜 pc + 모니터 + 키보드 + 마우스</span
                    >
                  </li>
                  <li>
                    <img
                      src="resources/images/icon/projector.png"
                      class="room_item_img"
                      width="30px"
                      height="30px"
                    />
                    <span class="room_item_name">프로젝터</span>
                  </li>
                  <li>
                    <img
                      src="resources/images/icon/monitor.png"
                      class="room_item_img"
                      width="30px"
                      height="30px"
                    />
                    <span class="room_item_name">추가 모니터 (무료)</span>
                  </li>
                  <li>
                    <img
                      src="resources/images/icon/hdmi-cable.png"
                      class="room_item_img"
                      width="30px"
                      height="30px"
                    />
                    <span class="room_item_name"
                      >32인치 모니터 + HDMI케이블 (무료)</span
                    >
                  </li>
                  <li>
                    <img
                      src="resources/images/icon/whiteboard.png"
                      class="room_item_img"
                      width="30px"
                      height="30px"
                    />
                    <span class="room_item_name"
                      >화이트보드 + 보드마카 (무료)</span
                    >
                  </li>
                  <li>
                    <img
                      src="resources/images/icon/wifi.png"
                      class="room_item_img"
                      width="30px"
                      height="30px"
                    />
                    <span class="room_item_name">인터넷 / 와이파이 (무료)</span>
                  </li>
                  <li>
                    <img
                      src="resources/images/icon/socket.png"
                      class="room_item_img"
                      width="30px"
                      height="30px"
                    />
                    <span class="room_item_name">콘센트 (무료)</span>
                  </li>
                </ul>
              </td>
            </tr>
          </table>
        </div>
        <div class="reservation_information">
          <h5 class="reservation_information_title">예약정보</h5>
          <hr class="line" />
          <table class="reservation_information_content">
            <tr>
              <td class="reservation_information_subtitle">예약날짜</td>
              <td class="reservation_information_result">
                ${param.selectCalendarDate.substring(0, 4) }년 
                ${param.selectCalendarDate.substring(4, 6) }월
                ${param.selectCalendarDate.substring(6, 8) }일
              </td>
            </tr>
            <tr>
              <td class="reservation_information_subtitle">예약인원</td>
              <td class="reservation_information_result">${param.countUsers }명</td>
            </tr>
          </table>
        </div>
        <div class="reseller_information">
          <h5 class="reseller_information_title">예약자 정보</h5>
          <hr class="line" />
            <table class="reseller_information_content">
              <tr>
                <td colspan="2"></td>
              </tr>
              <tr>
                <th class="reseller_information_subtitle">예약자</th>
                <td class="reseller_information_textbox">
                  <input
                    type="text"
                    name="reservationName"
                    class="reseller"
                    placeholder="이름을 적어주세요."
                    required
                    value='${param.reservationName }'
                  />
                </td>
              </tr>
              <tr>
                <th class="reseller_information_subtitle">연락처</th>
                <td class="reseller_information_textbox">
                  <select name="tel_first" class="tel_first">
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="017">017</option>
                  </select>
                  - <input type="text" name="tel_second" class="tel_second" value='${param.tel_second }' required/> -
                  <input type="text" name="tel_third" class="tel_third" value='${param.tel_third }' required/>
                </td>
              </tr>
              <tr>
                <th class="reseller_information_subtitle">이메일</th>
                <td class="reseller_information_textbox">
                  <input type="text" name="email_id" class="email" value='${param.email_id }'/> @
                  <input
                    type="text"
                    name="email_dns"
                    class="email_dns"
                    placeholder="example.com"
                    required
                    value='${param.email_dns}'
                  />
                  <select name="emailaddr" class="emailaddr" onChange="selectEmail(this)">
                    <option value="1">직접입력</option>
                    <option value="daum.net">daum.net</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="naver.com">naver.com</option>
                    <option value="nate.com">nate.com</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th class="reseller_information_subtitle">요청사항</th>
                <td class="reseller_information_textbox">
                  <textarea id='feedback' name="feedback" rows="10" cols="100" placeholder="남기고 싶은 말을 적어주세요."></textarea>
                </td>
              </tr>
            </table>
            <ul class="reseller_join_box">
              <li class="checkBox check01">
                <ul class="clearfix">
                  <li>
                    이용자 약관 전체 동의
                    <input
                      type="checkbox"
                      name="chkAll"
                      id="check_all"
                      class="chkAll"
                    />
                  </li>
                </ul>
              </li>
              <li class="checkBox check02">
                <ul class="clearfix">
                  <li>
                    개인정보 수집동의
                    <span class="txt_required">(필수)</span>
                    <input type="checkbox" name="chk" class="checkBtn" required/>
                  </li>
                </ul>
                <textarea>
 (개인정보 수집 동의)

  1. 기본수집항목: [필수] 아이디, 이름, (휴대)전화번호, 이메일 주소
    ※ 추가 수집하는 필수항목
    - 배송, 방문 등이 필요한 상품 구매 시 : 주소
    - 해외 여행 관련 상품 구매 시 : 여권상 영문명, 여권번호 끝 4자리, 성별, 생년월일, 이메일주소, 카카오톡ID, 동행 
    아동정보(여권상 영문명, 생년월일, 신장)
    - 병원을 이용하는 경우: 생년월일 

  2. 수집 및 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 
     해결을 위한 기록보존,  예약 이용 후 리뷰작성에 따른 포인트 지급 및 관련 안내

  3. 보관기간
    - 회원탈퇴 등 개인정보 이용목적 달성 시까지 보관
    - 단, 상법 및 ‘전자상거래 등에서의 소비자 보호에 관한 법률’ 등 관련 법령에 의하여 일정 기간 보관이 필요한 
      경우에는 해당 기간 동안 보관함

  4. 동의 거부권 등에 대한 고지: 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 
     서비스 예약이 제한될 수 있습니다.
                  </textarea>
              </li>
              <li class="checkBox check03">
                <ul class="clearfix">
                  <li>개인정보 제공동의<span class="txt_required">(필수)</span><input type="checkbox" name="chk" class="checkBtn" required/></li>
                </ul>
                <textarea>
 (개인정보 제공 동의)

  1. 개인정보를 제공받는 자 : 열정 스터디카페 

  2. 제공하는 기본 개인정보 항목:  [필수] 아이디, 이름, (휴대)전화번호, 이메일 주소
     ※ 추가 제공하는 필수항목
     - 배송, 방문 등이 필요한 상품 구매 시 : 주소
     - 해외 여행 관련 상품 구매 시 : 여권상 영문명, 여권번호 끝 4자리, 생년월일, 이메일주소, 카카오톡ID, 동행 
       아동정보(여권상 영문명, 생년월일, 신장)
     - 병원을 이용하는 경우: 생년월일

  3. 개인정보를 제공받는 자의 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 서비스 분석과 통계에 따른 혜택 
     및 맞춤 서비스 제공, 민원처리 등 고객상담, 고객관리, 서비스 이용에 따른 설문조사 및 혜택 제공, 분쟁조정을 위한 
     기록보존
                    
  4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 회원탈퇴 시 또는 위 개인정보 이용목적 달성 시 까지 
     이용합니다.
                    
  5. 동의 거부권 등에 대한 고지 : 정보주체는 개인정보 제공 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 
     제한될 수 있습니다.
                  </textarea>
              </li>
            </ul>
			<input type='hidden' id='selectCalendarDate' name='selectCalendarDate' value='${param.selectCalendarDate }'/>
			<input type='hidden' id='firstTimeData' name='firstTimeData' value='${param.firstTimeData }' />
			<input type='hidden' id='secondTimeData' name='secondTimeData' value='${param.secondTimeData }' />
			<input type='hidden' id='thirdTimeData' name='thirdTimeData' value='${param.thirdTimeData }' />
			<input type='hidden' id='fourthTimeData' name='fourthTimeData' value='${param.fourthTimeData }' />
			<input type='hidden' id='fifthTimeData' name='fifthTimeData' value='${param.fifthTimeData }' />
			<input type='hidden' id='lastTimeData' name='lastTimeData' value='${param.lastTimeData }' />
			<input type='hidden' id='total_time' name='total_time' value='${param.total_time }' />
			<input type='hidden' id='member_no' name='member_no' value='${param.member_no }'/>
			<input type='hidden' id='reservationName' name='reservationName' value='${param.reservationName }'/>
			<input type='hidden' id='tel_first' name='tel_first' value='${param.tel_first }' />
			<input type='hidden' id='tel_second' name='tel_second' value='${param.tel_second }' />
			<input type='hidden' id='tel_third' name='tel_third' value='${param.tel_third }' />
			<input type='hidden' id='email_id' name='email_id' value='${param.email_id }' />
			<input type='hidden' id='email_dns' name='email_dns' value='${param.email_dns }' />
			<input type='hidden' id='room_no' name='room_no' value='${param.room_no }' />
			<input type='hidden' id='roomName' name='roomName' value='${param.roomName }' />
			<input type='hidden' id='roomMin' name='roomMin' value='${param.roomMin }' />
			<input type='hidden' id='roomMax' name='roomMax' value='${param.roomMax }' />
			<input type='hidden' id='roomPrice' name='roomPrice' value='${param.roomPrice }' />
			<input type='hidden' id='countUsers' name='countUsers' value='${param.countUsers }' />
			<input type='hidden' id='monitor' name='monitor' value='${param.monitor }' />
			<input type='hidden' id='computer' name='computer' value='${param.computer }' />
			<input type='hidden' id='projector' name='projector' value='${param.projector }' />
			<input type='hidden' id='memPoint' name='memPoint' value='${param.memPoint }' />
        </div>
        <div class="next_button">
          <button class="next" id='userinfo_to_payment'>다음단계</button>
        </div>
      </div>
    </form>
    </section>
  </body>
  <script>reservation_change_page()</script>
  <script src="resources/JS/pagesjs/reservation_userinfo.js"></script>
</html>