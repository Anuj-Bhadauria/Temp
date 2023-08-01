public class SyncProcessController {

    @AuraEnabled
    public static void getCallout() {
        try{       
            List<SyncProcessWrapper> syncProcessWrapperList = new List<SyncProcessWrapper>();
            Account accHighVolume = [Select Id FROM Account WHERE Name = 'High Volume' LIMIT 1];
            Account accLowVolume = [Select Id FROM Account WHERE Name = 'Low Volume' LIMIT 1];
            List<SQX_Part__c> cqPartsList = new List<SQX_Part__c>();
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://cqparts-3d06.restdb.io/rest/cqpart');
            request.setHeader('Content-type', 'application/json');
            request.setHeader('x-api-key', 'b96d75ce0f9f342d10af6710ef8ea7ed0ad06');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            // If the request is successful, parse the JSON response.
            if(response.getStatusCode() == 200) {
                String jsonBody = response.getBody();
                String jsonStr = jsonBody.replaceAll('_id', 'id').replaceAll('Part Name', 'PartName').replaceAll('Total Quantity Shipped', 'TotalQuantityShipped');
                syncProcessWrapperList = (List<SyncProcessWrapper> ) System.JSON.deserialize(jsonStr, List<SyncProcessWrapper>.class);
                for(SyncProcessWrapper wrapper: syncProcessWrapperList){
                    SQX_Part__c cqPart = new SQX_Part__c();
                    cqPart.Part_Number__c = wrapper.id;
                    if(wrapper.TotalQuantityShipped <99){
                        cqPart.Account__c = accHighVolume.Id;
                    }
                    else if(wrapper.TotalQuantityShipped >=99){
                        cqPart.Account__c = accLowVolume.Id;
                    }
                    cqPart.Name = wrapper.PartName;
                    cqPart.Active__c = true;
                    cqPartsList.add(cqPart);
                }
                if(!cqPartsList.isEmpty()){
                    insert cqPartsList;
                }
            } 
        }
        catch(Exception e){
            System.debug('Exception getLineNumber'+e.getLineNumber());
            System.debug('Exception getMessage'+e.getMessage());
        }
    }

    
    public class SyncProcessWrapper{
        @AuraEnabled public string id;
        @AuraEnabled public string PartName;
        @AuraEnabled public Integer TotalQuantityShipped;
    }
}