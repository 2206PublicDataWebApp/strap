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
		cal.setTime(cal.getTime());
		cal.add(Calendar.DATE, -1);
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String date = sdf.format(cal.getTime());
		System.out.println("1일 전 : " + date);
	}

}
