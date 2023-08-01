public class MergeContactLightningController {    
    
    @AuraEnabled
    public static  List<Contact> GetConRecords(String accId) {
        List<Contact> conList=new List<Contact>();
        conList=[SELECT Id, Contact.AccountId, Name,Email,Phone,Owner.Name FROM contact
                 WHERE contact.AccountId=:accId AND IsDeleted=false order by Contact.Name];        
        return conList;
    } 
    
    public class FieldWrapper {
        @AuraEnabled public  String labels{get;set;}
        @AuraEnabled public  String apinames{get;set;}
        @AuraEnabled public  String contactValue1{get;set;}
        @AuraEnabled public  String contactValue2{get;set;}
        @AuraEnabled public  String contactValue3{get;set;}
    }
    
    public class ContactWrapper {
        @AuraEnabled public  String masterContactId{get;set;}
        @AuraEnabled public  String secondContactId{get;set;}
        @AuraEnabled public  String thirdContactId{get;set;}
        @AuraEnabled public List<FieldWrapper> fieldWrapper = new List<FieldWrapper>();
    }
    
    @AuraEnabled
    public static  List<ContactWrapper> GetConData(String[] conIds) {
        Map<string,string> conlbl=getConfields();
        
        system.debug('conlbl-->'+conlbl);
        string apinames='';
        for(String idd:conlbl.keyset()){
            idd=idd.substringBefore('~');
            if(idd=='accountid'|| idd=='ownerid')
            {
                apinames+=idd.replace('id', '') +'.name,';
            }
            else
            {
                apinames+=idd +',';
            }
        }
        apinames=apinames.removeEnd(',');
        string query='Select '+apinames+' ,createdby.Name ,createddate,lastmodifiedby.Name,lastmodifieddate from Contact WHERE id IN: conIds';
        List<Contact> conList=new List<Contact>();
        conList=Database.query(query); 
        List<ContactWrapper> conWrap=new List<ContactWrapper>();
        ContactWrapper conObj= new ContactWrapper();
        List<FieldWrapper> fdwrapList=new List<FieldWrapper>();
        FieldWrapper fdObj3= new FieldWrapper();
        fdObj3.labels='Master Record';
        fdObj3.apinames='MasterRecord'; 
        fdObj3.contactValue1='' ;                 
        fdObj3.contactValue2='' ;
        if(conList.size()==3)
        {           
            fdObj3.contactValue3='' ;
        }
        fdwrapList.add(fdObj3);
        FieldWrapper fdObj2= new FieldWrapper();
        fdObj2.labels='Contact Owner';
        fdObj2.apinames='owner.name'; 
        fdObj2.contactValue1=conList[0].owner.name;
        fdObj2.contactValue2=conList[1].owner.name;
        if(conList.size()==3)
        {           
            fdObj2.contactValue3=conList[2].owner.name;
        }
        fdwrapList.add(fdObj2);
        FieldWrapper fdObj1= new FieldWrapper();
        fdObj1.labels='Account Name';
        fdObj1.apinames='account.name'; 
        fdObj1.contactValue1=conList[0].account.name ;
        fdObj1.contactValue2=conList[1].account.name ;
        if(conList.size()==3)
        {           
            fdObj1.contactValue3=conList[2].account.name ;
            //fdObj1.isValue3Selected=false;
        }
        fdwrapList.add(fdObj1);        
        for(String idd:conlbl.keyset())
        {
            string apiid=idd.substringBefore('~');
            FieldWrapper fdObj= new FieldWrapper();
            fdObj.labels=conlbl.get(idd);
            fdObj.apinames=idd; 
            Object cn = conList[0].get(apiid);            
            fdObj.contactValue1=String.valueOf(cn) ;
            Object cn1 = conList[1].get(apiid); 
            fdObj.contactValue2=String.valueOf(cn1) ;
            if(conList.size()==3)
            {
                Object cn2 = conList[2].get(apiid);
                fdObj.contactValue3=String.valueOf(cn2) ;     
            }
            fdwrapList.add(fdObj);
        }
        FieldWrapper fdObj4= new FieldWrapper();
        fdObj4.labels='Created By';
        fdObj4.apinames='createdby.Name,createddate'; 
        fdObj4.contactValue1=conList[0].createdby.Name + ', ' +  conList[0].createddate;
        fdObj4.contactValue2=conList[1].createdby.Name + ', ' +  conList[1].createddate ;
        if(conList.size()==3)
        {           
            fdObj4.contactValue3=conList[2].createdby.Name + ', ' +  conList[2].createddate ;
        }
        fdwrapList.add(fdObj4);
        FieldWrapper fdObj5= new FieldWrapper();
        fdObj5.labels='Last Modified By';
        fdObj5.apinames='lastmodifiedby.Name,lastmodifieddate';
        fdObj5.contactValue1=conList[0].lastmodifiedby.Name   + ', ' +  conList[0].lastmodifieddate;
        fdObj5.contactValue2=conList[1].lastmodifiedby.Name   + ', ' +  conList[1].lastmodifieddate ;
        if(conList.size()==3)
        {           
            fdObj5.contactValue3=conList[2].lastmodifiedby.Name   + ', ' +  conList[2].lastmodifieddate ;
        }
        fdwrapList.add(fdObj5);
        conObj.masterContactId=conList[0].Id ;
        conObj.secondContactId=conList[1].Id;
        if(conList.size()==3)
        { 
            conObj.thirdContactId=conList[2].Id;
        }
        conObj.fieldWrapper= fdwrapList;
        conWrap.add(conObj);
        
        system.debug('conWrap-->'+conWrap);
        return conWrap;
    }
    
    @AuraEnabled
    public static Map<string,string> getConfields()
    {
        String type='Contact';        
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(type);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        //System.debug('fieldMap-->'+fieldMap);
        Map<string,string> conlbl=new Map<string,string>();
        for (String fieldName: fieldMap.keySet()) {
            if(fieldMap.get(fieldName).getDescribe().isUpdateable()) {
                if(!fieldName.contains('longitude') && !fieldName.contains('latitude')  && !fieldName.contains('bounced') && !fieldName.contains('zisf') && !fieldName.contains('clear') )
                {
                    conlbl.put(fieldName + '~' + fieldMap.get(fieldName).getDescribe().getType(),fieldMap.get(fieldName).getDescribe().getLabel());
                }
            }
        }
        return conlbl;
    }
    @AuraEnabled
    public static List<Contact> findSearchContact(String contName,String accId){
        List<Contact> conList = [SELECT Id,contact.AccountId, Name, Email, Phone, Owner.Name From Contact WHERE Name =: contName AND contact.AccountId=:accId];
        System.debug('===153=='+conList);
        return conList;
    }
    
    public class SaveDataWrapper {
        @AuraEnabled public  String labels{get;set;}
        @AuraEnabled public  String values{get;set;}
    }
    @AuraEnabled
    public static Void MergeConData(String masterCon,String chngList,String firstcon,String secondcon,String thirdcon)
    {        
        system.debug('chngList-->'+chngList + '--masterConId-->' +masterCon);
        List<String> arr=chngList.split('},');
        system.debug('lst-->'+arr);
        if(chngList=='')
        {
            //ContactWrapper cw= new ContactWrapper();
            if(firstcon !=masterCon)
            {
                Contact contactResult = [SELECT id FROM Contact WHERE id=:firstcon ];
                delete contactResult;
            }
            if(secondcon !=masterCon)
            {
                Contact contactResult = [SELECT id FROM Contact WHERE id=:secondcon ];
                delete contactResult;
            }
            if(thirdcon != null && thirdcon!=masterCon)
            {
                Contact contactResult = [SELECT id FROM Contact WHERE id=:thirdcon ];
                delete contactResult;
            }
        }
        else
        {      
            List<SaveDataWrapper> svwrapList=new List<SaveDataWrapper>();
            Map<string,string> conlbl=getConfields();
            for(String idd:conlbl.keyset())
            {
                idd=idd.substringBefore('~');
                for(Integer i=0;i<arr.size();i++)
                {
                    //system.debug('lst-->'+arr[i]);
                    string strcomp=arr[i].substringBetween('"label":"','",');
                    string str=strcomp.substringBefore('~');
                    //string type=strcomp.substringAfter('~');
                    string val=arr[i].substringBetween('"value":"','"');
                    SaveDataWrapper svObj= new SaveDataWrapper();
                    SaveDataWrapper svObj1= new SaveDataWrapper();
                    
                    if(str=='MasterRecord')
                    {
                        svObj.labels='Id~ID';
                        svObj.values=masterCon;
                        svwrapList.add(svObj);                        
                    }                    
                    else if(str=='Name')
                    {
                        svObj.labels='FirstName~String';
                        svObj.values=val.substringBefore('#');
                        svwrapList.add(svObj);
                        svObj1.labels='LastName~String';
                        svObj1.values=val.substringAfter('#');
                        svwrapList.add(svObj1);                       
                    }
                    else if(str=='owner.name' || str=='createdby.name,createddate' || str=='lastmodifiedby.name,lastmodifieddate')
                    {
                        
                    }
                    else
                    {
                        svObj.labels=strcomp;
                        svObj.values=val;
                        svwrapList.add(svObj);
                    }                    
                }
            }
            //system.debug('svwrapList-->'+svwrapList);
            Contact c = new Contact();
            for(SaveDataWrapper key : svwrapList) {   
                //system.debug('keyyy-->'+key + '--labels-->' + key.labels + '--val-->'+key.values);
                List<String> splitVal = key.labels.split('~');
                String label = splitVal.get(0);
                String type = splitVal.get(1);
                String val=key.values;
                if(type=='BOOLEAN')
                {
                    c.put(label,Boolean.valueOf(val));
                }
                else if(type== 'NUMBER' || type== 'DECIMAL' || type== 'DOUBLE')
                {
                    if(val=='')
                    {
                        c.put(label,Null);
                    }
                    else
                    {
                        c.put(label,Decimal.valueOf(val));
                    } 
                }
                else if(type== 'DATE')
                {
                    if(val=='')
                    {
                        c.put(label,Null);
                    }
                    else
                    {
                        c.put(label,Date.valueOf(val));
                    }
                }
                else if(type== 'DATETIME')
                {
                    if(val=='')
                    {
                        c.put(label,Null);
                    }
                    else
                    {
                        c.put(label,DateTime.valueOf(val));
                    }
                }
                else
                {
                    c.put(label,val);
                }
            }   
            system.debug('c-->'+c);
            update c;  
            //ContactWrapper cw= new ContactWrapper();
            system.debug('masterContactId -->'+firstcon + '--secondContactId -->'+secondcon + '--thirdContactId -->'+thirdcon );
            if(firstcon!=masterCon)
            {
                Contact contactResult = [SELECT id FROM Contact WHERE id=:firstcon ];
                delete contactResult;
            }
            if(secondcon !=masterCon)
            {
                Contact contactResult = [SELECT id FROM Contact WHERE id=:secondcon ];
                delete contactResult;
            }
            if(thirdcon != null && thirdcon !=masterCon)
            {
                Contact contactResult = [SELECT id FROM Contact WHERE id=:thirdcon];
                delete contactResult;
            }
        }        
    }    
}