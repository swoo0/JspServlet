package com.spring.pointcut;

public class BehaviorImpl implements Behavior {

	@Override
	public void 잠자기() {
		System.out.println("굿밤");
	}

	@Override
	public void 공부하기() {
		System.out.println("공부 시러");
	}

	@Override
	public void 밥먹기() {
		System.out.println("밥 맛있어");
	}

	@Override
	public void 데이트() {
		System.out.println("어딘가 있겠지 내 여친");
	}

	@Override
	public void 운동() {
		System.out.println("근손실은 못 참지");
	}

	@Override
	public void 놀기() {
		System.out.println("노는게 조아 노는게 조아 뽀로로야");
	}

	@Override
	public void 정신수양() {
		System.out.println("나는 최고의 프로그래머다");
	}

	
}
