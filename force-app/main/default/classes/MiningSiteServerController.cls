public without sharing class MiningSiteServerController {
    
    @AuraEnabled(cacheable=true)
    public static Id GetMiningSite(String Name) {
        MiningSite__c FindID = [SELECT id FROM MiningSite__c WHERE Name = :Name];
        return FindID.Id;
    }
}