public without sharing class businessController {
    public contact conString{get;set;}
    public Boolean bConCreated{get;set;}
    public businessController(){
        conString = new contact();
        bConCreated = false;
    }
    public PageReference SaveTo(){
        contact con = new contact();
        con.FirstName = conString.FirstName;
        con.LastName = conString.LastName;
        con.Email = conString.Email;
        con.Phone = conString.Phone;
        con.Fax = conString.Fax;
        con.MailingStreet = conString.MailingStreet;
        con.MailingCity = conString.MailingCity;
        con.MailingPostalCode = conString.MailingPostalCode;
        con.MailingState = conString.MailingState;
        con.MailingCountry = conString.MailingCountry;
        insert con;
        bConCreated = true;
        return null;
    
    }
    
	public PageReference HomePage() {
		return Page.MapPage;

	}
	public PageReference copperPage() {
		return Page.ProductsPage;

	}
	public PageReference ironPage() {
		return Page.ProductsPage;

	}
	public PageReference icePage() {
		return Page.ProductsPage;

	}
	public PageReference uraniumPage() {
		return Page.Uranium;
        
	}
	public PageReference thoriumPage() {
		return Page.ProductsPage;

	}
    
    // the Iron, Copper, Ice, and Thorium pages will redirect to the general productpage 
    // instead of thier individual pages, this is becuase they dont exsist but if/when 
    // they are created simple change the return value to the proper page number
    
    
    @AuraEnabled
    public static Map<String, String> getProducts() {
        List<Product2> products = [SELECT Name, Description FROM Product2 WHERE NOT Description = null LIMIT 10];
        Map<String, String> resultMap = new Map<String, String>();
        for (Product2 current : products) {
            resultMap.put(current.Name, current.Description);
        }
        return resultMap;
    }
    
}