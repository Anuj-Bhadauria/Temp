public class BackupAccountTriggerhandler{


/*
 *Description : This class is used by AccountTrigger
 *@author makepositive
 *@date 20 Jan 2016
 */
 /*
public class AccountTriggerHandler {
    //andleBeforeDelete to delete leads when Accounts are deleted
    public static void handleBeforeDelete(Map<Id,Account> oldAccMap) {
        List<Lead> leadListToDelete = [select id,name from Lead where Account__c In : oldAccMap.keySet()];
        if(!leadListToDelete.isEmpty()){
            delete leadListToDelete;
        }
    }
    
    public static void handleAfterUpdate(Map<Id,Account> oldAccMap, Map<Id,Account> newAccMap) {
        Set<Id> accIdSetForReapporachAcc = new Set<Id>();
        Set<Id> accIdSetForPipelineOrCustomers = new Set<Id>();
        
        List<RecordType> recordTypeList = [Select Id,name,developerName From RecordType where sobjecttype = 'Account'];
        String customerRecordTypeId;
        String InPipelineRecordTypeId;
        String prospectRecordTypeId;
        String reapporachRecordTypeId;
        
        for(RecordType recordTypeObj : recordTypeList){
            if(recordTypeObj.developerName == 'Customer'){
                customerRecordTypeId = recordTypeObj.Id;
            }
            if(recordTypeObj.developerName == 'In_Pipeline'){
                InPipelineRecordTypeId = recordTypeObj.Id;
            }
            if(recordTypeObj.developerName == 'Prospect'){
                prospectRecordTypeId = recordTypeObj.Id;
            }
            if(recordTypeObj.developerName == 'Reapporach'){
                reapporachRecordTypeId = recordTypeObj.Id;
            }
        }
        
        for(Account acc : newAccMap.values()){
            Account oldAcc = oldAccMap.get(acc.Id);
            if(acc.RecordTypeId == reapporachRecordTypeId || acc.RecordTypeId == prospectRecordTypeId){
                accIdSetForReapporachAcc.add(acc.Id);
            }
            if(acc.RecordTypeId == InPipelineRecordTypeId || acc.RecordTypeId == customerRecordTypeId){          
                accIdSetForPipelineOrCustomers.add(acc.Id);
            }
        }
        
        //Call convertContactsToLead method if accIdSetForReapporachAcc is not empty
        if(!accIdSetForReapporachAcc.isEmpty()){
            convertContactsToLead(accIdSetForReapporachAcc);
        }
        
        //Call convertLeadsToContacts method if accIdSetForPipelineOrCustomers is not empty
        if(!accIdSetForPipelineOrCustomers.isEmpty()){
            convertLeadsToContacts(accIdSetForPipelineOrCustomers);
        }
    }
    
    private static void convertContactsToLead(Set<Id> accIdSetForReapporachAcc){
        List<Contact> contactListToDelete = new List<Contact>();
        List<Lead> leadListToInsert = new List<Lead>();
        Set<Id> contactIdSet = new Set<Id>();
        Map<Id,Lead>contactIdLeadObjMap = new Map<Id,Lead>();
        
        List<Account> accListForReapporachAcc = [select id,name,(select id,Salutation,FirstName,LastName,AccountId,Title,Phone,MobilePhone,Email_failure__c,HasOptedOutOfEmail
                                        ,Email,MailingStreet,MailingCity,MailingState,MailingCountry,MailingPostalCode,LeadSource,LID__LinkedIn_Company_Id__c
                                        ,LID__LinkedIn_Member_Token__c from Contacts) 
                                        ,(select id,name,Next_Follow_Up_Date__c,Reason_for_loss__c,Other_Reason_For_Loss__c,LastModifiedDate from Opportunities 
                                        where StageName = 'Closed Lost' order by LastModifiedDate desc)
                                        from Account where Id In : accIdSetForReapporachAcc];
        
        
        for(Account acc : accListForReapporachAcc){
            for(Contact contactObj : acc.Contacts){
                contactIdSet.add(contactObj.Id);
            }
        }
        
        
        List<Task> taskList = [select Id,CurrencyIsoCode,AccountId,ActivityDate,CallDisposition,CallDurationInSeconds,CallObject,CallType,Description,IsArchived,IsClosed,IsHighPriority
                                ,ReminderDateTime,Status,Subject,TaskSubtype,Type,WhatId,WhoId from Task where whoId In: contactIdSet];
        
        List<Event> eventList = [select Id,CurrencyIsoCode,AccountId,ActivityDate,ActivityDateTime,Description,DurationInMinutes,EndDateTime,EventSubtype
                                ,StartDateTime,Subject,Type,WhatId,WhoId from Event where whoId In: contactIdSet AND ActivityDateTime != null];
        
        
        for(Account acc : accListForReapporachAcc){
            String reasonForLoss;
            Date nextFollowUpDate;
            if(!acc.Opportunities.isEmpty()){
                Opportunity opp = acc.Opportunities[0];
                nextFollowUpDate = opp.Next_Follow_Up_Date__c;
                if(opp.Reason_for_loss__c != null && opp.Reason_for_loss__c == 'Other'){
                    reasonForLoss = opp.Other_Reason_For_Loss__c;
                }
                else{
                    reasonForLoss = opp.Reason_for_loss__c;
                }
            }
            else{
                reasonForLoss = 'Unknown';
                nextFollowUpDate = System.today().addMonths(6);
            }
            
            for(Contact contactObj : acc.Contacts){
                contactListToDelete.add(contactObj);
                
                Lead leadObj = new Lead(
                                    Salutation = contactObj.Salutation,
                                    FirstName = contactObj.FirstName,
                                    LastName = contactObj.LastName,
                                    Account__c = contactObj.AccountId,
                                    Title = contactObj.Title,
                                    Phone = contactObj.Phone,
                                    MobilePhone = contactObj.MobilePhone,
                                    Email_failure__c = contactObj.Email_failure__c,
                                    HasOptedOutOfEmail = contactObj.HasOptedOutOfEmail,
                                    Email = contactObj.Email,
                                    Street = contactObj.MailingStreet,
                                    City = contactObj.MailingCity,
                                    State = contactObj.MailingState,
                                    Country = contactObj.MailingCountry,
                                    PostalCode = contactObj.MailingPostalCode,
                                    Status = 'Unqualified',
                                    LeadSource = contactObj.LeadSource,
                                    LID__LinkedIn_Company_Id__c = contactObj.LID__LinkedIn_Company_Id__c,
                                    LID__LinkedIn_Member_Token__c = contactObj.LID__LinkedIn_Member_Token__c,
                                    Disqualification_Reason__c = reasonForLoss,
                                    Next_Follow_Up_Date__c = nextFollowUpDate
                                );
                                
                contactIdLeadObjMap.put(contactObj.Id,leadObj);             
                leadListToInsert.add(leadObj);
            }  
            
        }
        
        //Insert leadListToInsert if it is not empty
        if(!leadListToInsert.isEmpty()){
            //insert leadListToInsert;
            Database.insert(leadListToInsert,false);
        }
        
        List<Task> taskListToUpdate = new List<Task>();
        List<Event> eventListToUpdate = new List<Event>();
        
        for(Task taskObj : taskList){
            String contactId = taskObj.whoId;
            Lead LeadObj = contactIdLeadObjMap.get(contactId);
            if(LeadObj != null && LeadObj.Id != null){
                Task taskObjNew = new Task(Id = taskObj.Id,whoId = LeadObj.Id,whatID = null);
                taskListToUpdate.add(taskObjNew);
            }
        }
        
        for(Event eventObj : eventList){
            String contactId = eventObj.whoId;
            Lead LeadObj = contactIdLeadObjMap.get(contactId);
            if(LeadObj != null && LeadObj.Id != null){
                Event eventObjNew = new Event(Id = eventObj.Id,whoId = LeadObj.Id,whatID = null);
                eventListToUpdate.add(eventObjNew);
            }
        }
        
        if(!taskListToUpdate.isEmpty()){
            //update taskListToUpdate;
            //Database.update(taskListToUpdate,false);
            update taskListToUpdate;
        }
        
        //Insert eventListToInsert if it is not empty
        if(!eventListToUpdate.isEmpty()){
            //update eventListToUpdate;
            //Database.update(eventListToUpdate,false);
            update eventListToUpdate;
        }
        
        //Delete contactListToDelete if it is not empty
        if(!contactListToDelete.isEmpty()){
            delete contactListToDelete;
        }
    }  
    
    public static void convertLeadsToContacts(Set<Id> accIdSetForLeadToContacts){
        List<Lead> leadListToDelete = new List<Lead>();
        List<Contact> contactListToInsert = new List<Contact>();
        Set<Id> leadIdSet = new Set<Id>();
        Map<Id,Contact> leadIdContactObjMap = new Map<Id,Contact>();
        Map<Id,Id> leadIdAccountIdMap = new Map<Id,Id>();
        
        List<Account> accListForPipelineOrProspects = [select id,name,(select id,Salutation,FirstName,LastName,Account__c,Title,Phone,MobilePhone,Email_failure__c,HasOptedOutOfEmail
                                        ,Email,Street,City,State,Country,PostalCode,LeadSource,LID__LinkedIn_Company_Id__c
                                        ,LID__LinkedIn_Member_Token__c from Leads__r where IsConverted = false) 
                                        from Account where Id In : accIdSetForLeadToContacts];
        
        for(Account acc : accListForPipelineOrProspects){
            for(Lead leadObj : acc.Leads__r){
                leadIdSet.add(leadObj.Id);
            }
        }
        
        List<Task> taskList = [select Id,CurrencyIsoCode,AccountId,ActivityDate,CallDisposition,CallDurationInSeconds,CallObject,CallType,Description,IsArchived,IsClosed,IsHighPriority
                            ,ReminderDateTime,Status,Subject,TaskSubtype,Type,WhatId,WhoId from Task where whoId In: leadIdSet];
        
        List<Event> eventList = [select Id,CurrencyIsoCode,AccountId,ActivityDate,ActivityDateTime,Description,DurationInMinutes,EndDateTime,EventSubtype
                            ,StartDateTime,Subject,Type,WhatId,WhoId from Event where whoId In: leadIdSet AND ActivityDateTime != null];
        
        for(Account acc : accListForPipelineOrProspects){
            for(Lead leadObj : acc.Leads__r){
                leadListToDelete.add(leadObj);
                leadIdAccountIdMap.put(leadObj.Id,acc.Id);
                
                Contact contactObj = new Contact(
                                    Salutation = leadObj.Salutation,
                                    FirstName = leadObj.FirstName,
                                    LastName = leadObj.LastName,
                                    AccountId = leadObj.Account__c,
                                    Title = leadObj.Title,
                                    Phone = leadObj.Phone,
                                    MobilePhone = leadObj.MobilePhone,
                                    Email_failure__c = leadObj.Email_failure__c,
                                    HasOptedOutOfEmail = leadObj.HasOptedOutOfEmail,
                                    Email = leadObj.Email,
                                    MailingStreet = leadObj.Street,
                                    MailingCity = leadObj.City,
                                    MailingState = leadObj.State,
                                    MailingCountry = leadObj.Country,
                                    MailingPostalCode = leadObj.PostalCode,
                                    LeadSource = leadObj.LeadSource,
                                    LID__LinkedIn_Company_Id__c = leadObj.LID__LinkedIn_Company_Id__c,
                                    LID__LinkedIn_Member_Token__c = leadObj.LID__LinkedIn_Member_Token__c
                                );
                
                leadIdContactObjMap.put(leadObj.Id,contactObj);    
                contactListToInsert.add(contactObj);
            }           
        }
        
        //Insert contactListToInsert if it is not empty
        if(!contactListToInsert.isEmpty()){
            //insert contactListToInsert;
            Database.insert(contactListToInsert,false);
        }
        
        List<Task> taskListToUpdate = new List<Task>();
        List<Event> eventListToUpdate = new List<Event>();
        
        for(Task taskObj : taskList){
            String leadId = taskObj.whoId;
            Contact contactObj = leadIdContactObjMap.get(leadId);
            String accountId = leadIdAccountIdMap.get(leadId);
            if(contactObj != null && contactObj.Id != null){
                Task taskObjNew = new Task(Id = taskObj.Id,whoId = contactObj.Id,whatID = accountId);
                taskListToUpdate.add(taskObjNew);
            }
        }
        
        for(Event eventObj : eventList){
            String leadId = eventObj.whoId;
            Contact contactObj = leadIdContactObjMap.get(leadId);
            String accountId = leadIdAccountIdMap.get(leadId);
            if(contactObj != null && contactObj.Id != null){
                Event eventObjNew = new Event(Id = eventObj.Id,whoId = contactObj.Id,whatID = accountId);
                eventListToUpdate.add(eventObjNew);
            }
        }
        
        if(!taskListToUpdate.isEmpty()){
            //update taskListToUpdate;
            //Database.update(taskListToUpdate,false);
            update taskListToUpdate;
        }
        
        //Insert eventListToInsert if it is not empty
        if(!eventListToUpdate.isEmpty()){
            //update eventListToUpdate;
            //Database.update(eventListToUpdate,false);
            update eventListToUpdate;
        }
        
        //Delete leadListToDelete if it is not empty
        if(!leadListToDelete.isEmpty()){
            delete leadListToDelete;
        }
    } 
}
*/
}