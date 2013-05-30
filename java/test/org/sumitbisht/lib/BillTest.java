package org.sumitbisht.lib;
import static org.junit.Assert.*;

import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.sumitbisht.lib.Bill;


public class BillTest {

	Bill emptyBill = null;
	Bill groceryBill = null;
	Bill nonGroceryBill = null;
	Bill complexBill = null;
	private Date currentDate = new Date(System.currentTimeMillis());
	private Date oldDate = new Date((System.currentTimeMillis()-(1000L*60*60*24*365*3)));
	
	@Before
	public void setUp() throws Exception {
		emptyBill = new Bill();
		
		groceryBill = new Bill();
		groceryBill.addItem("floor", "groceries", 5, 10);
		groceryBill.addItem("pulses", "groceries", 4, 40);
		groceryBill.addItem("rice", "groceries", 5, 15);
		groceryBill.addItem("jaggery", "groceries", 2, 22);
		
		nonGroceryBill = new Bill();
		nonGroceryBill.addItem("Duct Tape", "utility", 2, 10);
		nonGroceryBill.addItem("Adhesive", "utility", 1, 20);
		nonGroceryBill.addItem("Nail", "utility", 50, 0.4);
		nonGroceryBill.addItem("Drill bit", "utility", 3, 41);
		nonGroceryBill.addItem("Plier", "utility", 1, 7);
		nonGroceryBill.addItem("Wallpaper", "decoration", 4, 100);
		
		complexBill = new Bill();
		complexBill.addItem("Tshirt", "clothes", 2, 41.5);
		complexBill.addItem("Headphone", "accessories", 1, 65);
		complexBill.addItem("Noodles", "groceries", 2, 41.5);
		complexBill.addItem("Drapes", "decoration", 6, 12);
		complexBill.addItem("Shorts", "clothes", 2, 35.5);
		complexBill.addItem("Socks", "clothes", 2, 15);
		complexBill.addItem("Cleaner", "groceries", 1, 25);
		complexBill.addItem("Chair", "furniture", 8, 50);
		complexBill.addItem("Table", "furniture", 1, 180);
	}

	@After
	public void tearDown() throws Exception {
		emptyBill = null;
		groceryBill = null;
		nonGroceryBill = null;
		complexBill = null;
	}

	@Test
	public void testAddItem() {
		emptyBill.addItem("sampleItem", "cosmetics", 5, 10);
		assertEquals(50, emptyBill.getCosts(), 0.0d);
		assertEquals(50, emptyBill.getOtherCosts(), 0.0d);
		
		double earlierPrice = groceryBill.getCosts();
		double otherPrice = groceryBill.getOtherCosts();
		groceryBill.addItem("apples", "groceries", 1, 20);
		assertEquals(earlierPrice+20.0d, groceryBill.getCosts(), 0.0d);
		assertEquals(otherPrice, groceryBill.getOtherCosts(), 0.0d);
		
		earlierPrice = nonGroceryBill.getCosts();
		otherPrice = nonGroceryBill.getOtherCosts();
		nonGroceryBill.addItem("Pillow", "home", 4, 15);
		assertEquals(earlierPrice+60, nonGroceryBill.getCosts(), 0.0d);
		assertEquals(otherPrice+60, nonGroceryBill.getCosts(), 0.0d);

		earlierPrice = complexBill.getCosts();
		otherPrice = complexBill.getOtherCosts();
		complexBill.addItem("Carpet", "home", 1, 450);
		complexBill.addItem("Dry Fruits", "groceries", 4, 50);
		assertEquals(earlierPrice+650, complexBill.getCosts(), 0.0d);
		assertEquals(otherPrice+450, complexBill.getOtherCosts(), 0.0d);
		
	}

	@Test
	public void testGetGroceryCosts() {
		assertEquals(0.0d, emptyBill.getCosts()-emptyBill.getOtherCosts(), 0.0d);
		assertEquals(329.0d, groceryBill.getCosts()-groceryBill.getOtherCosts(), 0.0d);
		assertEquals(0.0d, nonGroceryBill.getCosts()-nonGroceryBill.getOtherCosts(), 0.0d);
		assertEquals(108.0d, complexBill.getCosts()-complexBill.getOtherCosts(), 0.0d);
	}

	@Test
	public void testGetOtherCosts() {
		assertEquals(0.0d, emptyBill.getOtherCosts(), 0.0d);
		assertEquals(0.0d, groceryBill.getOtherCosts(), 0.0d);
		assertEquals(590.0d, nonGroceryBill.getOtherCosts(), 0.0d);
		assertEquals(901.0d, complexBill.getOtherCosts(), 0.0d);
	}

	@Test
	public void testNetPayableAmountWithoutUsers() {
		assertEquals(0.0d, emptyBill.netPayableAmount(), 0.0d);
		assertEquals(329.0d, groceryBill.netPayableAmount(), 0.0d);
		assertEquals(590.0d, nonGroceryBill.netPayableAmount(), 0.0d);
		assertEquals(1009.0d, complexBill.netPayableAmount(), 0.0d);
	}
	
	@Test
	public void testDiscountsForEmployees(){
		emptyBill.setBillUser(new User("employee", currentDate ));
		groceryBill.setBillUser(new User("employee", currentDate ));
		nonGroceryBill.setBillUser(new User("employee", currentDate ));
		complexBill.setBillUser(new User("employee", currentDate ));
		assertEquals(0.0d, emptyBill.netPayableAmount(), 0.0d);
		assertEquals(314.0d, groceryBill.netPayableAmount(), 0.0d);
		assertEquals(393.0d, nonGroceryBill.netPayableAmount(), 0.0d);
		assertEquals(703.7d, complexBill.netPayableAmount(), 0.0d);
	}

	@Test
	public void testDiscountsForNormalConsumers(){
		emptyBill.setBillUser(new User("customer", currentDate ));
		groceryBill.setBillUser(new User("customer", currentDate ));
		nonGroceryBill.setBillUser(new User("customer", currentDate ));
		complexBill.setBillUser(new User("customer", currentDate ));
		assertEquals(0.0d, emptyBill.netPayableAmount(), 0.0d);
		assertEquals(314.0d, groceryBill.netPayableAmount(), 0.0d);
		assertEquals(565.0d, nonGroceryBill.netPayableAmount(), 0.0d);
		assertEquals(959.0d, complexBill.netPayableAmount(), 0.0d);
	}
	@Test
	public void testDiscountsForOldConsumers(){
		emptyBill.setBillUser(new User("customer", oldDate ));
		groceryBill.setBillUser(new User("customer", oldDate ));
		nonGroceryBill.setBillUser(new User("customer", oldDate ));
		complexBill.setBillUser(new User("customer", oldDate ));
		assertEquals(0.0d, emptyBill.netPayableAmount(), 0.0d);
		assertEquals(314.0d, groceryBill.netPayableAmount(), 0.0d);
		assertEquals(535.5d, nonGroceryBill.netPayableAmount(), 0.0d);
		assertEquals(918.95d, complexBill.netPayableAmount(), 0.0d);
	}
	
	@Test
	public void testDiscountsForAffiliates(){
		emptyBill.setBillUser(new User("affiliate", currentDate ));
		groceryBill.setBillUser(new User("affiliate", currentDate ));
		nonGroceryBill.setBillUser(new User("affiliate", currentDate ));
		complexBill.setBillUser(new User("affiliate", currentDate ));
		assertEquals(0.0d, emptyBill.netPayableAmount(), 0.0d);
		assertEquals(314.0d, groceryBill.netPayableAmount(), 0.0d);
		assertEquals(506.0d, nonGroceryBill.netPayableAmount(), 0.0d);
		assertEquals(873.9d, complexBill.netPayableAmount(), 0.0d);
	}
}
