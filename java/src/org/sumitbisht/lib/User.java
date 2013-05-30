package org.sumitbisht.lib;

import java.util.Date;

public class User {

	private String type="";
	private Date joinDate = null;

	public User(String type, Date joinDate)
	{
		this.type = type;
		this.joinDate = joinDate;
	}
	public int discount()
	{
		return 0;
	}
}
