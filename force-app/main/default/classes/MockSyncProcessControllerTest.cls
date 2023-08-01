@isTest
global class MockSyncProcessControllerTest implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"_id": "619683d69402c24f000237e9","Part Name": "Population Sensor","Total Quantity Shipped": 350000}]');
        response.setStatusCode(200);
        return response; 
    }   
}