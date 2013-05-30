package org.sumitbisht.lib;
import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.sumitbisht.lib.Bill;


public class BillTest {

	Bill emptyBill = null;
	
	@Before
	public void setUp() throws Exception {
		emptyBill = new Bill(null);
	}

	@After
	public void tearDown() throws Exception {
		emptyBill = null;
	}

	//@Test
	public void testAddItem() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetGroceryCosts() {
		assertEquals(0.0d, emptyBill.getGroceryCosts(), 0.0d);
	}

	@Test
	public void testGetOtherCosts() {
		assertEquals(0.0d, emptyBill.getOtherCosts(), 0.0d);
	}

	@Test
	public void testNetPayableAmount() {
		assertEquals(0.0d, emptyBill.netPayableAmount(), 0.0d);
	}

}
