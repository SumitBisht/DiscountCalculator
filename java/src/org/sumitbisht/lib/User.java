package org.sumitbisht.lib;

import java.util.Calendar;
import java.util.Date;

public class User {

	private String type="";
	private Date joinDate = null;

	public User(String type, Date joinDate)
	{
		this.type = type;
		this.joinDate = joinDate;
	}
	private Date twoYearsBeforePresentDate()
	{
		Date twoYrsBefore = null;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date(System.currentTimeMillis()));
		calendar.add(Calendar.YEAR, -2);
		twoYrsBefore = calendar.getTime();
		return twoYrsBefore;
	}
	public int discount()
	{
		if(type.equals("employee"))
			return 30;
		if(type.equals("affiliate"))
			return 10;
		if(type.equals("customer") && joinDate.before(twoYearsBeforePresentDate()))
			return 5;
		return 0;
	}
}
