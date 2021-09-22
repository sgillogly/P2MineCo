public class AuraHomeController {
    
	public static List<MiningSite__c> top3 = [SELECT Location__c, Name, Ore__r.Name FROM MiningSite__c ORDER BY EstimatedWorth__c DESC LIMIT 3];
    
    @AuraEnabled
    public static String imageUrlBase(Integer idx){
        
        String base = 'https://image.maps.ls.hereapi.com/mia/1.6/mapview?';
        String zoomAndKey = '&z=11&apiKey=NeXaL6Ng_elBhreu8qmyiHjR6SfHo1haBFZev6507Rc';
        
        Location loc = top3[idx].Location__c;
        
        String lat = String.valueOf(loc.latitude);
        String lon = String.valueOf(loc.longitude);
        
		String url = base + 'c=' + lat + '%2C' + lon + zoomAndKey;
		System.debug(url);
        return url;
    }
    
    private String toolTipBase(Integer idx){
        return top3[idx].Name + ', primary ore ' + top3[idx].Ore__r.Name;
    }
}