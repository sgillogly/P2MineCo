@isTest
public class businessControllerTest {
    @TestSetup
    static void makeData(){
        
        List<Product2> products = new List<Product2>();
        products.add(new Product2(Name = 'Gold', ProductCode = 'LBMA/GOLD', Precious_Metal__c = true, Description = 'a'));
        products.add(new Product2(Name = 'Silver', ProductCode = 'LBMA/SILVER', Precious_Metal__c = true, Description = 'a'));
        products.add(new Product2(Name = 'Platinum', ProductCode = 'JOHNMATT/PLAT', Precious_Metal__c = true, Description = 'a'));
        products.add(new Product2(Name = 'Palladium', ProductCode = 'JOHNMATT/PALL', Precious_Metal__c = true, Description = 'a'));
        products.add(new Product2(Name = 'Aluminum', ProductCode = 'ODA/PALUM_USD', Precious_Metal__c = false, Description = 'a'));
        products.add(new Product2(Name = 'Copper', ProductCode = 'ODA/PCOPP_USD', Precious_Metal__c = false, Description = 'a'));
        products.add(new Product2(Name = 'Iron', ProductCode = 'ODA/PIORECR_USD', Precious_Metal__c = false, Description = 'a'));
        products.add(new Product2(Name = 'Nickel', ProductCode = 'ODA/PNICK_USD', Precious_Metal__c = false, Description = 'a'));
        products.add(new Product2(Name = 'Tin', ProductCode = 'ODA/PTIN_USD', Precious_Metal__c = false, Description = 'a'));
        products.add(new Product2(Name = 'Zinc', ProductCode = 'ODA/PZINC_USD', Precious_Metal__c = false, Description = 'a'));

        Insert products;
    }

    @isTest
    public static void TP_SaveTo(){
        test.startTest();
		businessController testC = new businessController();
        PageReference pageRef = Page.Business;
       	test.setCurrentPage(pageRef);
        testC.conString.FirstName = 'Kyle';
        testC.conString.LastName = 'Test';
        testC.conString.Email = 'KTest97@email.com';
        testC.conString.Phone = '123-456-7890';
        testC.conString.Fax = 'N/A';
        testC.conString.MailingStreet = 'N/A';
        testC.conString.MailingCity = 'N/A';
        testC.conString.MailingPostalCode = '77777';
        testC.conString.MailingState = 'N/A';
        testC.conString.MailingCountry = 'N/A';
        testC.SaveTo();
        system.assert(testC.bConCreated != null );

        test.stopTest();
    }
    
    @isTest
    public static void TP_HomePage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod1Controller = new businessController();    
        Test.setCurrentPageReference(prod1Controller.HomePage());
        System.assertEquals(Page.MapPage.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }
    @isTest
    public static void TP_copperPage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod2Controller = new businessController();    
        Test.setCurrentPageReference(prod2Controller.copperPage());
        System.assertEquals(Page.ProductsPage.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }
    @isTest
    public static void TP_ironPage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod3Controller = new businessController();    
        Test.setCurrentPageReference(prod3Controller.ironPage());
        System.assertEquals(Page.ProductsPage.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }
    @isTest
    public static void TP_icePage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod4Controller = new businessController();    
        Test.setCurrentPageReference(prod4Controller.icePage());
        System.assertEquals(Page.ProductsPage.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }
    @isTest
    public static void TP_uraniumPage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod5Controller = new businessController();    
        Test.setCurrentPageReference(prod5Controller.uraniumPage());
        System.assertEquals(Page.Uranium.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }
    @isTest
    public static void TP_thoriumPage() {
        test.startTest();
        Test.setCurrentPage(Page.Business);
        businessController prod6Controller = new businessController();    
        Test.setCurrentPageReference(prod6Controller.thoriumPage());
        System.assertEquals(Page.ProductsPage.getUrl(), ApexPages.currentPage().getUrl());
        test.stopTest();
    }    
    
    @isTest
    public static void getProductsSP() {
        Test.startTest();

        Map<String, String> expected = new Map<String, String>();
        expected.put('Gold', 'a');
        expected.put('Silver', 'a');
        expected.put('Platinum', 'a');
        expected.put('Palladium', 'a');
        expected.put('Aluminum', 'a');
        expected.put('Copper', 'a');
        expected.put('Iron', 'a');
        expected.put('Nickel', 'a');
        expected.put('Tin', 'a');
        expected.put('Zinc', 'a');

        System.assertEquals(expected, businessController.getProducts());

        Test.stopTest();
    }

    
}