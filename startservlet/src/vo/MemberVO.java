package vo;

//xxxDAO 클래스
//xxxVO 클래스 - Value Object (값만 저장하는 객체)
//: 테이블 Member와 상관있는 값이다? -> 클래스명 : MemberVO
//xxxDO - Data Object : 필요한 값 저장
//xxxDTO - Data Transfer Object -> 객체 전달하기 전에 값 저장
//즉, xxxVO,xxxDO,xxxDTO는 의미가 같음
public class MemberVO {
	//즉, DB입장에서 member테이블 하나의 레코드를 구성하는 값
	//form에서 넘어오는 값
	//따라서, 한 회원의 정보
	//그리고 getter, setter 메서드 정의 : source -> generate getters/setters
String id;
String pw;
String name;
String phone;
String email;
String indate;

public MemberVO(String id, String pw, String name, String phone, String email, String indate) {
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.phone = phone;
	this.email = email;
	this.indate = indate;
}
public MemberVO(String id, String pw, String name, String phone, String email) {
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.phone = phone;
	this.email = email;
}
public MemberVO(){} //생성자 오버로딩
//MemberVO(String id, String pw, String name, String phone, String email) {
//	this.id = id;
//	this.pw = pw;
//	this.name = name;
//	this.phone = phone;
//	this.email = email;
//} 다 써도 되지만 generate constructor using fields 사용

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getIndate() {
	return indate;
}
public void setIndate(String indate) {
	this.indate = indate;
}

}
