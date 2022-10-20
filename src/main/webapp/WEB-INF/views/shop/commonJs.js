function loginCheck(url){
	event.preventDefault();
	if('${session.loginUser eq null}'){
		location.href=url;
	}else{
		alert("로그인을 해주세요.");
		location.href="";		
	}
}