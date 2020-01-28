<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
ajax의 서버쪽
* 표현문태그(<%=%>)나 el표현식으로 브라우져에 출력하려면? json형식에 맞춰서 출력하면 괜찮다.
* 기본적으로 html태그는 사용 불가
--%>

<%
	int pagenum = Integer.parseInt(request.getParameter("pagenum"));
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardVO> list = dao.getBoardList(pagenum, 5);

	//list는 json형태가 아니기 때문에 이대로 전해주면 안된다
	//jsonobject : json객체 하나일때 사용
	//jsonArray : json객체가 여러개일때 사용
	//즉, list는 각각을 json객체로 만들어서 넣어줌

	JSONArray array = new JSONArray();
	for (int i = 0; i < list.size(); i++) {
		JSONObject one_json = new JSONObject();
		BoardVO vo = list.get(i);
		one_json.put("seq", vo.getSeq());
		one_json.put("title", vo.getTitle());
		one_json.put("viewcount", vo.getViewcount());
		array.add(one_json);
	}
%>

<%=array.toJSONString() %>











