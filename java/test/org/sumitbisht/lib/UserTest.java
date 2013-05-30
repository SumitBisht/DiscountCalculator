package org.sumitbisht.lib;

import static org.junit.Assert.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class UserTest {

	User simpleUser = null;
	@Before
	public void setUp() throws Exception {
		DateFormat format = new SimpleDateFormat("dd mm yyyy");
		simpleUser = new User("customer", format.parse("12 03 2013"));
	}

	@After
	public void tearDown() throws Exception {
		simpleUser = null;
	}

	@Test
	public void testDiscount() {
		assertEquals(0, simpleUser.discount());
	}

}
