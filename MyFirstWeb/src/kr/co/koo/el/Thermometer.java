package kr.co.koo.el;

import java.util.*;

public class Thermometer {
	
	private Map<String, Double> degrees = new HashMap<>();
	
	public void setDegrees(String city, double cel) {
		degrees.put(city, cel);
	}
	
	public double getDegrees(String city) {
		//Double celsius = degrees.get(city);
		//return celsius;
		return degrees.get(city);
	}
	
	//섭씨를 화씨로 변환해주는 메서드
	public double changeDegree(String city) {
		double celsius = getDegrees(city);
		//Double farenheit = celsius * 1.8 + 32;
		//return farenheit;
		return celsius * 1.8 + 32;
	}
	
}




