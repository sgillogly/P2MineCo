@isTest
public with sharing class TestCommodityApiHandlerBulkMetals {
    @TestSetup
    static void makeData(){
        for (Integer i = 0; i < 100; i++) {
            SampleDataGenerator.generateData();
        }
    }

    @isTest
    public static void realDataBulkMetalsPositive() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockCommodityApi(false));
        
        Map<String, Map<String, double>> expected = new Map<String, Map<String, double>>();
        for (String metal : new List<String>{'Gold', 'Silver', 'Platinum', 'Palladium', 'Aluminum', 'Copper', 'Iron', 'Nickel', 'Tin', 'Zinc'}) {
            Map<String, double> metalMap = new Map<String, double>();
            for (Integer i = 0; i < 300; i++){
                String key = 'key' + i;
                double priceInTons = ((metal == 'Gold') || (metal == 'Silver') || (metal == 'Platinum') || (metal == 'Palladium') ? i * 32000 : i);
                metalMap.put(key, priceInTons);
            }
            expected.put(metal, metalMap);
        }
        
        System.assertEquals(expected, CommodityApiHandler.realData(300));

        Test.stopTest();
    }

    @isTest
    public static void realDataBulkMetalsNegative() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockCommodityApi(true));
        
        Map<String, Map<String, double>> expected = new Map<String, Map<String, double>>();
        for (String metal : new List<String>{'Gold', 'Silver', 'Platinum', 'Palladium', 'Aluminum', 'Copper', 'Iron', 'Nickel', 'Tin', 'Zinc'}) {
            Map<String, double> metalMap = new Map<String, double>();
            for (Integer i = 0; i < 0; i++){//empty
                String key = 'key' + i;
                double priceInTons = ((metal == 'Gold') || (metal == 'Silver') || (metal == 'Platinum') || (metal == 'Palladium') ? i * 32000 : i);
                metalMap.put(key, priceInTons);
            }
            expected.put(metal, metalMap);
        }
        
        System.assertEquals(expected, CommodityApiHandler.realData(300));

        Test.stopTest();
    }
}
