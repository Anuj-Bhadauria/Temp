public with sharing class ObjectListDetail {
    
    @AuraEnabled
    public static List<String> getName(){
        //List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();    
        List<String> options = new List<String>();
        for( Schema.SObjectType o: Schema.getGlobalDescribe().values()){
            System.debug('AllObjectName == '+ o.getDescribe().getName());
            options.add(o.getDescribe().getName());
        }
        
        return options;
    }
    
    @AuraEnabled
    public static map<String,String> getObjectLabels(String objName){
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Schema.SObjectType ctype = gd.get(objName);
        Map<String, Schema.SobjectField> fmap = ctype.getDescribe().fields.getMap();
        List<String> apiNames =  new list<String>();
        map<string,string> fieldApiLabelMap = new map<string,string>();
        
        Integer i=0;
        
        for(string apiName : fmap.keySet()){
            if(i<10){
                fieldApiLabelMap.put(apiname,fMap.get(apiName).getDescribe().getLabel());
                
                i++;
            }else{
                break;
            }
        }
        
        //System.debug('MyMAp === '+);
        return fieldApiLabelMap;
    }

    
    @AuraEnabled
    public static SObject[] getObjectRecords(String objName){
        System.debug('==='+objName);
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Schema.SObjectType ctype = gd.get(objName);
        Map<String, Schema.SobjectField> fmap = ctype.getDescribe().fields.getMap();
        System.debug(fmap.keySet()+'=fmap='+fmap);
        
        //Schema.DescribeSObjectResult r = Sobject.get(objName).sObjectType.getDescribe();
        List<String> apiNames =  new list<String>();
        Integer i=0;
        String quertStr = '';
        for(string apiName : fmap.keySet()){
            if(i<10){
                apiNames.add(apiName);
                quertStr = quertStr+apiName+',';
                i++;
            }else{
                break;
            }
        }
        System.debug('===='+quertStr);	
        quertStr = quertStr.removeEnd(',');
        String queryFinal = 'SELECT '+quertStr+' FROM '+objName;
        SObject[] objResult = Database.query(queryFinal);
        System.debug('==result==='+objResult);
        return objResult;
    }
    
    
    @AuraEnabled
    public static List <String> deleteRecords(list <Id> lstRecordId, String objName) {   	
        
    	boolean addComma = false;
        String selectedRecords = '(';
        for (Id commId : lstRecordId) {
            if (addComma) selectedRecords = selectedRecords + ',';
            selectedRecords = selectedRecords + '\'' +  commId + '\'';
            addComma = true;
        }
        selectedRecords = selectedRecords + ')';
        // for store Error Messages  
        List <String> oErrorMsg = new List < String > ();
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Schema.SObjectType ctype = gd.get(objName);
        // Query Records for delete where id in lstRecordId [which is pass from client side controller]  
        
        String queryFinal = 'SELECT Id FROM '+ctype+' Where Id IN '+selectedRecords;
        System.debug('Query == '+ queryFinal);
       //List <Contact> lstDeleteRec = [select Id from Contact where id IN: lstRecordId];
        
        // delte contact list with Database.DeleteResult[] database class.
        // It deletes some queried contacts using <samp class="codeph apex_code">Database.<span class="statement">delete</span></samp> 
        // with a false second parameter to allow partial processing of records on failure.
        // Next, it iterates through the results to determine whether the operation was successful or not
        // for each record. and check if delete contact successful so print msg on debug, 
        // else add error message to oErrorMsg List and return the list  
        
        list<Sobject> sobjectList = Database.query(queryFinal);
        Database.DeleteResult[] DR_Dels = Database.delete(sobjectList, false);
        // Iterate through each returned result
        for (Database.DeleteResult dr: DR_Dels) {
            if (dr.isSuccess()) {
                system.debug('successful delete contact');
                // Operation was successful
            } else {
                // Operation failed, so get all errors   
                oErrorMsg.add('');
                for (Database.Error err: dr.getErrors()) {
                    // add Error message to oErrorMsg list and return the list
                    oErrorMsg.add(err.getStatusCode() + ': ' + err.getMessage());
                }
            }
        }
        return oErrorMsg;
    }
    /*
    @AuraEnabled
    //This methods returns to the edit page of a record 
    public Static PageReference editRecords(Id recordId){   
        try{
            
            if(recordId != null){                          
                PageReference pageRef = new PageReference('/'+recordId);
                pageRef.setRedirect(true);   
                return pageRef;
            }
            
        }  
        Catch(Exception e){
            System.debug('Exception '+e);
        }
        return null;      
    }  */
}