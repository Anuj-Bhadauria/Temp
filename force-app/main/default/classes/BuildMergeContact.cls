public class BuildMergeContact {
    
    @AuraEnabled
    public static List<conChildObjNames> fetchRelatedList(String filterString ) {
        List<conChildObjNames> returnRelatedList = new List<conChildObjNames>();
        Schema.DescribeSObjectResult r = null;
        List<conChildObjNames> options = new List<conChildObjNames>();
        //string apiName;
        list<string> ObjApiName = new list<string>();                   
        List<string> notSupportedObj=new List<string>{'OpportunityOld', 'Work Order Change Event', 'User Change Event', 'Task Change Event', 'Service Appointment Change Event'
            , 'Return Order Change Event', 'Outgoing Email Relation', 'Outgoing Email', 'Order Change Event', 'Opportunity Contact Role Change Event', 
            'Opportunity Change Event', 'Open Activity', 'Maintenance Plan Change Event', 'Lead Change Event', 'Event Change Event', 'Event', 'Email Status', 
            'Contract Change Event', 'Contact Change Event', 'Case Change Event', 'Campaign Member Change Event', 'Asset Change Event ', 'ActivityRecurrence2Exception',
            'ActivityRecurrence2', 'Activity History', 'Opportunity', 'Account contact role change event' };
                if(filterString=='' || filterString== null){
                    String objName;
                    string apiName;
                    Integer i = 1;
                    Schema.DescribeSObjectResult describe = Contact.sObjectType.getDescribe();
                    for (Schema.ChildRelationship cr : describe.getChildRelationships()){
                        system.debug('Child Object Name 21 '+i+' === '+cr.getChildSObject());
                        system.debug('cr>>>>>'+cr);
                        apiName = cr.getChildSObject().getDescribe().getName();// API Name of an object
                        //System.debug('ObjName == '+objName);
                        //apiName = string.valueOf(cr.getChildSObject().sObjectType.getDescribe());
                        objName = cr.getChildSObject().getDescribe().getLabel(); // Label of an object
                        
                        //System.debug('APIName == '+apiName);
                        
                        //conChildObjNames.add(objName,apiName);
                        // if(options.size()<4){
                        if(!ObjApiName.contains(apiName) && !notSupportedObj.contains(ObjName)){
                            ObjApiName.add(apiName);
                            if(objName != 'opportunity Contact Role'){
                            
                                  options.add( new conChildObjNames( objName, apiName ) );
                                  }
                                 else{
                                options.add( new conChildObjNames( 'Opportunities', apiName ) );
                            }

                        }
                        // }
                        
                        //returnRelatedList.add(objName);
                        
                    }
                    //system.debug('options>>>>>>>>>'+options);
                    for(conChildObjNames opt : options){
                        
                        // system.debug('options>>>>>>>>>'+opt);
                        
                    }
                    return options;
                }
        if(filterString!=''){
            String objName;
            string apiName;
            Integer i = 1;
            Schema.DescribeSObjectResult describe = Contact.sObjectType.getDescribe();
            for (Schema.ChildRelationship cr : describe.getChildRelationships()){
                //system.debug('Child Object Name '+i+' === '+cr.getChildSObject());
                apiName = cr.getChildSObject().getDescribe().getName();// API Name of an object
                //System.debug('ObjName == '+objName);
                //apiName = string.valueOf(cr.getChildSObject().sObjectType.getDescribe());
                objName = cr.getChildSObject().getDescribe().getLabel(); // Label of an object
                
                //System.debug('APIName == '+apiName);
                
                //conChildObjNames.add(objName,apiName);
                options.add( new conChildObjNames( objName, apiName ) );
                //returnRelatedList.add(objName);
            }
            
            List<conChildObjNames> listFiltered = new List<conChildObjNames>();
            for(conChildObjNames op:options){
                if(op.label.toLowerCase().contains(filterString.toLowerCase())){
                    if(listFiltered.size()<4){
                        listFiltered.add( new conChildObjNames( op.label, op.value ) );
                    }
                    
                    
                }
            }
            system.debug('Filtered List==>'+listFiltered);
            return listFiltered;
        }
        
        return null;
    }
    
    @AuraEnabled
    public static String mergeChildRedcords(List<String> conIds, List<String> sObjectChildAPIs, Id parentId) {
        System.debug('===87==='+parentId);
        System.debug('===87==='+conIds);
        
        String resultStatus;
        String query = null;
        system.debug('conIds=====>'+conIds+'====conIds.size()==='+conIds.size());
        system.debug('sObjectChildAPIs=====>'+sObjectChildAPIs);
        system.debug('parentId=====>'+parentId);
        List<Id> contactIdList=new List<Id>();
        for(Integer i=0;i<conIds.size();i++){
            contactIdList.add(conIds[i].split('check_')[1]);
            System.debug('===98==='+contactIdList);
        }
        //List<Id> contactIdList=conIds;
        
        //String contactId = '0032v000030Wh1BAAS';  
        List<SObject> sObjectListData = new List<SObject>();
        List<SObject> sObjectListUpdate = new List<SObject>();
        List<ContentDocumentLink> attachmentListInsert = new List<ContentDocumentLink>();  
        List<ContentDocumentLink> deleteLinks = new List<ContentDocumentLink>();  
        
        for(String objName : sObjectChildAPIs) {
            for(Id conId:contactIdList){
                System.debug('APINameOfSobjectName 105 == '+objName);
                SObjectType objType = Schema.getGlobalDescribe().get(objName);
                Map<String,Schema.SObjectField> fieldMap = objType.getDescribe().fields.getMap();
                for (Schema.SObjectField fieldName: fieldMap.values()){
                    
                    schema.DescribeFieldResult fieldDefinition = fieldName.getDescribe();
                    if(fieldDefinition.getType() == schema.DisplayType.REFERENCE && String.valueOf(fieldDefinition.getReferenceTo().get(0)) == 'Contact'){
                        System.debug('=======117==== '+conId);
                        System.debug('=======118==== '+fieldName);
                        query = 'SELECT Id, ' + fieldName + ' FROM ' + objName + ' WHERE ' + fieldName + ' = \'' + conId + '\'';
                        sObjectListData = (Database.query(query));
                        System.debug('=======sObjectListData116==== '+sObjectListData);
                        for(Sobject sObjData : sObjectListData){
                            ID sObjRecordId = sObjData.id;
                            system.debug('sObjRecordId=====>'+sObjRecordId);
                            
                            
                            sObject obj = Schema.getGlobalDescribe().get(objName).newSObject();
                            obj.put('Id', sObjRecordId);
                            obj.put(fieldName, parentId);
                            sObjectListUpdate.add(obj);
                        }
                    }
                    else if(objName == 'ContentDocumentLink'){
                        Id parId = ParentId;
                        System.debug('===136==='+conIds);
                        System.debug('===contactIdList==='+contactIdList);
                        System.debug('===137==='+parId);
                        list <Attachment> attaches = [SELECT Id, Name, Body, ContentType,OwnerId, ParentId From Attachment WHERE ParentId =: contactIdList];
                        ContentVersion cVersion = new ContentVersion();
                        cVersion.ContentLocation = 'S'; //S-Document is in Salesforce. E-Document is outside of Salesforce. L-Document is on a Social Netork.
                        cVersion.PathOnClient = attaches[0].Name;//File name with extention
                        cVersion.Origin = 'H';//C-Content Origin. H-Chatter Origin.
                        cVersion.OwnerId = attaches[0].OwnerId;//Owner of the file
                        cVersion.Title = attaches[0].Name;//Name of the file
                        cVersion.VersionData = attaches[0].Body;//File content
                        Insert cVersion;
                        Id conDocument = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cVersion.Id].ContentDocumentId;
                        
                        
                        
                        list <ContentDocumentLink > attach = [SELECT ContentDocumentId, linkedEntityId,ContentDocument.title FROM ContentDocumentLink WHERE LinkedEntityId =: contactIdList];
                        // list <Attachment> attach = [SELECT Id, Name, Body, ContentType, ParentId From Attachment WHERE ParentId =: conIds[0]];
                        System.debug('===140==='+attach);
                        //attach.ParentId = ParentId;
                        
                        list <ContentDocumentLink > attach1 = new list <ContentDocumentLink>();
                        for (ContentDocumentLink  at: attach){
                            ContentDocumentLink  att = new ContentDocumentLink();
                            att.ContentDocumentId = conDocument;
                            att.LinkedEntityId = parId;
                            att.ShareType = 'I';//V - Viewer permission. C - Collaborator permission. I - Inferred permission.
                            att.Visibility = 'InternalUsers';//AllUsers, InternalUsers, SharedUsers
                            attach1.add(att);
                            
                        }
                        
                        System.debug('===143==='+attach1);
                        insert attach1;
                        delete attach;
                        
                        /*Id parId = ParentId;
System.debug('===136==='+conIds);
System.debug('===contactIdList==='+contactIdList);
System.debug('===137==='+parId);
list <Attachment> attach = [SELECT Id, Name, Body, ContentType, ParentId From Attachment WHERE ParentId =: contactIdList];
// list <Attachment> attach = [SELECT Id, Name, Body, ContentType, ParentId From Attachment WHERE ParentId =: conIds[0]];
System.debug('===140==='+attach);
//attach.ParentId = ParentId;

list <Attachment> attach1 = new list <Attachment>();
for (attachment at: attach){
Attachment att = new Attachment(Name = at.Name, Body = at.Body); 
att.ParentId = parId;
attach1.add(att);
}

System.debug('===143==='+attach1);
insert attach1;
delete attach; */
                       
                    }
                }
            }    
        }
        system.debug('sObjectListUpdate=====>'+sObjectListUpdate);
        
        if(sObjectListUpdate != null){
            try{
                update sObjectListUpdate;
                resultStatus='SUCCESS';
            }catch(DmlException e) {
                resultStatus='Failure';
                System.debug('The following exception has occurred: ' + e.getMessage());
            }
        }
        
        return resultStatus;
        
    }
    
    public class conChildObjNames{
        @AuraEnabled
        public String label;
        @AuraEnabled
        public String value;
        
        public conChildObjNames( String label, String value ) {
            this.label = label;
            this.value = value;
        }
    }
}