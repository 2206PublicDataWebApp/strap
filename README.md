# &nbsp;STRAP : 운동 파트너 매칭 사이트
![strap](https://user-images.githubusercontent.com/109054181/201529973-78060145-d95e-4c15-86b1-7034169a3a65.PNG)
#
## :speech_balloon: 프로젝트 소개
STRAP은 다양한 맞춤 추천을 통해 내가 원하는 운동 파트너를 추천 받아서 같이 운동 할 사람을 찾을 수 있도록 연결시켜주고,
운동할 때 필요한 보충제 판매를 하는 쇼핑몰과 운동 정보, 매칭 후기를 공유하는 사이트 입니다.
## :calendar: 개발 기간
``` 
2022.10.06 ~ 2022.11.17
```
## :raising_hand_man: 팀원 소개
**박지호** 
* 마이페이지
  - 쪽지함 : 받은 쪽지 조회, 체크박스를 통한 개별 혹은 전체 삭제, 배지를 이용한 새로운 쪽지 알림( 제목, 시간 ), 쪽지 검색
    쪽지 신고, 쪽지를 통한 대화와 상대방 프로필 조회, 매칭일정(날짜-과거날짜 방지, timepicker를 이용한 시간, 메모) 등록
  - 캘린더 : fullcalendar API를 이용한 매칭일정 조회(매칭회원, 날짜, 시간, 메모)를 통한 시간 메모 수정, 삭제 / 개인일정 원하는 날짜 선택하여 시간, 메모 등록, 조회(날짜, 시간, 메모)를 통한 시간 메모 수정, 삭제
  - 일반 문의 : 문의 CRUD
* 관리자페이지
  - 메인 : 테스크 보드(미처리건별 문의/신고 조회, 처리건, 총문의/신고건, 오늘 처리건), 배너 미리보기
  - 문의 관리 : 문의 답변 유형별 조회/등록/수정, 검색
  - 신고 관리 : 신고 처리 유형별 조회/등록/수정, 검색
  - 공지사항 관리 : 공지사항 CRUD
  - 배너 관리 (메인페이지 배너) : 배너 제목, 배너 사진을 조회, 등록, 체크박스를 통한 개별 혹은 전체 삭제, 수정
  
**권마빈**
* 보충제 쇼핑몰
  - 상품 조회
  - 상품 상세페이지 조회
  - 상품 찜하기 / 장바구니
  - 상품 구매
  - 평점 및 리뷰
  - 상품 Q&A
  - 마이쇼핑
  - 보충제 상품 관리
  - 메인페이지 인기 상품
  
**권령익**
* 회원
  - 일반 / 소셜 회원가입 : 아이디,비밀번호,닉네임 Ajax로 유효성 검사, 비밀번호 암호화, 카카오 로그인 API 사용
  - 아이디 찾기 : 아이디 분실 시 이메일 인증 후 해당 이메일로 가입한 아이디 공개
  - 비밀번호 찾기 : 비밀번호 분실 시 이메일 인증 후 해당 이메일에 임시 
  - 정보 조회 및 변경 : 정보 변경 후 바로 적용을 위한 로그인 세션 업데이트
  - 간단 Q&A : 사용자의 운동 패턴(취향) 수집
* 헬스 파트너 매칭 
  - 추천 회원 : 6가지의 맞춤 회원 추천 제공(운동 실력이 비슷한 회원, 내 주변 회원, 3대500이상 회원, 매너점수 높은 회원, 구력높은 회원, 동성 회원)
  - 쪽지 보내기 : 추천받은 회원의 프로필을 열람 후 운동을 같이 하고 싶으면 쪽지를 보낸다
  - 매칭 후기 : 일주일 이내에 진행된 매칭에 대하여 후기 작성
* 관리자 페이지 
  - 회원 관리 : 전체 회원 조회 및 아이디, 닉네임으로 개별 회원조회, 조회한 회원 정보 수정 및 삭제(탈퇴), 페이징처리, 일반회원과 카카오 회원 정렬 제공
  
**김호진**
* 커뮤니티 게시판
  - 게시글 조회, 작성, 수정, 삭제
  - 게시글 신고, 추천
  - 댓글 / 답글 조회, 작성, 삭제
* 메인페이지
  - 메인페이지 틀
  - 인기 매칭 후기 게시글
#
## 🧰&nbsp;개발 환경
<img src="https://img.shields.io/badge/Eclipse%20IDE-2C2255?style=flat&logo=Eclipse%20IDE&logoColor=white"> <img src="https://img.shields.io/badge/Visual%20Studio%20Code-007ACC?style=flat&logo=Visual%20Studio%20Code&logoColor=white"> 
<img src="https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=flat&logo=Apache%20Tomcat&logoColor=white"> <img src="https://img.shields.io/badge/Apache%20Maven-C71A36?style=flat&logo=Apache%20Maven&logoColor=white"> 
<img src="https://img.shields.io/badge/Mybatis-000000?style=flat&logo=Mybatis&logoColor=white"> <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white"> 
 
## ⚙️&nbsp;기술 스택
<img src="https://img.shields.io/badge/spring-6DB33F?style=flat&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white">
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white">
<img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery&logoColor=white"> <img src="https://img.shields.io/badge/JAVA-4682B4?style=flat&logo=JAVA&logoColor=white">
<img src="https://img.shields.io/badge/Oracle-F80000?style=flat&logo=Oracle&logoColor=white"> <img src="https://img.shields.io/badge/Ajax-D3D3D3?style=flat&logo=Ajax&logoColor=white">
<img src="https://img.shields.io/badge/JSON-000000?style=flat&logo=JSON&logoColor=white"> <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=flat&logo=Bootstrap&logoColor=white">

## 주요기능
### 커뮤니티 게시판
|기능명|설명|
|:---:|:---:|
|커뮤니티|사용자는 로그인을 하고 글쓰기 버튼을 통해 게시글을 작성할 수 있고 카테고리, 제목, 내용(+이미지) 값을 넣은 후 완료 또는 취소 버튼을 누르면 게시글 목록으로 이동한다. 작성한 글은 게시글 목록에서 확인이 가능하고, 사용자가 작성한 글의 제목을 누르고 상세페이지로 가면 글 수정 / 삭제를 할 수 있다. 해당 글의 작성자가 아니면 글의 수정 삭제가 불가능하다.|
|게시글 신고 / 추천 |사용자는 모든 글의 상세페이지에서 추천 버튼을 누르면 추천을 할 수 있고 한번 더 누르면 취소가 가능하다. 신고는 신고 버튼을 통해서 할 수 있고 작성자는 자신의 글을 신고 할 수는 없다.|
|댓글 / 답글|글 상세페이지에서 로그인을 했을 때 댓글 / 답글 작성이 가능하고, 조회도 할 수 있다. 수정은 할 수 없고, 해당 글의 작성자만 삭제가 가능하다. 삭제를 하게 되면 작성자에 의해 삭제된 댓글입니다. 라는 문구가 보이게 된다.|
|인기 매칭 후기 게시글|메인 페이지에서 확인이 가능하고 카테고리에서 선택된 후기글 중에 추천을 가장 많이 받은 3개의 글 만 보여지게 된다.글의 내용을 클릭하면 해당 글의 상세페이지로 이동 할 수 있다. |

## 🔍&nbsp;프로젝트 실행 화면
### 1. 로그인
<img src="https://user-images.githubusercontent.com/109054181/202358835-1c86bc47-6b26-4df8-bf13-60e2082fcc99.PNG"  width="800" height="400"/>

### 2. 회원가입
<img src="https://user-images.githubusercontent.com/109054181/202359475-210cc759-fb11-4ced-9aa7-a8763f457d2a.PNG" 
 width="400" height="400"/>
 
### 3. 마이페이지
<img src="https://user-images.githubusercontent.com/109054181/202359754-24a39a5c-7bbd-4ebc-98ee-7c25cf007f69.PNG"
 width="800" height="400"/>
 
### 4. 캘린더
<img src="https://user-images.githubusercontent.com/109054181/202359955-35601e86-0067-45ae-8df9-e54311fa1d1c.PNG"
 width="800" height="400"/>    
 
### 5. 쪽지
<img src="https://user-images.githubusercontent.com/109054181/202360049-8c949fa1-556c-4ca8-863a-5aea6fbda077.PNG"
 width="400" height="400"/>  

### 6. 매칭
<img src="https://user-images.githubusercontent.com/109054181/202360119-c85242d9-7fae-40a9-be36-84d3d1ecd24a.PNG"
 width="800" height="400"/>

### 7. 보충제 리스트
<img src="https://user-images.githubusercontent.com/109054181/202360196-c78a437b-175d-4c14-a318-4c5b6ff7de9e.PNG"
 width="800" height="400"/>   
 
### 8. 보충제 상세페이지
<img src="https://user-images.githubusercontent.com/109054181/202361262-a33c47a5-2416-4a92-999f-ceeb0b962eba.PNG"
 width="800" height="400"/>
 
### 9. 보충제 주문/결제
<img src="https://user-images.githubusercontent.com/109054181/202361432-0276c544-e305-4351-a435-a1c07351987f.PNG"
 width="800" height="400"/>   

### 10 보충제 주문 완료
<img src="https://user-images.githubusercontent.com/109054181/202361581-2e1c5af6-c2e3-4ad0-8a6e-de01e35b32e0.PNG"
 width="800" height="400"/>   

### 11. 보충제 상품 후기
<img src="https://user-images.githubusercontent.com/109054181/202361601-05ad10e9-21b4-4e63-81d6-83868cab77dc.PNG"
 width="800" height="400"/>   
 
### 12. 커뮤니티 게시판
<img src="https://user-images.githubusercontent.com/109054181/202361627-cf21aa29-01ea-4581-b027-a97370b378ae.PNG"
 width="800" height="400"/>   
 
### 13. 게시판 댓글/답글
<img src="https://user-images.githubusercontent.com/109054181/202361662-d8bd7dd0-85bc-4e90-a9cd-aa32d7a1d197.PNG"
 width="800" height="400"/>   
 
### 14. 게시판 글쓰기
<img src="https://user-images.githubusercontent.com/109054181/202361679-587f227b-3152-414a-ad8e-fc90be5d9f39.PNG"
 width="800" height="400"/>   
 
### 15. 관리자 페이지 (문의)
<img src="https://user-images.githubusercontent.com/109054181/202361712-95345dd4-b6da-410d-8c73-7f453788a305.PNG"
 width="800" height="400"/>   
 
### 16. 관리자 페이지 (신고)
<img src="https://user-images.githubusercontent.com/109054181/202361725-8066a222-6313-4350-9361-70416b3d1ff6.PNG"
 width="800" height="400"/>   
 
### 17. 관리자 페이지 (쇼핑)
<img src="https://user-images.githubusercontent.com/109054181/202361748-d59db1c5-ccf9-4a28-9984-ea6d41a1b3d8.PNG"
 width="800" height="400"/>   

### 18. 관리자 페이지 (상품 등록)
<img src="https://user-images.githubusercontent.com/109054181/202363445-63b9a718-6dca-43d0-aa77-6baa454085d8.PNG"
 width="800" height="400"/>
 
### 19. 관리자 페이지 (회원)
<img src="https://user-images.githubusercontent.com/109054181/202361769-543dc87b-bfe2-4a53-b7ae-8d07b5707b0a.PNG"
 width="800" height="400"/>   
 
### 20. 관리자 페이지 (공지사항)
<img src="https://user-images.githubusercontent.com/109054181/202361786-23890a66-7072-4a62-830e-f7926d4f34e7.PNG"
 width="800" height="400"/>   
 
### 21. 관리자 페이지 (배너)
<img src="https://user-images.githubusercontent.com/109054181/202361800-2ac6754f-59ab-4a19-966d-3dda78e84f0d.PNG"
 width="800" height="400"/> 
