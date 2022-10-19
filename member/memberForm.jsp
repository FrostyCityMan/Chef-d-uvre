<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 memberForm.jsp-->
<script src="../js/myscript.js"></script>
<h3>Sign up</h3>
<img src="../images/Chef-d'œuvre%20logo.png" style="width: 15%">
<h2>Chef-d'œuvre에 오신것을 환영합니다.</h2>
<p>Chef-d'œuvre는 소프트웨어 개발자를 위한 지식공유 플랫폼입니다.</p>
<br>
<br>
<form name="memfrm" id="memfrm" class="col-md-4" style="float: none; margin:0 auto;" action="memberProc.jsp" onsubmit="return memberCheck()">
<%--    myscript.js--%>
<table class="table grid">
<tr>
    <td style="text-align: left; padding: 10px 0px;">
        <div style="font-size: 15px; color:grey;">아이디</div>
      <input type="text" name="id" id="id" size="45" style="border-radius: 10px; margin-bottom: 10px;" readonly onclick="idCheck()" placeholder="아이디는 5~10글자 이내로 입력해주세요.">

      <input class="btn btn-light" type="button" value="ID중복확인" onclick="idCheck()">
<%--        myscript.js--%>
    </td>
</tr>
<tr>
    <td style="text-align: left; padding: 10px 0px;">
        <div style="font-size: 15px; color:grey;">비밀번호</div>
        <input
                type="password"
                name="passwd"
                id="passwd"
                size="45"
                style="border-radius: 10px;"
                placeholder="최소 6자 이상(알파벳과 숫자로만 입력해주세요.)"
                required>
    </td>
</tr>
<tr>
    <td style="text-align: left; padding: 10px 0px;"><div style="font-size: 15px; color:grey;">비밀번호 확인</div>
        <input
            type="password"
            name="repasswd"
            id="repasswd"
            size="45"
            style="border-radius: 10px;"
            required
            placeholder="위와 동일하게 입력해주세요.">
    </td>
</tr>
<tr>
    <td style="text-align: left; padding: 10px 0px;"><div style="font-size: 15px; color:grey;">이름</div><input type="text" name="mname" id="mname" size="45" style="border-radius: 10px;" maxlength="20" required placeholder="전우치"></td>
</tr>
<tr>
    <td style="text-align: left; padding: 10px 0px;">
        <div style="font-size: 15px; color:grey;">이메일</div>
      <input type="email" name="email" id="email" size="45" style="border-radius: 10px; margin-bottom: 10px;" readonly onclick="emailCheck()" placeholder="master@Chef-d'œuvre.co.kr">
      <input class="btn btn-light" type="button" value="Email 중복확인" onclick="emailCheck()">
    </td>
</tr>
<tr>
    <td style="text-align: left; padding: 10px 0px;">
        <div style="font-size: 15px; color:grey;">연락처</div><input type="text" name="tel" id="tel" size="45" style="border-radius: 10px;" placeholder="010-0000-0000"> </td>
</tr>
<tr>
    <td style="text-align: left; padding: 10px 0px;">
        <div style="font-size: 15px; color:grey;">우편번호</div>
      <input type="text" name="zipcode" id="zipcode" size="45" style="border-radius: 10px; margin-bottom: 10px;"  readonly placeholder="주소찾기를 통해 찾아주세요.">
      <input class="btn btn-light" type="button" value="주소찾기" onclick="DaumPostcode()">
    </td>
</tr>
<tr>  
  <td style="text-align: left; padding: 10px 0px;">
      <div style="font-size: 15px; color:grey;">주소</div><input type="text" name="address1" id="address1" size="45" style="border-radius: 10px;" readonly></td>
</tr>
<tr>  
  <td style="text-align: left; padding: 10px 0px;">
      <div style="font-size: 15px; color:grey;">나머지주소</div><input type="text" name="address2" id="address2" size="45" style="border-radius: 10px;"> </td>
</tr>
<tr>  
  <td style="text-align: left; padding: 10px 0px;">
      <div style="font-size: 15px; color:grey;">직업</div>
        <select name="job"  id="job">
          <option value="0">선택하세요.</option>
          <option value="A01">회사원</option>
          <option value="A02" selected>IT관련직</option>
          <option value="A03">학생</option>
          <option value="A04">주부</option>
          <option value="A05">기타</option>
        </select>
  </td>
</tr>
<tr>
    <td colspan="2">
        <input type="submit" value="회원가입"  class="btn btn-light"/>
        <input type="reset"  value="취소"      class="btn btn-light"/>
    </td>
</tr>
</table>

<!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->

</form>

<!-- 본문 끝 -->           
<%@ include file="../footer.jsp"%>