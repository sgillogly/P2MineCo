@isTest
public class AuraHomeControllerTest {
	@testSetup
    public static void SetupTests() {
        Product2 testProduct = new Product2();
        testProduct.Name = 'Gold';
        Insert testProduct;
        testProduct = [SELECT id FROM Product2 WHERE Name = 'Gold'];
        List<MiningSite__c> testTop3 = new List<MiningSite__c>();
        for(Integer i = 0; i < 3; i++){
            MiningSite__c testSite = new MiningSite__c(name = 'Test Site', ore__r = testProduct, location__latitude__s = 53.9006, location__longitude__s = 27.559);
        	testTop3.add(testSite);
        }
        Insert testTop3;
    }
    
    @isTest
    public static void TP_imageUrlBase(){
        Test.startTest();
        Integer index = 0;
        String testURL = AuraHomeController.imageUrlBase(index);
        System.assertEquals('https://image.maps.ls.hereapi.com/mia/1.6/mapview?c=53.9006%2C27.559&z=11&apiKey=NeXaL6Ng_elBhreu8qmyiHjR6SfHo1haBFZev6507Rc', testURL);
        Test.stopTest();
    }
    
    @isTest
    public static void TN_imageUrlBase(){
        Test.startTest();
        Integer index = 6;
        String testURL = AuraHomeController.imageUrlBase(index);
        System.assertEquals('https://image.maps.ls.hereapi.com/mia/1.6/mapview?c=53.9006%2C27.559&z=11&apiKey=NeXaL6Ng_elBhreu8qmyiHjR6SfHo1haBFZev6507Rc', testURL);
        index = -1;
        testURL = AuraHomeController.imageUrlBase(index);
        System.assertEquals('https://image.maps.ls.hereapi.com/mia/1.6/mapview?c=53.9006%2C27.559&z=11&apiKey=NeXaL6Ng_elBhreu8qmyiHjR6SfHo1haBFZev6507Rc', testURL);
        Test.stopTest();
    }
    
    @isTest
    public static void TP_SiteName(){
        Test.startTest();
        Integer index = 0;
        String testName = AuraHomeController.SiteName(index);
        System.assertEquals('Test Site', testName);
        Test.stopTest();
    }
    
    @isTest
    public static void TN_SiteName(){
        Test.startTest();
        Integer index = 6;
        String testName = AuraHomeController.SiteName(index);
        System.assertEquals('Test Site', testName);
        index = -1;
        testName = AuraHomeController.SiteName(index);
        System.assertEquals('Test Site', testName);
        Test.stopTest();
    }
    
    @isTest
    public static void TP_SiteOre(){
        Test.startTest();
        Integer index = 0;
        String testOre = AuraHomeController.SiteOre(index);
        System.assertEquals('Gold', testOre);
        Test.stopTest();
    }
    
    @isTest
    public static void TN_SiteOre(){
        Test.startTest();
        Integer index = 6;
        String testOre = AuraHomeController.SiteOre(index);
        System.assertEquals('Gold', testOre);
        Test.stopTest();
    }
}