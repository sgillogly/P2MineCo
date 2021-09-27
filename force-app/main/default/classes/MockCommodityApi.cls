@isTest
public with sharing class MockCommodityApi implements HttpCalloutMock{
    public boolean empty;

    public MockCommodityApi(boolean isEmpty) {
        empty = isEmpty;
    }

    public HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();

        response.setHeader('Content-type', 'application/json');
        String body = '{';

        body = body + '"d": "data"';//no comma
        for (Integer i = 0; i < 300; i++) {
            body = body + ', "filler": "filler", "key' + i + '": ' + i;
        }

        for (Integer k = 0; k < 30; k++) {
            body = body + ', "d": "data"';//comma
            for (Integer i = 0; i < 300; i++) {
                body = body + ', "filler": "filler", "key' + i + '": ' + i;
            }
        }

        body= body + '}';
        response.setBody((empty) ? '' : body);
        response.setStatusCode((empty) ? 404 : 200);

        return response;
    }   
}

