public class CommodityApiHandler {
    public static String urlStart = 'https://data.nasdaq.com/api/v3/datasets/';
    public static String format = 'json';
    public static String frequency = 'monthly';
    public static Integer rows = 25;
    public static String endDate = '2021-06-30';
    public static String key = 'yzDCvvQ5ghAfjbEz59-K';
    
    @AuraEnabled
    public static Map<String, Map<String, double>> callApiArray(Integer rowsInput) {
        map<String, String> preciousMetals = preciousMetalsList();
        map<String, String> metals = metalsList();
        Map<String, Map<String, double>> output = new Map<String, Map<String, double>>();
        
        for (String metalKey : preciousMetals.keySet()) {
            Map<String, double> result = callApi(preciousMetals.get(metalKey), rowsInput);
            Map<String, double> forOutput = new Map<String, double>();
            for (String key : result.keySet()){
                forOutput.put(key, result.get(key) * 32000);
            }
            output.put(metalKey, forOutput);
        }
        for (String metalKey : metals.keySet()) {
            output.put(metalKey, callApi(metals.get(metalKey), rowsInput));
        }
        return output;
    }
    
    public static Map<String, String> preciousMetalsList() {
        map<String, String> metals = new map<String, String>();
        metals.put('gold', 'LBMA/GOLD');
        metals.put('silver', 'LBMA/SILVER');
        metals.put('platinum', 'JOHNMATT/PLAT');
        metals.put('palladium', 'JOHNMATT/PALL');
        return metals;
    }
    
    public static Map<String, String> metalsList() {
        map<String, String> metals = new map<String, String>();
        metals.put('aluminum', 'ODA/PALUM_USD');
        metals.put('copper', 'ODA/PCOPP_USD');
        metals.put('iron', 'ODA/PIORECR_USD');
        metals.put('nickel', 'ODA/PNICK_USD');
        metals.put('tin', 'ODA/PTIN_USD');
        metals.put('zinc', 'ODA/PZINC_USD');
        return metals;
    }
    
    //might need more specific dates
    //might need to set all to ascending with specific start date
    public static Map<String, double> callApi(String metal, Integer rowsInput) {
        rows = rowsInput;
        HTTP h = new HTTP();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(urlStart + metal + '.' + format + 
                            '?collapse=' + frequency + '&rows=' + String.valueOf(rows) + 
                            '&order=desc&column_index=1&end_date=' + endDate + '&api_key=' + key);
        request.setMethod('GET');
        HttpResponse response = h.send(request);
        //for (Integer i = 0; i < 7; i++) {
            //System.debug(response.getBody().subString(100 * i, 100 * (i + 1)));
        //}
        return parseResult(response);
    }
    
    public static Map<String, double> parseResult(HttpResponse response) {
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
                parsedResults.put(tempString, parser.getDoubleValue());
                }
            }
        }
        System.debug(parsedResults);
        return parsedResults;
    }
    
    @AuraEnabled
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
    }
    
    @AuraEnabled
    public static Map<String, Map<String, double>> realData(Integer rowsInput) {
        return callApiArray(rowsInput);
    }
    
    @AuraEnabled
    public static void logInput(String input) {
        System.debug(input);
    }
}