public class CommodityApiHandler {
    private static final String urlStart = 'https://data.nasdaq.com/api/v3/datasets/';
    private static final String format = 'json';
    private static final String frequency = 'monthly';
    private static final String endDate = '2021-06-30';
    private static final String key = 'yzDCvvQ5ghAfjbEz59-K';
    
    
    @AuraEnabled
    public static Map<String, Map<String, double>> realData(Integer rows) {
        Map<String, Map<String, double>> pricesAllMetals = new Map<String, Map<String, double>>();
        
        map<String, String> preciousMetals = getMetals(true); //preciousMetalsList();
        for (String metalKey : preciousMetals.keySet()) {
            Map<String, double> priceHistory = callApi(preciousMetals.get(metalKey), rows);
            pricesAllMetals.put(metalKey, convertToTons(priceHistory));
        }
        
        map<String, String> simpleMetals = getMetals(false);//metalsList();
        for (String metalKey : simpleMetals.keySet()) {
            pricesAllMetals.put(metalKey, callApi(simpleMetals.get(metalKey), rows));
        }
        
        return pricesAllMetals;
    }
    
    public static Map<String, double> callApi(String metal, Integer rows) {
        HTTP h = new HTTP();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(urlStart + metal + '.' + format + 
                            '?collapse=' + frequency + '&rows=' + String.valueOf(rows) + 
                            '&order=desc&column_index=1&end_date=' + endDate + '&api_key=' + key);
        request.setMethod('GET');

        HttpResponse response = h.send(request);
        if (response.getStatusCode() == 200) {
            return parseResult(response, rows);
        }
        System.debug(response.getStatusCode());
        return new Map<String, double>();
    }
    
    public static Map<String, double> parseResult(HttpResponse response, Integer rows) {
        Map<String, double> parsedResults = new Map<String, double>();
        JSONParser parser = JSON.createParser(response.getBody());
        while (parser.nextToken() != null) {
            if (parser.getText() == 'data') {
                for (Integer i = 0; i < rows; i++) {
                    parser.nextToken();
                    parser.nextToken();
                    parser.nextToken();
                    String tempString = parser.getText();
                    parser.nextToken();
                    try {
                        parsedResults.put(tempString, parser.getDoubleValue());
                    } catch (System.Exception e) {
                        System.debug('Callout response underflow error (CommodityApiHandler.paresResults)');
                        break;
                    }
                }
                break;
            }
        }
        System.debug(parsedResults);
        return parsedResults;
    }
    
    
    
    
    
    /*@AuraEnabled
    public static Map<String, Map<String, double>> sampleData() {
        List<String> dates = new List<String>{'2015', '2016', '2017', '2018', '2019'};
            Map<String, Map<String, double>> output = new Map<String, Map<String, double>>();
        double price = 10;
        for (String metal : new List<String>{'gold', 'silver', 'copper', 'iron', 'nickel'}) {
            Map<String, double> values = new Map<String, double>();
            for (String currentDate : dates) {
                price += 10;
                values.put(currentDate, price);
            }
            output.put(metal, values);
        }
        System.debug(output);
        return output;
    }*/
    
    
    
    
    public static Map<String, double> convertToTons(Map<String, double> result) {
        Map<String, double> forOutput = new Map<String, double>();
        for (String key : result.keySet()){
            forOutput.put(key, result.get(key) * 32000);
        }
        return forOutput;
    }
    
    /*public static Map<String, String> preciousMetalsList() {
        map<String, String> metals = new map<String, String>();
        metals.put('Gold', 'LBMA/GOLD');
        metals.put('Silver', 'LBMA/SILVER');
        metals.put('Platinum', 'JOHNMATT/PLAT');
        metals.put('Palladium', 'JOHNMATT/PALL');
        return metals;
    }
    
    public static Map<String, String> metalsList() {
        map<String, String> metals = new map<String, String>();
        metals.put('Aluminum', 'ODA/PALUM_USD');
        metals.put('Copper', 'ODA/PCOPP_USD');
        metals.put('Iron', 'ODA/PIORECR_USD');
        metals.put('Nickel', 'ODA/PNICK_USD');
        metals.put('Tin', 'ODA/PTIN_USD');
        metals.put('Zinc', 'ODA/PZINC_USD');
        return metals;
    }*/

    public static Map<String, String> getMetals(boolean preciousMetal) {

        List<Product2> metalsList = [SELECT Name, ProductCode FROM Product2 WHERE Precious_Metal__c = :preciousMetal];
        map<String, String> metals = new map<String, String>();

        for (Product2 metal : metalsList) {
            metals.put(metal.Name, metal.ProductCode);
        }
        
        return metals;
    }
    
}