public class openCageGeoCallout{

    public string getResponse(String url){
    
        Http h = new Http();

        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.opencagedata.com/geocode/v1/json?q=LAT+LNG&key=a9fb9eea683c49938db7b7bea245bdca');
        req.setMethod('GET');
        
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        return res.getBody();
     
        
    }
}