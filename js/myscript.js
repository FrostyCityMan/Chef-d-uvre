// myscrpit.js

function bbsCheck() {
  //게시판 유효성 검사
  //1) 작성자 2글자 이상 입력
  let wname = document.getElementById("wname").value;
  wname = wname.trim();
  if (wname.length < 2) {
    alert("이름을 두글자 이상 입력하세요.");
    return false;
  }
  //2) 제목 2글자 이상 입력
  let subject = document.getElementById("subject").value;
  subject = subject.trim();
  if (subject.length < 2) {
    alert("제목을 두글자 이상 입력하세요.");
    return false;
  }
  //3) 내용 입력 유무
  let content = document.getElementById("content").value;
  content = content.trim();
  if (content.length < 1) {
    alert("내용을 입력 해주세요.");
    return false;
  }

  //4) 비밀번호 4글자 이상 입력, 숫자만.
  let passwd = document.getElementById("passwd").value;
  passwd = passwd.trim();
  if (passwd.length < 4) {
    alert("비밀번호를 4글자 이상 입력해주세요.");
    return false;
  } else if (isNaN(passwd)) {
    alert("비밀번호는 숫자로만 입력해주세요.");
    return false;
  }

  return true; //onsubmit이벤트에서 서버로 전송
} //end bbsCheck();

function pwCheck() {
  let passwd = document.getElementById("passwd").value;
  passwd = passwd.trim();
  if (passwd.length < 4) {
    alert("비밀번호를 4글자 이상 입력해주세요.");
    return false;
  } else if (isNaN(passwd)) {
    alert("비밀번호는 숫자로만 입력해주세요.");
    return false;
  }
  let message = "정말로 삭제 하시겠습니까?";
  if (confirm(message)) {
    return true;
  } else {
    return false;
  } //end if
} //end pwCheck;

function updateCheck() {
  //1) 작성자 2글자 이상 입력
  let wname = document.getElementById("wname").value;
  wname = wname.trim();
  if (wname.length < 2) {
    alert("이름을 두글자 이상 입력하세요.");
    return false;
  }
  //2) 제목 2글자 이상 입력
  let subject = document.getElementById("subject").value;
  subject = subject.trim();
  if (subject.length < 2) {
    alert("제목을 두글자 이상 입력하세요.");
    return false;
  }
  //3) 내용 입력 유무
  let content = document.getElementById("content").value;
  content = content.trim();
  if (content.length < 1) {
    alert("내용을 입력 해주세요.");
    return false;
  }

  let passwd = document.getElementById("passwd").value;
  passwd = passwd.trim();
  if (passwd.length < 4) {
    alert("비밀번호를 4글자 이상 입력해주세요.");
    return false;
  } else if (isNaN(passwd)) {
    alert("비밀번호는 숫자로만 입력해주세요.");
    return false;
  }
  let message = "정말로 수정 하시겠습니까?";
  if (confirm(message)) {
    return true;
  } else {
    return false;
  } //end if
}

function setCookie(name, value, expiredays) {
  var todayDate = new Date();
  todayDate.setDate(todayDate.getDate() + expiredays);
  document.cookie =
    name +
    "=" +
    escape(value) +
    "; path=/; expires=" +
    todayDate.toGMTString() +
    ";";
}

function searchCheck() {
  //검색어를 입력해야만 서버로 전송
  let word = document.getElementById("word").value;
  word = word.trim();
  if (word.length == 0) {
    alert("검색어를 입력해주세요");
    return false;
  }
  return true;
}

function loginCheck(){   //로그인 유효성 검사 (아이디, 비번)
  //1) 아이디 5~10글자 이내인지 검사
  let id = document.getElementById("id").value;         //id 가져오기
  id = id.trim();
  if( !(5 <= id.length && id.length <= 10) ){
    alert("아이디 5~10글자 이내로 입력해주세요.");
    document.getElementById("id").focus();            //id 칸에 커서 생성
    return false;                              //서버로 전송하지 않음. (onsubmit은 return값 가짐)
  }//if end

  //2) 비밀번호 5~10글자 이내인지 검사
  let passwd = document.getElementById("passwd").value;   //비밀번호 가져오기
  passwd = passwd.trim();
  if( !(5 <= passwd.length && passwd.length <= 10) ){
    alert("비밀번호 5~10글자 이내로 입력해주세요.");
    document.getElementById("passwd").focus;
    return false;
  }//if end

}//loginCheck() end
// document.getElementById("btnclose").addEventListener("click", function(){
//   this.parentNode.parentNode.style.display = 'none';});
//
// function close(){
//
// }
//
// function closeWin() {
//   if ( document.notice_form.chkbox.checked ){
//     setCookie( "maindiv", "done" , 1 );
//   }
//   document.all['divpop'].style.visibility = "hidden";
// }

function idCheck(){//아이디 중복확인
  //모달 창? ->부모창과 자식창이 한 몸으로 구성되어 있음

  //새창 만들기
  //->모바일에 기반을 둔 Frontend단에서는 사용하지 말것
  //-> 부모창과 자식창이 별개로 구성되어 있음
  //window.open("파일명","새창이름", "다양한 옵션들")
  window.open("idCheckForm.jsp", "idwin", "width=400,height=350");

}//end idCheck

function emailCheck(){
  window.open("emailCheckForm.jsp", "emailwin","width=400,height=350" )
}