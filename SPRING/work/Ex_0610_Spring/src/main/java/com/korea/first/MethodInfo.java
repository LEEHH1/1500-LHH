package com.korea.first;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.StringJoiner;

public class MethodInfo {
	public static void main(String[] args) throws Exception{
		//1. YoilTellerMVC 클래스의 객체
		//Java.lang,Class 클래스
		// 클래스의 정보를 얻어오기 위한 클래스
		// forName(): 클래스의 파일명을 인자로 넣어주면 해당 클래스를 반환해준다.
		Class clazz = Class.forName("com.korea.first.YoilTellerMVC");
		
		// 새로운 객체를 생성하는 방법
		Object obj = clazz.newInstance();
		
		// 2.모든 메서드 정보를 가져와서 배열에 저장
		Method[] methodArr = clazz.getDeclaredMethods();
		
		for(Method m : methodArr) {
			String name = m.getName();// 메서드의 이름
			Parameter[] paramArr = m.getParameters(); // 매개변수
			Class[] paramTypeArr = m.getParameterTypes();
			Class returnType = m.getReturnType();
			StringJoiner paramList = new StringJoiner(", ","(",")");
			
			for(Parameter param : paramArr) {
				String paramName = param.getName();
				Class paramType = param.getType();
				
				paramList.add(paramType.getName()+" " + paramName);
			}
			System.out.printf("%s %s%s\n",returnType.getName(), name,paramList);
		}
	}
}
