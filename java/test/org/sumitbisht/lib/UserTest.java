package org.sumitbisht.lib;

import static org.junit.Assert.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class UserTest {

	User simpleUser = null;
	User oldUser = null;
	User employee = null;
	User affiliate = null;
	@Before
	public void setUp() throws Exception {
		DateFormat format = new SimpleDateFormat("dd mm yyyy");
		simpleUser = new User(Type.CUSTOMER, format.parse("12 03 2013"));
		oldUser = new User(Type.CUSTOMER, format.parse("22 06 2010"));
		employee = new User(Type.EMPLOYEE, format.parse("6 11 2012"));
		affiliate = new User(Type.AFFILIATE, format.parse("08 09 2011"));
	}

	@After
	public void tearDown() throws Exception {
		simpleUser = null;
		oldUser = null;
		employee = null;
		affiliate = null;
	}

	@Test
	public void testDiscount() {
		assertNotNull(simpleUser);
		assertNotNull(oldUser);
		assertNotNull(employee);
		assertNotNull(affiliate);
		assertEquals(0, simpleUser.discount());
		assertEquals(5, oldUser.discount());
		assertEquals(30, employee.discount());
		assertEquals(10, affiliate.discount());
	}

}
