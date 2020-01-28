package vo;

public class BoardVO {
	
int seq; // DB - IDX
String title; //HEAD
String contents; //CTX
String writer; //MEM
//to_char(sysdate,'') : format을 바꿔가며 시간형태 바꿀수 있게 - String타입으로 선언
String time; //TIME
int password; //B_PWD
int viewcount; //HIT

//필요에 따라 생성자, to_String 선언

public BoardVO(int seq, String title, String contents, String writer, String time, int password, int viewcount) {
	super();
	this.seq = seq;
	this.title = title;
	this.contents = contents;
	this.writer = writer;
	this.time = time;
	this.password = password;
	this.viewcount = viewcount;
}
public BoardVO() {}

public BoardVO(String title, String contents, String writer,int password) {
	this.title = title;
	this.contents = contents;
	this.writer = writer;
	this.password = password;
}

public int getSeq() {
	return seq;
}

public void setSeq(int seq) {
	this.seq = seq;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public int getPassword() {
	return password;
}
public void setPassword(int password) {
	this.password = password;
}
public int getViewcount() {
	return viewcount;
}
public void setViewcount(int viewcount) {
	this.viewcount = viewcount;
}


}
