package filtertest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/encoding")//Filter의 url매핑과 값이 같아야함
@WebServlet("/nonencoding")//->Filter작용 x
//Filter url 매핑을 '/*'로하면 위의 매핑과 상관없이 Filter 적용 o 
public class EncodingServlet extends HttpServlet {

	protected void doPost
	(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get방식 같은 경우는 한글처리 따로 안해도 되기 때문에
		//post방식은 한글데이터가 넘어갈때 깨짐 = 한글처리 필요 => request.setCharacterEncoding("utf-8");
		
		//ex) 사용자에게 name변수 받아서 보여주기
		//http://localhost:8081/startservlet/encoding -> get방식
		//즉, post방식하려면? form형식 필요 : encoding.jsp
		String name = request.getParameter("name");
		
		//응답 => 응답 역시 filter에서 처리
		PrintWriter out = response.getWriter();
		out.println("<h1>이름은 "+name+"</h1>");
		//또한, Servlet만들면 server 새로시작해야함
	}

}
