public without sharing class CarbonFootprintChartApex {
    
    @AuraEnabled
    public static list<CarbonFootprintWrapper> getMineData() {
        list<CarbonFootprintWrapper> carbonfootprints = new List<CarbonFootprintWrapper>();

        list<MiningSite__c> MineData = [SELECT Name, Carbon_Footprint__c FROM MiningSite__c WHERE Active__c = true];
        for (MiningSite__c mine : MineData) {
            carbonfootprints.add(new CarbonFootprintWrapper(mine.Name, mine.Carbon_Footprint__c));
        }
        
        return carbonfootprints;
    }
	public without sharing class CarbonFootprintWrapper {
    	@AuraEnabled public String Name { get; set; }
    	@AuraEnabled public Decimal Carbon_Footprint { get; set; }
    
    	public CarbonFootprintWrapper(String name, Decimal CarbonFootprint) {
        	this.Name = name;
        	this.Carbon_Footprint = CarbonFootprint;
    	}    
    	public CarbonFootprintWrapper() {}
	}
}