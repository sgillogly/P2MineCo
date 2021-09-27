@isTest
public with sharing class TestCommodityApiHandler {
    
    @TestSetup
    static void makeData(){
        SampleDataGenerator.generateData();
    }

    @isTest
    public static void realDataSP() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockCommodityApi(false));
        
        Map<String, Map<String, double>> expected = new Map<String, Map<String, double>>();
        for (String metal : new List<String>{'Gold', 'Silver', 'Platinum', 'Palladium', 'Aluminum', 'Copper', 'Iron', 'Nickel', 'Tin', 'Zinc'}) {
            Map<String, double> metalMap = new Map<String, double>();
            for (Integer i = 0; i < 1; i++){
                String key = 'key' + i;
                metalMap.put(key, i);
            }
            expected.put(metal, metalMap);
        }
        
        System.assertEquals(expected, CommodityApiHandler.realData(1));

        Test.stopTest();
    }

    @isTest
    public static void realDataSN() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockCommodityApi(true));
        
        Map<String, Map<String, double>> expected = new Map<String, Map<String, double>>();
        for (String metal : new List<String>{'Gold', 'Silver', 'Platinum', 'Palladium', 'Aluminum', 'Copper', 'Iron', 'Nickel', 'Tin', 'Zinc'}) {
            Map<String, double> metalMap = new Map<String, double>();
            for (Integer i = 0; i < 0; i++){//empty
                String key = 'key' + i;
                metalMap.put(key, i);
            }
            expected.put(metal, metalMap);
        }
        
        System.assertEquals(expected, CommodityApiHandler.realData(1));

        Test.stopTest();
    }

    @isTest
    public static void realDataBulkDatesPositive() {
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
    public static void realDataBulkDatesUnderflow() {
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
        
        System.assertEquals(expected, CommodityApiHandler.realData(500));

        Test.stopTest();
    }

    @isTest
    public static void realDataBulkDatesNegative() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockCommodityApi(true));
        
        Map<String, Map<String, double>> expected = new Map<String, Map<String, double>>();
        for (String metal : new List<String>{'Gold', 'Silver', 'Platinum', 'Palladium', 'Aluminum', 'Copper', 'Iron', 'Nickel', 'Tin', 'Zinc'}) {
            Map<String, double> metalMap = new Map<String, double>();
            for (Integer i = 0; i < 0; i++){//empty
                String key = 'key' + i;
                metalMap.put(key, i);
            }
            expected.put(metal, metalMap);
        }
        
        System.assertEquals(expected, CommodityApiHandler.realData(300));

        Test.stopTest();
    }

    




    @isTest
    public static void callApiSP() {   
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockCommodityApi(false));

        Map<String, double> expected = new Map<String, double>();
        for (Integer i = 0; i < 1; i++){
            String key = 'key' + i;
            expected.put(key, i);
        }
        System.assertEquals(expected, CommodityApiHandler.callApi('testMetal', 1));

        Test.stopTest();
    }

    @isTest
    public static void callApiSN() {   
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockCommodityApi(true));

        Map<String, double> expected = new Map<String, double>();
        for (Integer i = 0; i < 0; i++){//empty
            String key = 'key' + i;
            expected.put(key, i);
        }
        System.assertEquals(expected, CommodityApiHandler.callApi('testMetal', 1));

        Test.stopTest();
    }

    @isTest
    public static void callApiBP() {   
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockCommodityApi(false));

        Map<String, double> expected = new Map<String, double>();
        for (Integer i = 0; i < 300; i++){
            String key = 'key' + i;
            expected.put(key, i);
        }
        System.assertEquals(expected, CommodityApiHandler.callApi('testMetal', 300));

        Test.stopTest();
    }








    @isTest
    public static void parseResultSP() {   
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockCommodityApi(false));

        HTTP h = new HTTP();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('');
        request.setMethod('GET');
        HttpResponse response = h.send(request);
        
        Map<String, double> expected = new Map<String, double>();
        for (Integer i = 0; i < 1; i++){
            String key = 'key' + i;
            expected.put(key, i);
        }
        System.assertEquals(expected, CommodityApiHandler.parseResult(response, 1));

        Test.stopTest();
    }
    
    @isTest
    public static void parseResultSN() {   
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockCommodityApi(false));

        HTTP h = new HTTP();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('');
        request.setMethod('GET');
        //no callout
        //HttpResponse response = h.send(request);
        HttpResponse response = new HttpResponse();

        Map<String, double> expected = new Map<String, double>();
        for (Integer i = 0; i < 0; i++){//empty set
            String key = 'key' + i;
            expected.put(key, i);
        }
        System.assertEquals(expected, CommodityApiHandler.parseResult(response, 1));

        Test.stopTest();
    }

    @isTest
    public static void parseResultBP() {   
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockCommodityApi(false));

        HTTP h = new HTTP();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('');
        request.setMethod('GET');
        HttpResponse response = h.send(request);

        Map<String, double> expected = new Map<String, double>();
        for (Integer i = 0; i < 300; i++){
            String key = 'key' + i;
            expected.put(key, i);
        }
        System.assertEquals(expected, CommodityApiHandler.parseResult(response, 300));

        Test.stopTest();
    }
}
