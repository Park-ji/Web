package vo;

public class ProductVO {
private int code;
private String name;
private int price;
private String detail;
public int getCode() {
	return code;
}
public void setCode(int code) {
	this.code = code;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getDetail() {
	return detail;
}
public void setDetail(String detail) {
	this.detail = detail;
}
@Override //toString 오버라이드하면 편함
public String toString() {
	return "ProductVO [code=" + code + ", name=" + name + ", price=" + price + ", detail=" + detail + "]";
}
}
