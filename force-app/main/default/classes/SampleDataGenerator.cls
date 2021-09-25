public with sharing class SampleDataGenerator {
    public SampleDataGenerator() {

    }

    public static void generateData() {
        List<Product2> products = new List<Product2>();
        products.add(new Product2(Name = 'Gold', ProductCode = 'LBMA/GOLD', Precious_Metal__c = true, Description = 
        'a'
        ));
        products.add(new Product2(Name = 'Silver', ProductCode = 'LBMA/SILVER', Precious_Metal__c = true, Description = 
        'a'
        ));
        products.add(new Product2(Name = 'Platinum', ProductCode = 'JOHNMATT/PLAT', Precious_Metal__c = true, Description = 
        'a'
        ));
        products.add(new Product2(Name = 'Palladium', ProductCode = 'JOHNMATT/PALL', Precious_Metal__c = true, Description = 
        'a'
        ));
        products.add(new Product2(Name = 'Aluminum', ProductCode = 'ODA/PALUM_USD', Precious_Metal__c = false, Description = 
        'a'
        ));
        products.add(new Product2(Name = 'Copper', ProductCode = 'ODA/PCOPP_USD', Precious_Metal__c = false, Description = 
        'a'
        ));
        products.add(new Product2(Name = 'Iron', ProductCode = 'ODA/PIORECR_USD', Precious_Metal__c = false, Description = 
        'a'
        ));
        products.add(new Product2(Name = 'Nickel', ProductCode = 'ODA/PNICK_USD', Precious_Metal__c = false, Description = 
        'a'
        ));
        products.add(new Product2(Name = 'Tin', ProductCode = 'ODA/PTIN_USD', Precious_Metal__c = false, Description = 
        'a'
        ));
        products.add(new Product2(Name = 'Zinc', ProductCode = 'ODA/PZINC_USD', Precious_Metal__c = false, Description = 
        'a'
        ));

        Insert products;

    }

    public static void deleteDefaultData() {
        Delete [SELECT id FROM Product2];
    }
}
