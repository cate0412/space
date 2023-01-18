<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
  
    <%@ include file="../host_top.jsp"%>
  
    <script type="text/javascript">
		function check(){
			if (f.room_nm.value==""){
				alert("방이름을 입력해 주세요!!")
				f.room_nm.focus()
				return 
			}
			if (!f.room_price.value){
				alert("가격을 입력해 주세요!!")
				f.room_price.focus()
				return 
			}
			if (f.room_fit.value==""){
				alert("수용인원을 입력해 주세요!!")
				f.room_fit.focus()
				return 
			}
			if (f.room_desc.value==""){
				alert("방 설명을 입력해 주세요!!")
				f.room_desc.focus()
				return 
			}
			
		document.f.submit()			
		}
	</script>
    
    
    <script type="text/javascript">
	function checkDel(room_no, room_img1, room_img2, room_img3, room_img4, room_img5){
		var isDel = window.confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			document.d.room_no.value = room_no
			document.d.room_img1.value = room_img1
			document.d.room_img2.value = room_img2
			document.d.room_img3.value = room_img3
			document.d.room_img4.value = room_img4
			document.d.room_img5.value = room_img5
			document.d.submit()
		}
	}
</script>
    
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>방 수정 페이지</title>
    <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">

</head>

<body>
<div class="container">                                    
	<div class="py-5 text-center">
			<h2>방 수정 페이지</h2>
				<br><br>
				<hr class="mb-4">
		</div>
	
		<form name="f" action="room_update_ok.do" method="post" onsubmit="return checkRoom();" enctype="multipart/form-data" >
			<input type="hidden" name="room_no" value="${getRoom.room_no}"/>
			<input type="hidden" name="space_no" value="${space_nono}"/>
		
	
		<div class="mb-3">
				<label for="nm">방 이름* <span class="text-muted">(Room Name)</span></label>
  			<input type="text" name="room_nm"  value="${getRoom.room_nm}" readOnly class="form-control" >
			</div>
		
		<div class="mb-3">
				<label for="price">가격*(요금은 시간으로 책정됩니다.) <span class="text-muted">(Price)</span></label>
  			<input type="text" name="room_price" value="${getRoom.room_price}" class="form-control" >
			</div>
		 
		 <div class="mb-3">
				<label for="capacity">수용인원* <span class="text-muted">(Capacity)</span></label>
  			<input type="text" name="room_fit"  value="${getRoom.room_fit}" class="form-control" >
			</div>
		 
		 <div class="mb-3">
				<label for="explanation">방 설명* <span class="text-muted">(Explanation)</span></label>
  				<textarea name="room_desc" class="form-control" >${getRoom.room_desc}</textarea>
			</div>
		<div class="input-group">
  			<div class="input-group-prepend">
		<span class="input-group-text" id="roomImg">기존 이미지</span>
		

			<img src="${pageContext.request.contextPath}/resources/img/${getRoom.room_img1}" width="200" height="150" alt="이미지를 추가해주세요">
			<img src="${pageContext.request.contextPath}/resources/img/${getRoom.room_img2}" width="200" height="150" alt="이미지를 추가해주세요">
			<img src="${pageContext.request.contextPath}/resources/img/${getRoom.room_img3}" width="200" height="150" alt="이미지를 추가해주세요">
			<img src="${pageContext.request.contextPath}/resources/img/${getRoom.room_img4}" width="200" height="150" alt="이미지를 추가해주세요">
			<img src="${pageContext.request.contextPath}/resources/img/${getRoom.room_img5}" width="200" height="150" alt="이미지를 추가해주세요">
			</div>
		</div>
		<br>
		
		<div class="mb-3" >
				<label for="image1">이미지1 <span class="text-muted">(Image.NO.1)</span></label>
				<input type="file"class="form-control" name="room_img1">
				<input type="hidden" name="room_img_1" value="${getRoom.room_img1}"/>
		</div>	
		
		<div class="mb-3" >
				<label for="image2">이미지2 <span class="text-muted">(Image.NO.2)</span></label>
				<input type="file"class="form-control" name="room_img2">
				<input type="hidden" name="room_img_2" value="${getRoom.room_img2}"/>
		</div>	
		
		<div class="mb-3" >
				<label for="image3">이미지3 <span class="text-muted">(Image.NO.3)</span></label>
				<input type="file"class="form-control" name="room_img3">
				<input type="hidden" name="room_img_3" value="${getRoom.room_img3}"/>
		</div>	
		
		<div class="mb-3" >
				<label for="image4">이미지4 <span class="text-muted">(Image.NO.4)</span></label>
				<input type="file"class="form-control" name="room_img4">
				<input type="hidden" name="room_img_4" value="${getRoom.room_img4}"/>
		</div>	
		
		<div class="mb-3" >
				<label for="image5">이미지5 <span class="text-muted">(Image.NO.5)</span></label>
				<input type="file"class="form-control" name="room_img5">
				<input type="hidden" name="room_img_5" value="${getRoom.room_img5}"/>
		</div>	
		
		<div class="form-row">
			<div class="mb-3 col-md-6">
				<label for="timeS">기존 시작시간 <span class="text-muted">(Previous start time to use a room)</span></label>
  						<p class="form-control"><fmt:formatDate value="${getRoom.room_time_s}" pattern="HH시"/></p>
			</div>	
			
			<div class="mb-3 col-md-6">
				<label for="timeS">수정된 시간 <span class="text-muted">(New start time to use a room)</span></label>
				<input type="number" min="00" max="23" maxlength="2" placeholder="HH" class="form-control startTime" onKeyup="timeLimit(this);" name="time_s">
				<input type="hidden" name="room_time_s" value="${getRoom.room_time_s}"/>
			</div>		
		</div>		
		
		<div class="form-row">
			<div class="mb-3 col-md-6">
				<label for="timeE">기존 종료시간 <span class="text-muted">(Previous end time to use a room)</span></label>
  						<p class="form-control"><fmt:formatDate value="${getRoom.room_time_e}" pattern="HH시"/></p>
			</div>	
			
			<div class="mb-3 col-md-6">
				<label for="timeE">수정된 시간 <span class="text-muted">(New end time to use a room)</span></label>
				<input type="number" min="00" max="23" maxlength="2" placeholder="HH" class="form-control endTime" onKeyup="timeLimit(this);" name="time_e">
				<input type="hidden" name="room_time_e" value="${getRoom.room_time_e}"/>
			</div>		
		</div>
			<div class="form-row">
				<div class="mb-3">
					<label for="offDay">휴무일 선택<span class="text-muted">(Off
							day)</span></label><br>
					<button type="button" name="b1" class="day btn btn-secondary"
						value="1">일</button>
					<button type="button" name="b2" class="day btn btn-secondary"
						value="1">월</button>
					<button type="button" name="b3" class="day btn btn-secondary"
						value="1">화</button>
					<button type="button" name="b4" class="day btn btn-secondary"
						value="1">수</button>
					<button type="button" name="b5" class="day btn btn-secondary"
						value="1">목</button>
					<button type="button" name="b6" class="day btn btn-secondary"
						value="1">금</button>
					<button type="button" name="b7" class="day btn btn-secondary"
						value="1">토</button>
					<input type="hidden" id="room_week" name="room_week" value="${getRoom.room_week}">
<%-- 					 <input type="hidden" id="roomwk" value="${getRoom.room_week}">  --%>
				</div>
			</div>
				<div class="row">
					<div class="col text-center">
						<div class="btn-group" role="group" aria-label="button">
							<input type="submit" class="btn btn-dark" value="수정">
  							</a>
  							<input type="reset" class="btn btn-secondary"  value="취소" />
  								<a href="javascript:checkDel('${getRoom.room_no}','${getRoom.room_img1}','${getRoom.room_img2}','${getRoom.room_img3}','${getRoom.room_img4}','${getRoom.room_img5}')" class="btn btn-danger">
  									<span class="text">삭제</span>
  								</a>
  							<input type="button" class="btn btn-secondary" value="방 목록보기" onclick="window.location='room_list.do'">
						</div> 
					</div>
				</div>	
			</form>
		</div>
	<form name="d" action="room_delete.do" method="post">
		<input type="hidden" name="room_no"/>
		<input type="hidden" name="room_img1"/>
		<input type="hidden" name="room_img2"/>
		<input type="hidden" name="room_img3"/>
		<input type="hidden" name="room_img4"/>
		<input type="hidden" name="room_img5"/>
	</form>

<script src="resources/js/jquery.js" ></script>
    <script type="text/javascript" src="resources/bootstrap/js/bootstrap.bundle.js" ></script>
</body>
</html>
    <script type="text/javascript">
    function timeLimit(time){
		if(time.length>=3){
			if(isFinite(time)==false){
				alert("문자는 입력하실 수 없습니다.");
				time.value = 00;
				return false;
			}
			if(time>24){
				alert("시간은 23시를 넘길 수 없습니다.");
				time.value = 23;
				return false;
			}
			time.value = time;
		}
	}
	
	function checkRoom(){
		if(parseInt($(".startTime").val()) > parseInt($(".endTime").val())){
			alert("시작시간은 종료시간보다 이른시간이여야 합니다.");
			$(".startTime").focus();
			return false;
		}
		
	}
    </script>
<script src="resources/js/room_update.js"></script>
<%@ include file="../host_bottom.jsp"%>