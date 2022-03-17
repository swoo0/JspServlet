package com.spring.advice;

import org.aspectj.lang.ProceedingJoinPoint;

public class AdviceBehavior {

	public void chikachika() {
		System.out.println("치카치카");
	}
	
	// joinpoint : around
	public void chikachikaAround(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("분노의 양치질!");
		
		joinPoint.proceed();
		
		System.out.println("분노의 양치질! 한번 더!");
		
	}
}
