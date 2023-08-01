public with sharing class SingleRelatedListController {
	/*
    @AuraEnabled
    public static List<Document_Management__c> initData(Id recordId,String folderName){
        return [SELECT Id, Name, jobID__c, Version__c, folders__c FROM Document_Management__c WHERE Doc_Folder__r.Name =:folderName AND (Account__c =:  recordId OR Opportunity__c =: recordId OR Contract__c =: recordId OR Opportunity_Tasks__c =: recordId)];
    }
   
    @AuraEnabled
    public static String FileDownload(List<String> recordIds) {     
        CSRF_Token__c sectoken = [SELECT Refresh_Token__c, Session_Id__c FROM CSRF_Token__c];
        
        if(recordIds.size()>1){
            system.debug('== Multi RecordId 119== '+recordIds);
            
            Http h = new Http();
            
            String url = 'https://intelligent-sfdms.herokuapp.com/salesforce/downloadzip/';
            String separationString = '2a8b828b-ee1e-461b-87fe-ce69c0491b04';
            String token = sectoken.Refresh_Token__c;
            String sessionid = sectoken.Session_Id__c;  
            system.debug(token);
            system.debug(sessionid);
           
            List<Document_Management__c> dm = [SELECT id FROM Document_Management__c WHERE id IN :recordIds];
            //       Document_Management__c dm =[select id from Document_Management__c where id=:recordIds];
            system.debug('without pretty'+JSON.serialize(dm));
            String JsonString=JSON.serialize(dm);
            
            
            HttpRequest req = new HttpRequest();
            req.setHeader('Content-Type','application/json; boundary=' +separationString);
            req.setHeader('X-CSRFToken', token);
            req.setHeader('Cookie', 'sessionid='+sessionid +'; '+'csrftoken='+token);
            req.setHeader('Referer', 'https://intelligent-sfdms.herokuapp.com/salesforce/login/');
            req.setEndpoint(url);
            req.setMethod('POST');
            req.setBody(JsonString);
            req.setTimeout(120000);
            
            system.debug('Sentbody=' + JsonString);
            system.debug('REQUEST: ' + req);
            
            // Send the request, and return a response
            HttpResponse res = h.send(req);
            System.debug(res.getBody());
            
            return res.getBody();
        }
        else{
            system.debug('===Single RecordId 154== '+recordIds[0]);
            
            Http h = new Http();
            
            String url = 'https://intelligent-sfdms.herokuapp.com/salesforce/tmp-url/'+ recordIds[0]+'/';
            String separationString = '2a8b828b-ee1e-461b-87fe-ce69c0491b04';
            String token = sectoken.Refresh_Token__c;
            String sessionid = sectoken.Session_Id__c;  
            system.debug(token);
            system.debug(sessionid);
            
            HttpRequest req = new HttpRequest();
            req.setHeader('Content-Type','application/json; boundary=' +separationString);
            req.setHeader('X-CSRFToken', token);
            req.setHeader('Cookie', 'sessionid='+sessionid +'; '+'csrftoken='+token);
            req.setHeader('Referer', 'https://intelligent-sfdms.herokuapp.com/salesforce/login/');
            // req.setHeader('recordId', recordIds);
            req.setEndpoint(url);
            req.setMethod('GET');
            req.setTimeout(120000);
            
            Http http = new Http();
            HTTPResponse res = http.send(req);
            System.debug(res.getBody());
            
            return res.getBody();
            
        }
        //    String recordId = 'a032w000004oZGBAA2';
        
    }
    
    @AuraEnabled
    public static Id updateParentRecordId(string recordId, String parentRecordId) { 
        //Document_Management__c dmRecordId = [SELECT Id, ParentRecordId__c FROM Document_Management__c WHERE Id = :recordId];
        Document_Management__c dm = new Document_Management__c(Id = recordId);
        dm.ParentRecordId__c = parentRecordId;
        dm.Name = 'Test';
        update dm;
        return recordId;
    }
    
    @AuraEnabled
    public static Id FolderUpdate(String fileName,string recordId) {  
	//string recordId='a032w000004q76zAAA';
	 //System.debug('==FILE Name 79=='+fileName);		 
     Document_Management__c dm =[select id, Name, 	Account__c, Competitor_Contract__c, Contract_LOB__c, Active_Contract__c, Doc_Folder__c, Key_Words__c, Version__c, Opportunity__c, Doc_type__c, Contract__c, Opportunity_Tasks__c, ParentRecordId__c from Document_Management__c where Name =:fileName ORDER BY Version__c DESC LIMIT 1];
    // System.debug('==dm.version==81'+dm.Version__c);
        List<Document_Management__c> updatedInvoiceList = new List<Document_Management__c>();
     Document_Management__c objCust = new Document_Management__c();
     objCust.Name = dm.Name;
     objCust.Account__c = dm.Account__c;
     objCust.Competitor_Contract__c = dm.Competitor_Contract__c;
     objCust.Contract_LOB__c = dm.Contract_LOB__c;
     objCust.Active_Contract__c = dm.Active_Contract__c;
     objCust.Doc_Folder__c = dm.Doc_Folder__c;
     objCust.Key_Words__c = dm.Key_Words__c;
     objCust.Version__c = dm.Version__c+1;
     objCust.Opportunity__c = dm.Opportunity__c;
     objCust.Doc_type__c = dm.Doc_type__c;
     objCust.Contract__c = dm.Contract__c;
     objCust.Opportunity_Tasks__c = dm.Opportunity_Tasks__c;
     objCust.ParentRecordId__c = recordId;
     
     insert objCust;
     updatedInvoiceList.add(objCust);
     System.debug(objCust);
     return objCust.id;
     
 }
    
    @AuraEnabled
    public static List<Document_Management__c> selectedFolderList(List<String> selectedFoldersName, Id recordId){
        if(selectedFoldersName.contains('All')){
            List<Document_Management__c> dmsList = [SELECT Id, Name, jobID__c, Version__c, folders__c 
                                                    FROM Document_Management__c WHERE 
                                                    (Account__c =:  recordId OR Opportunity__c =: recordId OR Contract__c =: recordId OR Opportunity_Tasks__c =: recordId)];
            return dmsList;
           
        }
        else{
            System.debug('==ELSE 127==');
            System.debug('==dmsList 128=='+selectedFoldersName+' ID = '+recordId);
            List<Document_Management__c> dmsList = [SELECT Id, Name, jobID__c, Version__c, folders__c 
                                                    FROM Document_Management__c WHERE Doc_Folder__r.Name 
                                                    IN:selectedFoldersName AND (Account__c =:  recordId OR Opportunity__c =: recordId OR Contract__c =: recordId OR Opportunity_Tasks__c =: recordId)];
            System.debug('==dmsList 132=='+dmsList);
            return dmsList;
        }
        
    }
    

    @AuraEnabled
    public static List<DocumentWrapper> getDocumentFolderName(){
        List<DocumentWrapper> wraplist = new List<DocumentWrapper>();
        List<Doc_Folder__c> docFolderNameList = [SELECT Name FROM Doc_Folder__c];
        wraplist.add(new DocumentWrapper('All', 'All'));
        for(Doc_Folder__c doc : docFolderNameList){
            wraplist.add(new DocumentWrapper(doc.Name, doc.Name));
        }
        return wraplist;
    }
    
    @AuraEnabled
    public static Boolean newDocFolder(String docName, String descptn){
        System.debug('created Folder name==>' + docName);
        Boolean isDuplicate = false;
        List<String> docFolderName = new List<String>();
        List<Doc_Folder__c> docFolderList = [SELECT Name FROM Doc_Folder__c];
        for(Doc_Folder__c df : docFolderList){
            docFolderName.add(df.Name);
        }
        if(docFolderName.contains(docName)){
            isDuplicate = true;
            return isDuplicate;
        }
        else{
            Doc_Folder__c newFol = new Doc_Folder__c();
            newFol.Name = docName;
            newFol.Description__c = descptn;
            insert newFol;  
            return isDuplicate;
        }
    }
        
    
    @AuraEnabled
    public static Id createDMSRecord(String recordId,String docName, String descrp, String key, Decimal version, String docType, String folder,List<String> contLOB, Boolean activeCont, Boolean CompCont){
        System.debug('==Coming 194 ==');
        System.debug('==Coming 195 Active Boolean =='+activeCont);
         System.debug('==Coming 199 Active Boolean =='+CompCont);
        System.debug('==Coming 196 LOB =='+contLOB);
        String selectedContLOB = String.join(contLOB,',');
        String myIdPrefix = String.valueOf(recordId).substring(0,3);
        
        Document_Management__c DmsId = new Document_Management__c();
        DmsId.Name = docName;
        DmsId.Description__c = descrp;
        DmsId.Key_Words__c = key;
        DmsId.Version__c = version;
        DmsId.Doc_type__c = docType;
        DmsId.Doc_Folder__c = folder;
        DmsId.Contract_LOB__c = selectedContLOB.replace(',',';');
        DmsId.Active_Contract__c = activeCont;
        DmsId.Competitor_Contract__c = CompCont;
        if(myIdPrefix == '001'){
            DmsId.Account__c = recordId;
        }
        else if(myIdPrefix == '006'){
             DmsId.Opportunity__c = recordId;
        }
        else if(myIdPrefix == '800'){
            DmsId.Contract__c = recordId;
        }
        else if (myIdPrefix == 'a0e'){
            DmsId.Opportunity_Tasks__c = recordId;
        }
       
        DmsId.ParentRecordId__c = recordId;
        insert DmsId;
        return DmsId.Id;
        //return null;
    }
    
    @AuraEnabled
    public Static List<DocumentWrapper> getDocTypePickListValues(){
        List<DocumentWrapper> pickListValuesList= new List<DocumentWrapper>();
        Schema.DescribeFieldResult fieldResult = Document_Management__c.Doc_type__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(new DocumentWrapper(pickListVal.getLabel(),pickListVal.getValue()));
        }     
        return pickListValuesList;
    }
    
    @AuraEnabled
    public Static List<DocumentWrapper> getContLOBPickListValues(){
        List<DocumentWrapper> pickListValuesList= new List<DocumentWrapper>();
        Schema.DescribeFieldResult fieldResult = Document_Management__c.Contract_LOB__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(new DocumentWrapper(pickListVal.getLabel(),pickListVal.getValue()));
        }     
        return pickListValuesList;
    }
    
    @AuraEnabled
    public static List<DocumentWrapper> getDocFolderNameWithId(){
        List<DocumentWrapper> wraplist = new List<DocumentWrapper>();
        List<Doc_Folder__c> docFolderNameList = [SELECT Id, Name FROM Doc_Folder__c];
        for(Doc_Folder__c doc : docFolderNameList){
            wraplist.add(new DocumentWrapper(doc.Name, doc.Id));
        }
        return wraplist;
    }
    
    @AuraEnabled
    public static void deleteRecord(Id recordId){
        Delete [Select id from Document_Management__c where id=:recordId];
    }
    
    public class DocumentWrapper{
        @AuraEnabled
        public String label;
        @AuraEnabled
        public String value;
        
        public DocumentWrapper(String label, String value){
            this.label = label;
            this.value = value;
        }
    }
    public class MultiSelectWrapper{
        @AuraEnabled
        public String label;
        public MultiSelectWrapper(String label){
            this.label = label;
        }
    } */
}