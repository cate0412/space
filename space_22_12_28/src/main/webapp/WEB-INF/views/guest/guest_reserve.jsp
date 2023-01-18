<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>예약 및 결제</title>
    <!-- Bootstrap core CSS -->
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/bootstrap/guest/guest.css" rel="stylesheet">
<script src="resources/js/jquery.js" ></script>
<script src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <style>
    	.reserve_con{
		width: 50%;
		padding-right: 15px;
		padding-left: 15px;
		margin-right: auto;
		margin-left: auto;
    	}
    </style>
      </head>

  <body class="bg-light">

<div class="reserve_con">
  <div class="py-5-1 text-center">
 	<br><br><br>
    <h2>예약페이지</h2>
    <br>
  </div>
		<hr class="mb-4">
      <form class="needs-validation" action="guest_reserveok.do" method="POST" novalidate>
      <input type="hidden" name="room_no" value="${srdto.room_no}">
      <input type="hidden" name="member_no" value="${memberdto.member_no}">
       <div class="row">
          <div class="col-md-5 mb-3">
            <label for="res_nm">예약자명</label>
            <input type="text" class="form-control" name="res_nm" placeholder="예약자명" required>
            <div class="invalid-feedback">
             	 예약자명을 입력해주세요.
            </div>
          </div>
    	  <div class="col-md-5 mb-3">
            <label for="member_nm">닉네임</label>
            <input type="text" class="form-control" name="member_nm" placeholder="${memberdto.member_nm}"readonly>
          </div>
          
          <div class="col-md-2 mb-3">
            <label for="res_personnel">예약인원</label>
            <input type="number" class="form-control" name="res_personnel" placeholder="00" max="${srdto.room_fit}" required>
             <div class="invalid-feedback">
             	최대예약인원은 ${srdto.room_fit}명입니다.
            </div>
          </div>
        </div>
         <div class="mb-3">
          <label for="res_pno">예약자 연락처</label>
          <input type="text" class="form-control" name="res_pno" placeholder="-를 제외한 숫자만 입력해주세요" required>
          <div class="invalid-feedback">
			연락처를 입력해주세요
          </div>
        </div>
        <div class="mb-3">
          <label for="res_email">이메일</label>
          <input type="email" class="form-control" name="res_email" id="res_email" value="${memberdto.member_email}" placeholder="${memberdto.member_email}"readonly>
          <div class="invalid-feedback">
			예약내역을 받을 이메일 주소를 입력해주세요.
          </div>
        </div>
        <div class="mb-3">
          <label for="res_purpose">사용목적</label>
          <input type="text" class="form-control" name="res_purpose" placeholder="간단한 사용목적을 입력해주세요" required>
         <div class="invalid-feedback">
			사용목적을 입력해주세요
          </div>
        </div>
        
        <div class="mb-3">
          <label for="res_req">요청사항</label>
          <input type="text" class="form-control" name="res_req" placeholder="요청사항을 입력해주세요">
        </div>
        
        <div class="mb-3">
          	<p>
		      <label for="use_dt">대여 시작 시간</label>
		      <input type="text" name="use_dt" id="use_dt" value="${map.sTime}" placeholder="${map.sTime}" readOnly>
		    </p>
			<p>
				<label for="use_time">대여 종료 시간</label>
				<input type="text" name="use_time" id="use_time" value="${map.eTime}" placeholder="${map.eTime}" readOnly>
				</p>
        </div>
        <div class="row">
          <div class="col-md-5 mb-3">
            <label for="space_nm">건물명</label>
            <input type="text" class="form-control" id="space_nm" placeholder="${sdto.space_nm}" readonly>
          </div>
          <div class="col-md-5 mb-3">
            <label for="room_nm">방 이름</label>
            <input type="text" class="form-control" id="room_nm" placeholder="${srdto.room_nm}" readonly>
          </div>

        </div>
        <hr class="mb-4">
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="save-info" required>
          <label class="custom-control-label" for="save-info">본 이용약관에 동의합니다.</label>
		  <div class="invalid-feedback">
			이용약관에 동의해주셔야합니다.
          </div>
        </div>
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="save-adds">
          <label class="custom-control-label" for="save-adds">광고 및 마케팅 수신에 동의</label>
        </div>
		<hr class="mb-4">
        <h4 class="mb-3">Payment</h4>
        <div class="mb-3">
          <label for="totalPrice">결제금액</label>
          <input type="text" class="form-control" name="totalPrice" value="${map.totalPrice}" placeholder="${map.totalPrice}" readOnly>
        </div>
        <div class="d-block my-3">
	        <div class="pay">
				<input type="radio" name="pay_m" value="1" id="1" required><label for="1">현장결제</label>
				&nbsp;&nbsp;/&nbsp;&nbsp; 
				<input type="radio" name="pay_m" value="2" id="2" required><label for="2">무통장입금</label> 
				<p>&nbsp;※ 무통장 입금의 경우, 이용일 하루 전까지 결제가 완료되어야 이용가능합니다. 
			</div>
        </div>
         <hr class="mb-4">
         <button class="btn btn-info" type="submit">예약하기</button>
		 <hr class="mb-4">
      </form>
</div>
<script>
//Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  window.addEventListener('load', function () {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation')

    // Loop over them and prevent submission
    Array.prototype.filter.call(forms, function (form) {
      form.addEventListener('submit', function (event) {
        if (form.checkValidity() === false) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add('was-validated')
      }, false)
    })
    
  }, false)

})()

</script>
  


  </body>
  <%@ include file="bottom.jsp"%>
</html>
