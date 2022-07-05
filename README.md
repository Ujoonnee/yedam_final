# 통합예약시스템

## 개요
+ 전시 예약 서비스, 상품 픽업 예약 서비스를 구현한 프로젝트 입니다.
+ Java/Spring, JSP/JQuery, Oracle DB/MyBatis를 기반으로 구현했습니다.
 
- - -

## 사용 api 및 기능
+ 공통
  + Gson, jackson : JSON 파싱
  + log4jdbc-remix : 쿼리 로그 출력
  + tiles : 레이아웃
+ 회원가입 
  + Java Mail api : 본인 메일 인증
  + 사업자등록번호진위여부 검증 api
+ 서비스 등록 신청
  + 카카오 주소 검색 api
+ 공지사항 (게시판)
  + 파일 업로드 / 다운로드 기능
+ 매장 상품 등록
  + 엑셀 파일의 데이터 전달
+ 매장 목록
  + 카카오맵 api : 검색한 주소로 좌표를 구해 사용자 정보의 주소와 가까운 거리 순으로 출력
+ 전시 / 상품 예약
  + 아임포트 api : 결제 기능
+ 리뷰 작성
  + smartEditor

- - -

## ERD
##### : DB table 구성입니다.

![최종](https://user-images.githubusercontent.com/69345466/177209214-aa6e8711-e335-4c68-9bf1-9a0bfba1336f.png)

- - -

## 서비스 흐름도
##### : 서비스 주요 기능의 흐름도입니다.
![image](https://user-images.githubusercontent.com/69345466/177209322-1c9c3c00-64c0-482b-a402-3f5ba8188ad0.png)

- - -

## 화면 예시
##### : 간단한 서비스 화면 예시입니다.

### 랜딩페이지
![image](https://user-images.githubusercontent.com/69345466/177210075-2e8bac92-1783-4f10-8766-c7d168d9faa7.png)

### 재고목록 다운로드
![image](https://user-images.githubusercontent.com/69345466/177210015-2554f5a6-f4b5-4134-bb11-948c4966fd0e.png)

- - -

## 코드 스타일 예시
##### : 작성한 코드의 일부를 발췌했습니다.
### 회원 ajax 요청 컨트롤러 (java)
```java
@Controller
@RequestMapping("/member/*")
@ResponseBody
public class AjaxMemberController {

	@Autowired MemberService service;

	// 로그인 전 확인
	@PostMapping("sign-in")
	public String signIn(MemberVO member, HttpServletRequest request) {
		return service.signIn(member, request);
	}
	
	// 이메일 중복체크
	@GetMapping("emailCheck")
	public boolean emailCheck(MemberVO member) {
		return service.isValidEmail(member);
	}
	
	// 회원가입 처리 및 확인메일 발송
	@PostMapping("sign-up")
	@ResponseBody
	public String signUp(@RequestBody Map<String,String> member, Model model) {
		
		if (service.signUp(member).equals("success")) {
			Thread thread = new Thread() {
				@Override
				public void run() {
					service.sendConfirmationMail(member);
				}
			};
			thread.start();
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 회원정보 수정 처리
	@PostMapping("update")
	@ResponseBody
	public String update(@RequestBody MemberVO member, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		member.setMemNo(user.getMemNo());
		
		return service.update(member);
	}
}

```

### 회원 기능 구현체 (java)
```java
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper map;
	@Autowired mailSender emailSender;

	public MemberVO getCurrentUser(HttpServletRequest request) {
    // 현재 로그인한 유저 정보
    HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");

		return user;
	}

	// 회원가입

	@Override
	public boolean isValidEmail(MemberVO vo) {
		return (map.isValidEmail(vo) == 0) ? true : false;
	}

	@Override
	public String signUp(Map<String, String> member) {

		// 최종 회원가입 전 이메일 체크
		MemberVO vo = new MemberVO();
		vo.setEmail(member.get("email"));

		if (!isValidEmail(vo)) return "fail";

		member.put("applicationNo", "");  // 프로시저 out 변수

		if (member.get("buisnessNum").equals("")) {
			// 일반회원코드 : 00102
			member.put("memType", "00102");
		} else {
			// 사업자회원코드 : 00103
			member.put("memType", "00103");
		}

		map.signup(member);

		return "success";
	}
  
}

```

### 본인메일 확인 프로시저 (SQL)
```
CREATE OR REPLACE PROCEDURE CONFIRM_PROC
(
   applicationNo    IN NUMBER,
   isExpired        OUT NUMBER
)
IS
    v_is_expired    NUMBER(1);
    v_mem_no        member.mem_no%TYPE;
BEGIN
    SELECT CASE WHEN SYSDATE - application_time >= 1 THEN 1
                ELSE 0
           END, mem_no
    INTO v_is_expired, v_mem_no
    FROM signup_application
    WHERE application_no = applicationNo;
    
    isExpired := v_is_expired;
    
    -- 만료여부에 따른 처리
    IF v_is_expired = 1 THEN
        -- 기한 만료
        DELETE FROM signup_application
        WHERE application_no = applicationNo;
        
        DELETE FROM member
        WHERE mem_no = v_mem_no;
    ELSE
        -- 정상 처리
        UPDATE member SET status = '00301'
        WHERE mem_no = v_mem_no;
    END IF;

END CONFIRM_PROC;
```

### 카카오 주소 api (javascript)
```javascript
function searchLocation() {
  new daum.Postcode({
    oncomplete : function(data) {			
      const addr = data.address + ' ' + data.buildingName;
      $('#location').val(data.zonecode);
      $('#addr1').val(addr);
	  	getCoordinate(addr);
		}
	}).open();
}
  
function getCoordinate(addr){
  $.ajax({
    url:"https://dapi.kakao.com/v2/local/search/address.json?query="+encodeURIComponent(addr),
    type : "GET",
    headers: {'Authorization' : 'KakaoAK abcd1234abcd1234abcd1234abcd1234'},
  success: function(data){
      $('#latitude').val(data.documents[0].y);
      $('#longitude').val(data.documents[0].x);
    },
  error : function(e){
      console.log(e);
    }
  });

};
  
```

