package org.sumitbisht.lib;

public class Bill 
{
	
	private double groceryCosts =0.0d;
	private double otherCosts = 0.0d;
	User user = null;
	
	public void setBillUser(User user)
	{
		this.user = user;
	}
	
	public void addItem( String category, int quantity, double price)
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
	
	public double getCosts()
	{
		return groceryCosts + otherCosts;
	}
	
	public double getOtherCosts()
	{
		return otherCosts;
	}
	
	public double netPayableAmount()
	{
		if(user!=null)
		{
			double discounts = otherCosts * user.discount()/100;
			double totalCost = getCosts() - discounts;
			totalCost = totalCost - (int)(totalCost/100)*5;
			return totalCost;
		}
		return getCosts();
	}

}
