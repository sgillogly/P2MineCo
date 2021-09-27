@isTest
public class MiningSiteTest {
    
    @testSetup
    public static void setupTests(){
        List<MiningSite__c> testSites = new List<MiningSite__c>();
        for(Integer num = 0; num < 10; num++) {
            testSites.add(new MiningSite__c(name = 'Test Site ' + num, Carbon_Footprint__c = num));
        }
        Insert testSites;
    }
    
    @isTest
    public static void TP_searchSite(){
        Test.startTest();
        MiningSiteServerController.getMiningSite('Test Site 1');
        Test.stopTest();
    }
    
    @isTest
    public static void TP_showPillars(){
        Test.startTest();
        PillarPieChartApex.getChartData();
        Test.stopTest();
    }
    
    @isTest
    public static void TP_carbonChart(){
        Test.startTest();
        CarbonFootprintChartApex.getMineData();
        CarbonFootprintChartApex.CarbonFootprintWrapper wrapper = new CarbonFootprintChartApex.CarbonFootprintWrapper();
    	wrapper.Name = 'Test Site 1';
        wrapper.Carbon_Footprint = 1;
        Test.stopTest();
    }
}