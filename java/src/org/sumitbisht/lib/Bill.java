package org.sumitbisht.lib;

public class Bill 
{
	
	private double groceryCosts =0.0d;
	private double otherCosts = 0.0d;
	User user = null;
	
	public Bill(User user)
	{
		this.user = user;
	}
	
	public void addItem(String item, String category, int quantity, float price)
	{
		if(category.equals("groceries"))
		{
			groceryCosts += quantity * price;
		}
		else
		{
			otherCosts += quantity * price;
		}
	}
	
	public double getGroceryCosts()
	{
		return groceryCosts;
	}
	
	public double getOtherCosts()
	{
		return otherCosts;
	}
	
	public double netPayableAmount()
	{
		return 0.0d;
	}

}
