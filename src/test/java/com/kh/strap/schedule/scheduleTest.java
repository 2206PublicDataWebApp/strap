package com.kh.strap.schedule;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;

public class scheduleTest {

	@Test
	public void test() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String currentDate = sdf.format(cal.getTime());
		cal.add(Calendar.DATE, -7);
		String weekAgoDate = sdf.format(cal.getTime());
		System.out.println("일주일 전 : " + weekAgoDate);
		System.out.println("현재 : " + currentDate);
	}

}
