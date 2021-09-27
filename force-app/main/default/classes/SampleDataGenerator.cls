public with sharing class SampleDataGenerator {
    public SampleDataGenerator() {

    }

    public static void generateData() {
        List<Product2> products = new List<Product2>();
        products.add(new Product2(Name = 'Gold', ProductCode = 'LBMA/GOLD', Precious_Metal__c = true, Description = 
        'In a pure form, it is a bright, slightly reddish yellow, dense, soft, malleable, and ductile metal. Chemically, gold is a transition metal and a group 11 element. ... A relatively rare element, gold is a precious metal that has been used for coinage, jewelry, and other arts throughout recorded history.'
        ));
        products.add(new Product2(Name = 'Silver', ProductCode = 'LBMA/SILVER', Precious_Metal__c = true, Description = 
        'What Is Silver? The term silver refers to a precious metal commonly used in the production of jewelry, coins, electronics, and photography. It has the highest electrical conductivity of any metal and is, therefore, a highly valuable substance.'
        ));
        products.add(new Product2(Name = 'Platinum', ProductCode = 'JOHNMATT/PLAT', Precious_Metal__c = true, Description = 
        'A shiny, silvery-white metal as resistant to corrosion as gold. Platinum is used extensively for jewellery. Its main use, however, is in catalytic converters for cars, trucks and buses. This accounts for about 50% of demand each year.'
        ));
        products.add(new Product2(Name = 'Palladium', ProductCode = 'JOHNMATT/PALL', Precious_Metal__c = true, Description = 
        'Palladium is a shiny metal used in many electronic and industrial products. Along with platinum, rhodium, ruthenium, iridium, and osmium, the metal is part of a group known as platinum group metals. ... Palladium can be rolled into sheets, which are then used in applications like fuel cells and solar energy.'
        ));
        products.add(new Product2(Name = 'Aluminum', ProductCode = 'ODA/PALUM_USD', Precious_Metal__c = false, Description = 
        'Aluminium is a silvery-white, lightweight metal. It is soft and malleable. Uses. Aluminium is used in a huge variety of products including cans, foils, kitchen utensils, window frames, beer kegs and aeroplane parts.'
        ));
        products.add(new Product2(Name = 'Copper', ProductCode = 'ODA/PCOPP_USD', Precious_Metal__c = false, Description = 
        'Copper is a chemical element with the symbol Cu (from Latin: cuprum) and atomic number 29. It is a soft, malleable, and ductile metal with very high thermal and electrical conductivity. A freshly exposed surface of pure copper has a pinkish-orange color.'
        ));
        products.add(new Product2(Name = 'Iron', ProductCode = 'ODA/PIORECR_USD', Precious_Metal__c = false, Description = 
        'Iron is a lustrous, ductile, malleable, silver-gray metal (group VIII of the periodic table). It is known to exist in four distinct crystalline forms. Iron rusts in damp air, but not in dry air. ... Iron is the most used of all the metals, including 95 % of all the metal tonnage produced worldwide.'
        ));
        products.add(new Product2(Name = 'Nickel', ProductCode = 'ODA/PNICK_USD', Precious_Metal__c = false, Description = 
        'Nickel is a chemical element with the symbol Ni and atomic number 28. It is a silvery-white lustrous metal with a slight golden tinge. Nickel belongs to the transition metals and is hard and ductile. ... An iron–nickel mixture is thought to compose Earth\'s outer and inner cores.'
        ));
        products.add(new Product2(Name = 'Tin', ProductCode = 'ODA/PTIN_USD', Precious_Metal__c = false, Description = 
        'tin (Sn), a chemical element belonging to the carbon family, Group 14 (IVa) of the periodic table. It is a soft, silvery white metal with a bluish tinge, known to the ancients in bronze, an alloy with copper. Tin is widely used for plating steel cans used as food containers, in metals used for bearings, and in solder.'
        ));
        products.add(new Product2(Name = 'Zinc', ProductCode = 'ODA/PZINC_USD', Precious_Metal__c = false, Description = 
        'Zinc is a lustrous bluish-white metal. It is found in group IIb of the periodic table. It is brittle and crystalline at ordinary temperatures, but it becomes ductile and malleable when heated between 110°C and 150°C. ... Zinc is a very common substance that occurs naturally.'
        ));

        Insert products;

        products = [SELECT id FROM Product2];
        System.debug(products[0].id);

        List<MiningSite__c> sites = new List<MiningSite__c>();
        sites.add(new MiningSite__c(Name = 'name1', EstimatedWorth__c = 10000, Location__latitude__s = 30.0, Location__longitude__s = 100, Ore__c = products[0].id));
        sites.add(new MiningSite__c(Name = 'name2', EstimatedWorth__c = 20000, Location__latitude__s = 30.0, Location__longitude__s = 100, Ore__c = products[1].id));
        sites.add(new MiningSite__c(Name = 'name3', EstimatedWorth__c = 30000, Location__latitude__s = 30.0, Location__longitude__s = 100, Ore__c = products[2].id));
        Insert sites;
    }

    public static void deleteDefaultData() {
        Delete [SELECT id FROM Product2];
        Delete [SELECT id FROM MiningSite__c];
    }
}
