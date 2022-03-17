package com.spring.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.pointcut.Behavior;

public class Main {
	public static void main(String[] args) {
		
//		Behavior behvior = new BehaviorImpl();
		
		ApplicationContext ctx = new GenericXmlApplicationContext("classpath:com/spring/context/application-context.xml");

		Behavior behvior = ctx.getBean("behavior", Behavior.class);
		
		behvior.밥먹기();
		behvior.정신수양();
		behvior.밥먹기();
		behvior.공부하기();
		behvior.놀기();
		behvior.데이트();
		behvior.운동();
		behvior.밥먹기();
		behvior.잠자기();
		
	}
}