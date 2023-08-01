public class Backup {

    
/*
   
                
                 *Description : This class is used by OrderTrigger
                 *@Anuj Bhadauria
                 *@date 04 April 2017
                 
                public class OrderTriggerHandler {
                
                    public static void handleBeforeInsert(List<Order> orderList) {
                        Default_Order_Owner__c lstSettng = Default_Order_Owner__c.getInstance('Default Order Owner');// By Instance(you have to pass a 'Name' field value in that instance method) method you can get any value of field of that custom setting
                        for(Order o : orderList){
                            if(lstSettng !=null && lstSettng.Owner_Id__c != null){
                                o.OwnerId = lstSettng.Owner_Id__c;
                            }
                        } 
                    }
                }
   ****************************************** TEST CLASS *****************************************
                
                 * @author: Anuj Bhadauria | makepositive
                 * @date: 4 April 2017
                 * @description: Test class for the order (Default Order Owner Name)
                 
                @isTest
                private class TestOrderTriggerHandler {
                    static testMethod void testDefaultOwnerName(){
                        
                        Test.startTest();
                        
                            Account a = new Account();
                            a.Name = 'Test Account';
                            insert a;
                            
                            Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
                            
                            User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
                            EmailEncodingKey='UTF-8', LastName='Testing123', LanguageLocaleKey='en_US', 
                            LocaleSidKey='en_US', ProfileId = p.Id, 
                            TimeZoneSidKey='America/Los_Angeles', UserName='standardusertest321@testorg.com');
                            insert u;
                        
                            Default_Order_Owner__c don = new Default_Order_Owner__c();
                            don.Name='Default Order Owner';
                            don.Owner_Id__c = u.id;
                            insert don;
                            
                            List<Order> orders = new List<Order>();
                            for(Integer i=0;i<10;i++){
                                Order o = new Order();
                                o.AccountId = a.id;
                                o.EffectiveDate = System.today();
                                o.CurrencyIsoCode = 'GBP';
                                o.Status = 'Not Started';
                                //o.OwnerId = don.Owner_Id__c;
                                orders.add(o);
                            }
                            insert orders;
                            
                        Test.stopTest();
                       
                        
                    }
                }
                
 <-------------------------------------------------------------------------------------------------------------------------------------->
                 
                     * @author: Anuj Bhadauria | makepositive
                     * @date: 07 April 2017
                     * @description: Class to show all Activities on Account detail page for Account,Contact and Lead together.
                     
                    public class ActivitiesLeadContactController {
                    
                        public final Account acct {get;set;}
                        public List<WrappperActivities> wrapList {get;set;}
                        public List<WrappperActivities> wrapListHistory {get;set;}
                        public String deleteActivityId {get;set;}
                        
                        public ActivitiesLeadContactController(ApexPages.StandardController controller) {
                            this.acct = (Account)controller.getRecord();
                            Id accId = acct.Id;       
                            
                            //Open Activities:       
                            wrapList = new List<WrappperActivities>();
                            Integer counter = 1;
                            
                            wrapListHistory = new List<WrappperActivities>();
                            Integer counterHis = 1;
                            
                            for(Account acc:[ Select Name,(Select What.Name , whoId, Who.Name, WhatId, IsTask, subject, status, priority, ActivityDate, Account.Name From OpenActivities) from Account where Id =:accId ])    
                            {      
                                if(!acc.OpenActivities.isempty()){       
                                    for(OpenActivity opnAct: acc.OpenActivities) { // If there are multiple Tasks and Events this loop will take care of that.     
                                        wrapList.add(new WrappperActivities (opnAct,counter,acc.Name,opnAct.id));
                                        counter++;
                                    }        
                                }       
                            }
                            
                            
                            for(Lead ld:[ Select Name,(Select What.Name , whoId, Who.Name, WhatId, IsTask, subject, status, priority, ActivityDate, Account.Name From OpenActivities) from Lead where Account__c=:accId ])    
                            {      
                                if(!ld.OpenActivities.isempty()){       
                                    for(OpenActivity opnAct: ld.OpenActivities) { // If there are multiple Tasks and Events this loop will take care of that.     
                                        wrapList.add(new WrappperActivities (opnAct,counter,ld.Name,opnAct.id));
                                        counter++;
                                    }        
                                }       
                            }                  
                           
                            //Activity History:      
                            
                            for(Account acc:[ Select Name,(Select What.Name , whoId, Who.Name, WhatId, IsTask, subject, status, priority, ActivityDate, Account.Name From ActivityHistories) from Account where Id =:accId ])    
                            {      
                                if(!acc.ActivityHistories.isempty()){       
                                    for(ActivityHistory actHis: acc.ActivityHistories) { // If there are multiple Tasks and Events this loop will take care of that.     
                                        wrapListHistory.add(new WrappperActivities (actHis,counterHis,acc.Name,actHis.id));
                                        counterHis++;
                                    }        
                                }       
                            }
                            
                            for(Lead ld:[ Select Name,(Select What.Name , whoId, Who.Name, WhatId, IsTask, subject, status, priority, ActivityDate, Account.Name From ActivityHistories) from Lead where Account__c=:accId ])    
                            {      
                                if(!ld.ActivityHistories.isempty()){       
                                    for(ActivityHistory actHis: ld.ActivityHistories) { // If there are multiple Tasks and Events this loop will take care of that.     
                                        wrapListHistory.add(new WrappperActivities (actHis,counterHis,ld.Name,actHis.id));
                                        counterHis++;
                                    }        
                                }       
                            }                       
                        }
                        
                        public PageReference DelActHistory(){     
                            if(deleteActivityId != null && deleteActivityId.startsWith('00T')){
                                Task ts = new Task(id=deleteActivityId); 
                                Delete ts;
                            }
                            else{
                                Event eve = new Event(id=deleteActivityId);
                                Delete eve;
                            }         
                            
                            PageReference pageRef = new PageReference('/'+acct.id);
                            pageRef.setRedirect(true);     
                            return pageRef;  
                        }  
                    
                        
                        public class WrappperActivities {
                            public Sobject activity {get;set;}   // Store complete object Task And Event                
                            public Integer numberOfRow {get; set;} // Row counter variable
                            public String recName {get; set;} // Record Name 
                            public Id RecId {get; set;}  // Record Id
                            
                            public WrappperActivities(Sobject act,Integer rowCounter,String name,Id delId){             
                                activity = act;
                                numberOfRow = rowCounter;
                                recName = name;
                                RecId = delId;
                            }
                        }            
                    } 
                    
                    
   ****************************************TEST CLASS************************************************************                                
                
                        
                         * @author: Anuj Bhadauria | makepositive
                         * @date: 07 April 2017
                         * @description: Test class for the Open Activities and Activity History.
                         
                        @isTest (SeeAllData = True)
                        public class ActivitiesLeadContactControllerTestClass 
                        {  
                        
                            //This Method will cover Open Activities for Account and Contact
                            static testMethod void testActivitiesLeadContactController() {
                            
                                Test.StartTest();
                                     
                                    Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
                                    
                                    User u = new User(Alias = 'standerd', Email='standarduser312@testorg.com', 
                                    EmailEncodingKey='UTF-8', LastName='Testing312', LanguageLocaleKey='en_US', 
                                    LocaleSidKey='en_US', ProfileId = p.Id, 
                                    TimeZoneSidKey='America/Los_Angeles', UserName='standarduser212@testorg.com');
                                    insert u;
                                              
                                    //Create new account
                                    Account accObj = TestUtility.createAccount(null);            
                                    
                                    //Create Contact
                                    Contact con = TestUtility.createContact(accObj.id);
                                    
                                    //Create new Task
                                    Task tsk = TestUtility.createTask1(con.id,accObj.id);          
                                    
                                    //Create new Event
                                    Event eve = TestUtility.createEvent(con.id);             
                                                    
                                    PageReference pageRef = Page.ActivitiesLeadContact;            
                                    Test.setCurrentPage(pageRef); 
                                    
                                    ActivitiesLeadContactController testAccPlan = new ActivitiesLeadContactController(new ApexPages.StandardController(accObj));
                                    testAccPlan.deleteActivityId  =  tsk.id; // to cover PageReference Method
                                    testAccPlan.DelActHistory();       
                                       
                                Test.StopTest();
                            }
                              
                            //This Method will cover Open Activities for lead
                            static testMethod void testActivitiesLeadContactController1() {
                            
                                Test.StartTest();
                                     
                                    Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
                                    
                                    User u = new User(Alias = 'standerd', Email='standarduser312@testorg.com', 
                                    EmailEncodingKey='UTF-8', LastName='Testing312', LanguageLocaleKey='en_US', 
                                    LocaleSidKey='en_US', ProfileId = p.Id, 
                                    TimeZoneSidKey='America/Los_Angeles', UserName='standarduser212@testorg.com');
                                    insert u;
                                              
                                    //Create new account
                                    Account accObj = TestUtility.createAccount(null);            
                                    
                                    //Create new Lead
                                    Lead ld = TestUtility.createLead(false);           
                                    ld.Account__c = accObj.id;
                                    insert ld; 
                                    
                                    //Create new Task
                                    Task tsk = TestUtility.createTask1(ld.id,null);          
                                    
                                    //Create new Event
                                    Event eve = TestUtility.createEvent(ld.id);             
                                                    
                                    PageReference pageRef = Page.ActivitiesLeadContact;            
                                    Test.setCurrentPage(pageRef); 
                                    
                                    ActivitiesLeadContactController testAccPlan = new ActivitiesLeadContactController(new ApexPages.StandardController(accObj));
                                    testAccPlan.deleteActivityId  =  tsk.id; // to cover PageReference Method
                                    testAccPlan.DelActHistory();       
                                       
                                Test.StopTest();
                             }
                            
                            
                            //This Method will cover Activity History for Account and Contact
                            static testMethod void testActivitiesLeadContactController2() {
                            
                                Test.StartTest();
                                     
                                    Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
                                    
                                    User u = new User(Alias = 'standerd', Email='standarduser312@testorg.com', 
                                    EmailEncodingKey='UTF-8', LastName='Testing312', LanguageLocaleKey='en_US', 
                                    LocaleSidKey='en_US', ProfileId = p.Id, 
                                    TimeZoneSidKey='America/Los_Angeles', UserName='standarduser212@testorg.com');
                                    insert u;
                                              
                                    //Create new account
                                    Account accObj = TestUtility.createAccount(null);            
                                    
                                    //Create Contact
                                    Contact con = TestUtility.createContact(accObj.id);
                                    
                                    //Create new Task
                                    Task tsk = TestUtility.createTask2(con.id,accObj.id);          
                                    
                                    //Create new Event
                                    Event eve = TestUtility.createEvent(con.id);             
                                                    
                                    PageReference pageRef = Page.ActivitiesLeadContact;            
                                    Test.setCurrentPage(pageRef); 
                                    
                                    ActivitiesLeadContactController testAccPlan = new ActivitiesLeadContactController(new ApexPages.StandardController(accObj));
                                    testAccPlan.deleteActivityId  =  eve.id; // to cover PageReference Method
                                    testAccPlan.DelActHistory();       
                                       
                                Test.StopTest();
                            }  
                            
                            //This Method will cover Activity History for lead
                            static testMethod void testActivitiesLeadContactController3() {
                            
                                Test.StartTest();
                                     
                                    Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
                                    
                                    User u = new User(Alias = 'standerd', Email='standarduser312@testorg.com', 
                                    EmailEncodingKey='UTF-8', LastName='Testing312', LanguageLocaleKey='en_US', 
                                    LocaleSidKey='en_US', ProfileId = p.Id, 
                                    TimeZoneSidKey='America/Los_Angeles', UserName='standarduser212@testorg.com');
                                    insert u;
                                              
                                    //Create new account
                                    Account accObj = TestUtility.createAccount(null);            
                                    
                                    //Create new Lead
                                    Lead ld = TestUtility.createLead(false);           
                                    ld.Account__c = accObj.id;
                                    insert ld; 
                                    
                                    //Create new Task
                                    Task tsk = TestUtility.createTask2(ld.id,null);          
                                    
                                    //Create new Event
                                    Event eve = TestUtility.createEvent(ld.id);             
                                                    
                                    PageReference pageRef = Page.ActivitiesLeadContact;            
                                    Test.setCurrentPage(pageRef); 
                                    
                                    ActivitiesLeadContactController testAccPlan = new ActivitiesLeadContactController(new ApexPages.StandardController(accObj));
                                    testAccPlan.deleteActivityId  =  eve.id; // to cover PageReference Method
                                    testAccPlan.DelActHistory();       
                                       
                                Test.StopTest();
                            }
                        }
     ****************************************VISUALFORCE PAGE******************************************************
                     <apex:page standardController="Account" extensions="ActivitiesLeadContactController" docType="html-5.0">

                        <style type="text/css">
                            .Mylinks
                            {
                                //color:#4682b4;
                                //color: #0000FF;
                                color:#3883c1
                            }
                        </style>
                        <Script>    
                            function confirmDelete(){    //it is called by an delete link or button and show alert with ok and cancel button if press ok then it redirects to a method in controller.
                                if(confirm('Are you sure?'))
                                    return true;
                                    return false;
                            }          
                        </Script>
                        <apex:form >
                            <apex:pageBlock title="Open Activities">
                                <apex:pageBlockTable value="{!wrapList}" var="wrapOpenAct" rendered="{!NOT(wrapList.empty)}">
                                    <apex:column >
                                        <apex:facet name="header">Action</apex:facet>
                                        <apex:outputPanel rendered="{!wrapOpenAct.activity['isTask']}">  
                                            <div ><a class="Mylinks" href="/{!wrapOpenAct.activity['id']}/e?retURL=%2F{!acct.id}" title="Edit - Record - {!wrapOpenAct.numberOfRow} - {!wrapOpenAct.recName}" style="cursor: pointer" target="_top">Edit</a> | <apex:outputLink title="Close - Record - {!wrapOpenAct.numberOfRow} - {!wrapOpenAct.recName}" value="/{!wrapOpenAct.activity['id']}/e?close=1&retURL=%2F{!acct.id}" style="cursor: pointer" target="_top">cls</apex:outputLink></div>
                                        </apex:outputPanel> 
                                        <apex:outputPanel rendered="{!!wrapOpenAct.activity['isTask']}">  
                                            <div class="Mylinks"><apex:outputLink title="Edit - Record - {!wrapOpenAct.numberOfRow} - {!wrapOpenAct.recName}" value="/{!wrapOpenAct.activity['id']}/e?retURL=%2F{!acct.id}" style="cursor: pointer" target="_top">Edit</apex:outputLink> | <apex:commandLink title="Delete - Record - {!wrapOpenAct.numberOfRow} - {!wrapOpenAct.recName}" value="Del" onclick="return confirm('Are you sure?')" action="{!DelActHistory}" style="cursor: pointer" target="_top"><apex:param name="removeMemberId" value="{!wrapOpenAct.RecId}" assignTo="{!deleteActivityId}" /></apex:commandLink></div>
                                        </apex:outputPanel>                                          
                                    </apex:column>
                                    <apex:column value="{!wrapOpenAct.activity['subject']}"/>
                                    <apex:column value="{!wrapOpenAct.activity['WhoId']}"/>
                                    <apex:column value="{!wrapOpenAct.activity['WhatId']}"/>
                                    <apex:column value="{!wrapOpenAct.activity['IsTask']}"/>
                                    <apex:column value="{!wrapOpenAct.activity['ActivityDate']}"/>
                                    <apex:column value="{!wrapOpenAct.activity['Status']}"/>
                                    <apex:column value="{!wrapOpenAct.activity['Priority']}"/>
                                </apex:pageBlockTable>       
                            </apex:pageBlock>
                            
                            <apex:pageBlock title="Activity History">
                                <apex:pageblockbuttons location="top">
                                    <apex:commandButton value="Log a Call"  onclick="window.top.location='/00T/e?title=Call&what_id={!acct.id}&followup=1&tsk5=Call&retURL=%2F{!acct.id}'; return False">          
                                    </apex:commandButton>
                                    <apex:commandButton value="Send an Email" onclick="window.top.location='/_ui/core/email/author/EmailAuthor?p3_lkid={!acct.id}&retURL=%2F{!acct.id}'; return False"/>
                                </apex:pageblockbuttons>
                                <apex:pageBlockTable value="{!wrapListHistory}" var="wrapOpenActHistory"  rendered="{!NOT(wrapListHistory.empty)}">  
                                    <apex:column >
                                        <apex:facet name="header">Action</apex:facet>  
                                        <div class="Mylinks"><apex:outputLink title="Edit - Record - {!wrapOpenActHistory.numberOfRow} - {!wrapOpenActHistory.recName}" value="/{!wrapOpenActHistory.activity['id']}/e?retURL=%2F{!acct.id}" style="cursor: pointer" target="_top">Edit</apex:outputLink> | <apex:commandLink title="Delete - Record - {!wrapOpenActHistory.numberOfRow} - {!wrapOpenActHistory.recName}" value="Del" onclick="return confirm('Are you sure?')" action="{!DelActHistory}" style="cursor: pointer" target="_top"><apex:param name="removeMemberId" value="{!wrapOpenActHistory.RecId}" assignTo="{!deleteActivityId}" /></apex:commandLink></div>                                                                         
                                    </apex:column>
                                    <apex:column value="{!wrapOpenActHistory.activity['subject']}"/>
                                    <apex:column value="{!wrapOpenActHistory.activity['WhoId']}"/>
                                    <apex:column value="{!wrapOpenActHistory.activity['WhatId']}"/>
                                    <apex:column value="{!wrapOpenActHistory.activity['IsTask']}"/>
                                    <apex:column value="{!wrapOpenActHistory.activity['ActivityDate']}"/>
                                    <apex:column value="{!wrapOpenActHistory.activity['Status']}"/>
                                    <apex:column value="{!wrapOpenActHistory.activity['Priority']}"/>
                                </apex:pageBlockTable>
                            </apex:pageBlock>
                            
                        </apex:form>
                        </apex:page>                  
     ****************************************TEST UTILITY CLASS****************************************************
                             
                            * TestUtility - Utility class for all Test Classes
                            *
                            * @Author makepositive
                            * @Created 11/01/2017
                            
                            @isTest
                            public with sharing class TestUtility {
                                
                                
                                * Method Name   : createAccount
                                * Description   : create Campaign for test Classes
                                * @param        : None
                                * @returns      : Campaign
                                
                                public static Campaign createCampaign(){
                                    //Create new campaign
                                    Campaign newCampaign = new Campaign(
                                                                        Name = 'Test Campaign',
                                                                        IsActive = true,
                                                                        Status = 'Planned',
                                                                        StartDate = System.today(),
                                                                        Type = 'Conference'
                                                                    );
                                                        
                                    insert newCampaign;
                                    
                                    return newCampaign;
                                }
                                
                                
                                * Method Name   : createContact
                                * Description   : create Contact for Test Class
                                * @param        : id accountId
                                * @returns      : Contact
                                 
                                public static Contact createContact(id accountId){
                                    Contact newContact = new Contact(
                                                                    FirstName = generateRandomString(10),
                                                                    Phone = '+91-9999999999', 
                                                                    Email = 'test@test.com',
                                                                    LastName = generateRandomString(10),
                                                                    AccountId = accountId,
                                                                    MailingStreet = '139 Gunnersbury Avenue',
                                                                    MailingCity = 'London',
                                                                    MailingCountry = 'United Kingdom',
                                                                    Region__c = 'UK'
                                                            );
                                    insert newContact;
                                    return newContact;
                                }
                                
                                
                                * Method Name   : createContacts
                                * Description   : create Contact for Test Class
                                * @param        : id accountId,Integer count
                                * @returns      : List<Contact>
                                 
                                public static List<Contact> createContacts(id accountId,Integer count){
                                    List<Contact> newContactList = new List<Contact>();
                                    for(Integer i=1;i<=count;i++){
                                        Contact newContact = new Contact(
                                                                        FirstName = generateRandomString(10)+i,
                                                                        Phone = '+91-9999999999', 
                                                                        Email = 'test@test.com',
                                                                        LastName = generateRandomString(10)+i,
                                                                        AccountId = accountId,
                                                                        MailingStreet = '139 Gunnersbury Avenue',
                                                                        MailingCity = 'London',
                                                                        MailingCountry = 'United Kingdom',
                                                                        Region__c = 'UK'
                                                                );
                                        newContactList.add(newContact);
                                    }
                                    
                                    if(!newContactList.isEmpty()){
                                        insert newContactList;
                                    }
                                    return newContactList;
                                }
                                
                                
                                * Method Name   : createAccount
                                * Description   : create Account for test Classes
                                * @param        : leadContactId
                                * @returns      : Account
                                
                                public static Account createAccount(Id leadContactId){
                                    Account newAccount = new Account(
                                                                    name = generateRandomString(5),
                                                                    Type = 'Partner',
                                                                    Status__c = 'Not Approached',
                                                                    Region__c = 'UK',
                                                                    Lead_Contact__c = leadContactId,
                                                                    BillingCity = 'London',
                                                                    BillingCountry = 'United Kingdom',
                                                                    BillingStreet = '139 Gunnersbury Avenue'
                                                                );
                                    insert newAccount;
                                    return newAccount;
                                }
                                
                                
                                * Method Name   : createAccounts
                                * Description   : create Accounts for test Classes
                                * @param        : Integer count
                                * @returns      : List<Account>
                                 
                                public static List<Account> createAccounts(Integer count){
                                    List<Account> newAccountList = new List<Account>();
                                    for(Integer i=1;i<=count;i++){
                                        Account newAccount = new Account(
                                                                    name = 'Test Account'+i,
                                                                    Type = 'Partner',
                                                                    Status__c = 'Not Approached',
                                                                    Region__c = 'UK',
                                                                    BillingCity = 'London',
                                                                    BillingCountry = 'United Kingdom',
                                                                    BillingStreet = '139 Gunnersbury Avenue',
                                                                    Orientation__c = 'BI; IBINT; INT; OTH',
                                                                    Curriculum_New__c ='British; Australian; German; French'
                                                                );
                                                                
                                        newAccountList.add(newAccount);
                                    }
                                    
                                    if(!newAccountList.isEmpty()){
                                        insert newAccountList;
                                    }
                                    return newAccountList;
                                }
                                
                                
                                * Method Name   : createOpportunity
                                * Description   : create Opportunity for test Classes
                                * @param        : accountId, stageName
                                * @returns      : Opportunity
                                 
                                public static Opportunity createOpportunity(Id accountId,String stageName,String campaignId){
                                    Opportunity newOpportunity = new Opportunity(
                                                                                name = 'test Opportunity',
                                                                                StageName = stageName,
                                                                                Type = 'New',
                                                                                accountId = accountId,
                                                                                Initial_Date__c = System.today(),
                                                                                CloseDate = System.today().addYears(2),
                                                                                Budget__c = '1',
                                                                                Need__c = '1',
                                                                                Fit__c = '1',
                                                                                Authority__c = '1',
                                                                                Time__c = '1',
                                                                                Subscription_Start_Date__c = System.today(),
                                                                                Contract_Length__c = 24,
                                                                                CampaignId = campaignId,
                                                                                Competitor__c = 'Naviance',
                                                                                Reason_To_Buy__c = 'Performance',
                                                                                No_of_Lower_6th_Students__c = 40,
                                                                                No_of_Middle_Years_Students__c =10
                                                                );
                                    insert newOpportunity;
                                    return newOpportunity;
                                }
                                
                                
                                * Method Name   : createOpportunities
                                * Description   : create Opportunity for test Classes
                                * @param        : accountId, stageName, count
                                * @returns      : List<Opportunity>
                                 
                                public static List<Opportunity> createOpportunities(Id accountId,String stageName,Integer count,String campaignId){
                                    List<Opportunity> newOpportunities = new List<Opportunity>();
                                    
                                    for(Integer i=1;i<=count;i++){
                                        Opportunity newOpportunity = new Opportunity(
                                                                                    name = 'test Opportunity'+i,
                                                                                    StageName = stageName,
                                                                                    Type = 'New',
                                                                                    accountId = accountId,
                                                                                    Initial_Date__c = System.today(),
                                                                                    CloseDate = System.today().addYears(2),
                                                                                    Budget__c = '1',
                                                                                    Need__c = '1',
                                                                                    Fit__c = '1',
                                                                                    Authority__c = '1',
                                                                                    Time__c = '1',
                                                                                    Subscription_Start_Date__c = System.today(),
                                                                                    Contract_Length__c = 24,
                                                                                    CampaignId = campaignId,
                                                                                    Competitor__c = 'Naviance',
                                                                                    Reason_To_Buy__c = 'Performance',
                                                                                    No_of_Lower_6th_Students__c = 40,
                                                                                    No_of_Middle_Years_Students__c =10
                                                                    );
                                        newOpportunities.add(newOpportunity);
                                    }
                                    
                                    if(!newOpportunities.isEmpty()){
                                        insert newOpportunities;
                                    }
                                    
                                    return newOpportunities;
                                }
                                
                                
                                * Method Name   : createLead
                                * Description   : create Lead for test Classes
                                * @param        : Boolean isInsert
                                * @returns      : Lead
                                 
                                public static Lead createLead(Boolean isInsert){
                                    Lead newLead = new Lead(
                                                            LastName = 'Test',
                                                            Status = 'Open',
                                                            Country = 'United Kningdom',
                                                            City = 'London'
                                                   );
                                                   
                                    if(isInsert){
                                        insert newLead;
                                    }
                                    return newLead;
                                }
                                
                                
                                * Method Name   : createProducts
                                * Description   : create products for test Classes
                                * @param        : Integer count of number of products to Insert
                                * @returns      : List<Product2>
                                 
                                public static List<Product2> createProducts(Integer count){
                                    List<Product2> newProducts = new List<Product2>();
                                    for(Integer i=1;i<=count;i++){
                                        Product2 newProduct = new Product2(
                                                                Name = 'Test Product'+i,
                                                                ProductCode = 'Pro'+i,
                                                                Description = 'Test Description'+i,
                                                                IsActive = true
                                                       );
                                                       
                                        newProducts.add(newProduct);
                                    }
                                    
                                    if(!newProducts.isEmpty()){
                                        insert newProducts;
                                    }
                                  
                                    return newProducts;
                                }
                                
                                
                                * Method Name   : createPriceBookEntries
                                * Description   : create PricebookEntry for test Classes
                                * @param        : List<Product2> productList,Id pricebookId
                                * @returns      : List<PricebookEntry>
                                 
                                public static List<PricebookEntry> createPriceBookEntries(List<Product2> productList,Id pricebookId){
                                    List<PricebookEntry> priceBookEntryToInsert = new List<PricebookEntry>();
                                    
                                    for(Product2 prod : productList){
                                        //Create your pricebook entry
                                        PricebookEntry pbEntry = new PricebookEntry(
                                                                     Pricebook2Id = pricebookId,
                                                                     Product2Id = prod.Id,
                                                                     UnitPrice = 100.00,
                                                                     IsActive = true
                                                            );
                                        priceBookEntryToInsert.add(pbEntry);
                                    }
                                    
                                    if(!priceBookEntryToInsert.isEmpty()){
                                        insert priceBookEntryToInsert;
                                    }
                                    
                                    return priceBookEntryToInsert;
                                }
                                
                                
                                * Method Name   : createOpportunityLineItems
                                * Description   : create PricebookEntry for test Classes
                                * @param        : List<PricebookEntry> priceBookEntryList,Id oppId
                                * @returns      : List<OpportunityLineItem>
                                 
                                public static List<OpportunityLineItem> createOpportunityLineItems(List<PricebookEntry> priceBookEntryList,Id oppId){
                                    List<OpportunityLineItem> oppLineItemToInsert = new List<OpportunityLineItem>();
                                    
                                    for(PricebookEntry pbEntry : priceBookEntryList){
                                        //create your opportunity line item.
                                        Integer lineItemQuantity = 1;
                                        OpportunityLineItem oli = new OpportunityLineItem(
                                                                     OpportunityId = oppId,
                                                                     Quantity = lineItemQuantity,
                                                                     PricebookEntryId = pbEntry.Id,
                                                                     TotalPrice = lineItemQuantity * pbEntry.UnitPrice
                                                                );
                                        oppLineItemToInsert.add(oli);
                                    }
                                    
                                    if(!oppLineItemToInsert.isEmpty()){
                                        insert oppLineItemToInsert;
                                    }
                                    
                                    return oppLineItemToInsert;
                                }
                                
                                
                                * Method Name   : getRecordTypeId
                                * Description   : getRecordType for SobjectType and DeveloperName
                                * @param        : String SObjectType,String developerName
                                * @returns      : String 
                                 
                                public static String getRecordTypeId(String SObjectType,String developerName){
                                    List<RecordType> recordTypeList = [Select Id,name,developerName From RecordType where sobjecttype =: SObjectType 
                                                                    AND developerName = : developerName];
                                    
                                    String recordTypeId;
                                    if(!recordTypeList.isEmpty()){
                                        recordTypeId = recordTypeList[0].Id;
                                    }
                                    
                                    return recordTypeId;
                                }
                                
                                
                                * Method Name   : generateRandomString
                                * Description   : generateRandomString with passed length
                                * @param        : Integer len
                                * @returns      : String 
                                 
                                public static String generateRandomString(Integer len) {
                                    final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
                                    String randStr = '';
                                    while (randStr.length() < len) {
                                       Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
                                       randStr += chars.substring(idx, idx+1);
                                    }
                                    return randStr; 
                                }
                                
                                
                                * Method Name   : createTask
                                * Description   : create Task for Test Class
                                * @param        : id whoId
                                * @returns      : Task
                                 
                                public static Task createTask(id whoId){
                                    Task newTask = new Task(
                                                            OwnerId = UserInfo.getUserId(),
                                                            Subject='Test Subject',
                                                            Status='Not Started',
                                                            Priority='Normal',
                                                            WhoId = whoId
                                                            );
                                    insert newTask ;
                                    return newTask ;
                                }
                                
                                
                                * Method Name   : createTask
                                * Description   : create Task for Test Class where Status is not Completed
                                * @param        : id whoId and whatId
                                * @returns      : Task
                                 
                                public static Task createTask1(id whoId,id whatId){
                                    Task newTask = new Task(
                                                            OwnerId = UserInfo.getUserId(),
                                                            Subject='Test Subject',
                                                            Status='Not Started',
                                                            Priority='Normal',
                                                            WhoId = whoId
                                                            );
                                    insert newTask ;
                                    return newTask ;
                                }
                                
                                
                                * Method Name   : createTask1
                                * Description   : create Task for Test Class where Status is Completed
                                * @param        : id whoId and whatId
                                * @returns      : Task
                                 
                                public static Task createTask2(id whoId,id whatId){
                                    Task newTask = new Task(
                                                            OwnerId = UserInfo.getUserId(),
                                                            Subject='Test Subject',
                                                            Status='Completed',
                                                            Priority='Normal',
                                                            whatId = whatId,
                                                            WhoId = whoId
                                                            );
                                    insert newTask ;
                                    return newTask ;
                                }
                                
                                
                                * Method Name   : createEvent
                                * Description   : create Event for Test Class
                                * @param        : id whoId
                                * @returns      : Event
                                 
                                public static Event createEvent(id whoId){
                                    Event newEvent = new Event(
                                                              OwnerId = UserInfo.getUserId(),
                                                              Subject='Test Subject',
                                                              StartDateTime =System.now(),
                                                              DurationInMinutes = 30,
                                                              WhoId = whoId
                                                             );
                                    insert newEvent ;
                                    return newEvent ;
                                }
                                
                                
                                * Method Name   : createTriggerSettings
                                * Description   : create Trigger Settings for Test Class
                                * @param        : 
                                * @returns      : 
                                 
                                public static void createTriggerSettings(){
                                    List<Trigger_Setting__c> triggerSettingToInsert = new List<Trigger_Setting__c>();
                                    
                                    //Trigger Setting for Account
                                    Trigger_Setting__c accountSetting = new Trigger_Setting__c(name='Account',Run_Trigger__c = true);
                                    triggerSettingToInsert.add(accountSetting);
                                    
                                    //Trigger Setting for Lead
                                    Trigger_Setting__c leadSetting = new Trigger_Setting__c(name='Lead',Run_Trigger__c = true);
                                    triggerSettingToInsert.add(leadSetting);
                                    
                                    //Trigger Setting for Opportunity
                                    Trigger_Setting__c opportunitySetting = new Trigger_Setting__c(name='Opportunity',Run_Trigger__c = true);
                                    triggerSettingToInsert.add(opportunitySetting);
                                    
                                    //insert triggerSettingToInsert 
                                    insert triggerSettingToInsert;
                                }
                            }   
                            
        *********************************              *****************************************************
        
                         *Description : This class is used by OpportunityTrigger
                         *@author makepositive
                         *@date 29 Dec 2016
                         
                        public class OpportunityTriggerHandler {
                        
                            public static void handleAfterInsert(Map<Id,Opportunity> newOppMap) {
                                List<Opportunity> oppListForACVSplit = new List<Opportunity>();
                                List<Opportunity> oppListForRenewal = new List<Opportunity>();
                                List<Opportunity> oppListForOrder = new List<Opportunity>();
                                Set<Id> accIdSetForLostOpp = new Set<Id>();
                                Map<Id,Opportunity> accIdOpportunityMap = new Map<Id,Opportunity>();
                                
                                Map<Id,Opportunity> oppIdOppWithLineItemMap = new Map<Id,Opportunity>([select id,name,Pricebook2Id,CurrencyIsoCode,
                                                                                    (select id,name,Discount,Description,ListPrice,Product2Id,ProductCode,Quantity,UnitPrice,Subtotal,PricebookEntryId,PricebookEntry.IsActive,Product2.IsActive,Product2.Name,
                                                                                    CurrencyIsoCode,Additional_Document_Sending_Fee__c,Discount_Amount__c,Required_Students_with_Document_Sending__c,Time_to_acquire__c,VAT__c
                                                                                    from OpportunityLineItems)                                                          
                                                                                    from Opportunity where Id In : newOppMap.keySet()]);
                                                                                    
                                //Iterate on opportunity list to find opportunity which needs ACVSplit or renewal opportunity to be created
                                for(Opportunity opp : newOppMap.values()){
                                    if(opp.Contract_Length__c != null && opp.Contract_Length__c>0 && opp.Subscription_Start_Date__c != null && opp.Average_ACV__c != null && opp.Average_ACV__c>0){
                                        oppListForACVSplit.add(opp);
                                    }
                                    
                                    if(opp.StageName == 'Closed Won' && opp.Type != 'Upsell'){
                                        oppListForRenewal.add(opp);
                                        oppListForOrder.add(opp);
                                    }
                                    
                                    if(opp.StageName == 'Closed Lost'&& opp.accountId != null && opp.Type != 'Upsell'){
                                        accIdSetForLostOpp.add(opp.accountId);
                                        accIdOpportunityMap.put(opp.accountId,opp);
                                    }
                                }
                                
                                //Call createACVSplit method if oppListForACVSplit is not empty
                                if(!oppListForACVSplit.isEmpty()){
                                    createACVSplit(oppListForACVSplit);
                                }
                                
                                //Call createRenewalOpp method if oppListForRenewal is not empty
                                if(!oppListForRenewal.isEmpty()){
                                    createRenewalOpp(oppListForRenewal,oppIdOppWithLineItemMap);
                                }
                                
                                //Call createOrderwithLines method if oppListForOrder is not empty
                                if(!oppListForOrder.isEmpty()){
                                    createOrderwithLines(oppListForOrder,oppIdOppWithLineItemMap);
                                }
                                
                                //Call changeAccountRecordTypeToReapproach method if accIdSetForLostOpp is not empty
                                if(!accIdSetForLostOpp.isEmpty()){
                                    changeAccountRecordTypeToReapproach(accIdSetForLostOpp,accIdOpportunityMap);
                                }
                                
                            }
                            
                            public static void handleAfterUpdate(Map<Id,Opportunity> oldOppMap, Map<Id,Opportunity> newOppMap) {
                                List<Opportunity> oppListForACVSplit = new List<Opportunity>();
                                List<Opportunity> oppListForRenewal = new List<Opportunity>();
                                List<Opportunity> oppListForOrder = new List<Opportunity>();
                                Set<Id> accIdSetForLostOpp = new Set<Id>();
                                Map<Id,Opportunity> accIdOpportunityMap = new Map<Id,Opportunity>();
                                
                                Map<Id,Opportunity> oppIdOppWithLineItemMap = new Map<Id,Opportunity>([select id,name,Pricebook2Id,CurrencyIsoCode,
                                                                                    (select id,name,Discount,Description,ListPrice,Product2Id,ProductCode,Quantity,UnitPrice,Subtotal,PricebookEntryId,PricebookEntry.IsActive,Product2.IsActive,Product2.Name,
                                                                                    CurrencyIsoCode,Additional_Document_Sending_Fee__c,Discount_Amount__c,Required_Students_with_Document_Sending__c,Time_to_acquire__c,VAT__c
                                                                                    from OpportunityLineItems)                                                          
                                                                                    from Opportunity where Id In : newOppMap.keySet()]);
                                                                                    
                                //Iterate on opportunity list to find opportunity which needs ACVSplit or renewal opportunity to be created
                                for(Opportunity opp : newOppMap.values()){
                                    Opportunity oldOpp = oldOppMap.get(opp.Id);
                                    if(opp.Contract_Length__c != null && opp.Contract_Length__c>0 && opp.Subscription_Start_Date__c != null && opp.Average_ACV__c != null && opp.Average_ACV__c>0){
                                        if(opp.Contract_Length__c != oldOpp.Contract_Length__c || opp.Subscription_Start_Date__c != oldOpp.Subscription_Start_Date__c ||
                                            opp.Average_ACV__c != oldOpp.Average_ACV__c){
                                            oppListForACVSplit.add(opp);
                                        }
                                    }
                                    
                                    if(opp.StageName == 'Closed Won' && oldOpp.StageName != 'Closed Won' && opp.Type != 'Upsell'){
                                        oppListForRenewal.add(opp);
                                        oppListForOrder.add(opp);
                                    }
                                    
                                    if(opp.StageName == 'Closed Lost' && opp.accountId != null && opp.Type != 'Upsell'){
                                        accIdSetForLostOpp.add(opp.accountId);
                                        accIdOpportunityMap.put(opp.accountId,opp);
                                    }
                                }
                                
                                //Call createACVSplit method if oppListForACVSplit is not empty
                                if(!oppListForACVSplit.isEmpty()){
                                    createACVSplit(oppListForACVSplit);
                                }
                                
                                //Call createRenewalOpp method if oppListForRenewal is not empty
                                if(!oppListForRenewal.isEmpty()){
                                    createRenewalOpp(oppListForRenewal,oppIdOppWithLineItemMap);
                                }
                                
                                //Call createOrderwithLines method if oppListForOrder is not empty
                                if(!oppListForOrder.isEmpty()){
                                    createOrderwithLines(oppListForOrder,oppIdOppWithLineItemMap);
                                }
                                
                                //Call changeAccountRecordTypeToReapproach method if accIdSetForLostOpp is not empty
                                if(!accIdSetForLostOpp.isEmpty()){
                                    changeAccountRecordTypeToReapproach(accIdSetForLostOpp,accIdOpportunityMap);
                                }
                            }
                            
                            
                            * Method Name   : createACVSplit
                            * Description   : Calculate and create ACV Split for opportunities 
                            
                            private static void createACVSplit(List<Opportunity> opps){
                                List<ACV_Split__c> acvSplitToInsert = new List<ACV_Split__c>();
                                
                                List<ACV_Split__c> acvSplitToDelete = [select id,name from ACV_Split__c where Opportunity__c In : opps];
                                
                                //Delete acvSplitToDelete list if it is not empty
                                if(!acvSplitToDelete.isEmpty()){
                                    delete acvSplitToDelete;
                                }
                                
                                for(Opportunity opp : opps){
                                    if(opp.Contract_Length__c != null && opp.Contract_Length__c>0 && opp.Subscription_Start_Date__c != null && opp.Average_ACV__c != null && opp.Average_ACV__c>0){
                                        Integer months = Integer.valueOf(opp.Contract_Length__c);
                                        Decimal numberOfYears = months/12.0;
                                        Decimal numberOfYearsInteger = Math.ceil(numberOfYears);
                                        
                                        for(Integer i=0;i<numberOfYearsInteger;i++){
                                            Decimal amountForYear;
                                            if(i != numberOfYearsInteger-1){
                                                amountForYear = opp.Average_ACV__c;
                                            }
                                            //Assign reamining amount for last year
                                            else{
                                                Integer remainingMonths = Math.mod(months, 12);
                                                if(remainingMonths != null && remainingMonths !=0){
                                                    amountForYear = (opp.Average_ACV__c/12)*remainingMonths;
                                                }
                                                else{
                                                    amountForYear = opp.Average_ACV__c;
                                                }
                                            }
                                            Date expectedDate = opp.Subscription_Start_Date__c.addYears(i);
                                            ACV_Split__c ACVSplitObj = new ACV_Split__c();
                                            ACVSplitObj.Name = String.valueOf(expectedDate.year());
                                            ACVSplitObj.Amount__c = amountForYear;
                                            ACVSplitObj.Expected_Date__c = expectedDate;
                                            ACVSplitObj.Opportunity__c = opp.id;
                                            ACVSplitObj.CurrencyIsoCode = opp.CurrencyIsoCode;
                                            ACVSplitObj.Year_Number__c = i+1;
                                            acvSplitToInsert.add(ACVSplitObj);
                                        }
                                    }
                                }
                                
                                //Insert ACVSplit list if it is not empty
                                if(!acvSplitToInsert.isEmpty()){
                                    insert acvSplitToInsert;
                                }
                            }
                            
                            
                            * Method Name   : createRenewalOpp
                            * Description   : Create renewal opportunities for opportunities which are Closed Won
                             
                            private static void createRenewalOpp(List<Opportunity> opps,Map<Id,Opportunity> oppIdOppWithLineItemMap){
                                List<Opportunity> renewalOpportunityToInsert = new List<Opportunity>();
                                List<OpportunityLineItem> oppLineItemToInsert = new List<OpportunityLineItem>();
                                Map<Id,Opportunity> oldOppIdNewOppMap = new Map<Id,Opportunity>();
                                List<Opportunity> renewalOppListToUpdate = new List<Opportunity>();
                                
                                for(Opportunity opp : opps){
                                    Opportunity renewalOpportunity = opp.clone(false,true);
                                    if(opp.Renewal_Number__c != null && opp.Renewal_Number__c > 0){
                                        renewalOpportunity.Renewal_Number__c = opp.Renewal_Number__c+1;
                                        String renewOppName = opp.Name;
                                        Integer lastIndex = renewOppName.lastIndexOfIgnoreCase('- Renewal');
                                        if(lastIndex !=null && lastIndex != -1){
                                            renewOppName = renewOppName.substring(0, lastIndex);
                                        }
                                        renewOppName += '- Renewal '+renewalOpportunity.Renewal_Number__c;
                                        renewalOpportunity.Name = renewOppName;
                                    }
                                    else{
                                        renewalOpportunity.Renewal_Number__c = 1;
                                        renewalOpportunity.Name = opp.Name + '- Renewal 1';
                                    }
                                    
                                    renewalOpportunity.Type = 'Renewal';
                                    renewalOpportunity.StageName = 'Qualified';
                                    renewalOpportunity.Initial_Date__c = System.today();
                                    renewalOpportunity.Original_Opportunity__c = opp.Id;
                                    
                                    if(opp.Subscription_End_Date_New__c != null){
                                        renewalOpportunity.CloseDate = opp.Subscription_End_Date_New__c.addMonths(-1);
                                        renewalOpportunity.Subscription_Start_Date__c = opp.Subscription_End_Date_New__c.addDays(1);
                                    }
                                    renewalOpportunity.CurrencyIsoCode = opp.CurrencyIsoCode;
                                    oldOppIdNewOppMap.put(opp.Id,renewalOpportunity);
                                    renewalOpportunityToInsert.add(renewalOpportunity);
                                }
                                
                                //Insert Renewal Opportunity list if it is not empty
                                if(!renewalOpportunityToInsert.isEmpty()){
                                    insert renewalOpportunityToInsert;
                                    //Create oppLineItemToInsert List
                                    for(Opportunity opp : opps){
                                        Opportunity oppWithLineItem = oppIdOppWithLineItemMap.get(opp.Id);
                                        List<String> missingProductList =  new List<String>();
                                        Opportunity renewalOpp = oldOppIdNewOppMap.get(opp.Id);
                                        if(oppWithLineItem != null && !oppWithLineItem.OpportunityLineItems.isEmpty() && oppWithLineItem.Pricebook2Id != null){
                                            for(OpportunityLineItem oppLineItem: oppWithLineItem.OpportunityLineItems){
                                                if(oppLineItem.PricebookEntry.IsActive && oppLineItem.Product2.IsActive){
                                                    OpportunityLineItem oppLineItemObj = oppLineItem.clone(false,true);
                                                    if(renewalOpp != null && renewalOpp.Id != null){
                                                        oppLineItemObj.OpportunityId = renewalOpp.Id;
                                                        oppLineItemToInsert.add(oppLineItemObj);
                                                    }
                                                }
                                                else{
                                                    missingProductList.add(oppLineItem.Product2.Name);
                                                }
                                            }
                                        }
                                        if(!missingProductList.isEmpty()){
                                            String renewalMessage = 'PriceBookEntry or Product is Inactive for following products:\n';
                                            for(String productName : missingProductList){
                                                renewalMessage += productName+'\n';
                                            }
                                            Opportunity renewalOppToUpdate = new Opportunity(Id = renewalOpp.Id,Renewal_Message__c = renewalMessage);
                                            renewalOppListToUpdate.add(renewalOppToUpdate);
                                        }
                                    }
                                    //Insert oppLineItemToInsert for Renewal Opportunity if oppLineItemToInsert is  not empty
                                    if(!oppLineItemToInsert.isEmpty()){
                                        insert oppLineItemToInsert;
                                    }
                                    
                                    //Update renewalOppListToUpdate if renewalOppListToUpdate is  not empty
                                    if(!renewalOppListToUpdate.isEmpty()){
                                        update renewalOppListToUpdate;
                                    }
                                }
                            }
                            
                            
                            * Method Name   : createOrderwithLines
                            * Description   : Create renewal opportunities for opportunities which are Closed Won
                            
                            private static void createOrderwithLines(List<Opportunity> opps,Map<Id,Opportunity> oppIdOppWithLineItemMap){
                                List<Order> orderToInsert = new List<Order>();
                                List<OrderItem> orderItemToInsert = new List<OrderItem>();
                                
                                for(Opportunity opp : opps){
                                    Order orderObj = new Order();
                                    orderObj.accountId = opp.accountId;
                                    orderObj.EffectiveDate = opp.Subscription_Start_Date__c;
                                    orderObj.Term_months__c = opp.Contract_Length__c;
                                    orderObj.Type = opp.Type;
                                    orderObj.Onboarding_Status__c = 'Not Started';
                                    orderObj.of_Students_in_Middle_Year__c = opp.No_of_Middle_Years_Students__c;
                                    orderObj.of_Students_in_Sixth_Form__c = opp.No_of_Lower_6th_Students__c;
                                    orderObj.Status = 'Not Started';
                                    orderObj.Pricebook2Id = opp.Pricebook2Id;
                                    orderObj.OpportunityId = opp.Id;
                                    orderObj.CurrencyIsoCode = opp.CurrencyIsoCode;
                                    orderToInsert.add(orderObj);
                                }
                                
                                
                                //Insert orderToInsert list if it is not empty
                                if(!orderToInsert.isEmpty()){
                                    insert orderToInsert;
                                    for(Order orderObj : orderToInsert){
                                        Opportunity opp = oppIdOppWithLineItemMap.get(orderObj.OpportunityId);
                                        if(opp != null && !opp.OpportunityLineItems.isEmpty() && orderObj.Pricebook2Id != null){
                                            for(OpportunityLineItem oppLineItem: opp.OpportunityLineItems){
                                                OrderItem orderitemObj = new OrderItem();
                                                orderitemObj.OrderId = orderObj.Id;
                                                orderitemObj.Description = oppLineItem.Description;
                                                orderitemObj.PricebookEntryId = oppLineItem.PricebookEntryId;
                                                orderitemObj.Quantity = oppLineItem.Quantity;
                                                orderitemObj.UnitPrice = oppLineItem.UnitPrice;
                                                orderitemObj.Discount_Amount__c = oppLineItem.Discount_Amount__c;
                                                orderItemToInsert.add(orderitemObj);
                                            }
                                        }
                                    }
                                    //Insert orderItemToInsert list if it is not empty
                                    if(!orderItemToInsert.isEmpty()){
                                        insert orderItemToInsert;
                                    }
                                }
                                
                            }
                            
                            
                            * Method Name   : changeAccountRecordTypeToReapproach 
                            * Change        : method previous name was convertClosedLostOppContactsToLead Now conversion is handled in account trigger
                            * Description   : Change account record Type to reapproach
                             
                            private static void changeAccountRecordTypeToReapproach(Set<Id> accIdSetForLostOpp,Map<Id,Opportunity> accIdOpportunityMap){
                                List<Account> accListToUpdate = new List<Account>();
                                
                                List<RecordType> recordTypeList = [Select Id,name,developerName From RecordType where sobjecttype = 'Account' AND developerName = 'Reapporach'];
                                String reapporachRecordTypeId;
                                if(!recordTypeList.isEmpty()){
                                    reapporachRecordTypeId = recordTypeList[0].Id;
                                }
                                
                                List<Account> accListForLostOpp = [select id,name
                                                                from Account where Id In : accIdSetForLostOpp];
                                                                
                                for(Account acc : accListForLostOpp){
                                    if(reapporachRecordTypeId != null){
                                        Account accToUpdate = new Account(Id = acc.Id,RecordTypeId = reapporachRecordTypeId,Status__c = 'Reapproach');
                                        accListToUpdate.add(accToUpdate);
                                    }    
                                }
                                
                                //Update accListToUpdate if it is not empty
                                if(!accListToUpdate.isEmpty()){
                                    update accListToUpdate;
                                }
                            }   
                        } 
                        
                        
                        
                        ********************************************************************
                        Author : Abhishek Kumar Charles
                        Company : Charlesberg
                        Description : Google drive integration
                        ********************************************************************
                        public class googleDriveIntegration 
                        {
                            //variable declarations
                            public string inputURL;
                            public string respFolderId;
                            public string respFolderName;
                            public string respFolderLMDate;
                            public string bwString;
                            public boolean showFileTable{get;set;}
                            public string clientId{get;set;}
                            public String acess_Token{get;set;}
                            public String fileRespone{get;set;}
                            public String folderName{get;set;}
                            public Map<string,string> folderNameIdMap = new Map<string,string>();
                            public List<String> filesList{get;set;}
                            public Map<string,string> filesListModDate = new Map<string,string>();
                            public List<Wrapper> wrapList{get;set;}
                            public List<Wrapper> wrapListTemp{get;set;}
                        
                            ====================================================================================================================================
                                                                            THIS IS THE CLASS CONSTRUCTOR
                            ====================================================================================================================================
                            //class constructor
                            public googleDriveIntegration()
                            {
                                showFileTable = false;
                            }
                            
                            ====================================================================================================================================
                                                                            THIS PART IS FOR THE USER LOGIN METHOD
                            ====================================================================================================================================
                            //prime method to login user into there google drive
                            public void userLogin()
                            {
                                inputURL = 'https://www.google.com/accounts/o8/ud?openid.ns=http://specs.openid.net/auth/2.0&openid.ns.pape=http://specs.openid.net/extensions/pape/1.0&openid.ns.max_auth_age=300&openid.claimed_id=http://specs.openid.net/auth/2.0/identifier_select&openid.identity=http://specs.openid.net/auth/2.0/identifier_select&openid.return_to=https://c.ap1.visual.force.com/apex/googleDriveSync&openid.assoc_handle=ABSmpf6DNMw&openid.mode=checkid_setup&openid.ui.ns=http://specs.openid.net/extensions/ui/1.0&openid.ui.mode=x-has-session&openid.ui.icon=true&openid.ns.ax=http://openid.net/srv/ax/1.0&openid.ax.mode=fetch_request&openid.ax.type.email=http://axschema.org/contact/email&openid.ax.type.language=http://axschema.org/pref/language&IsAuthenticated=true&openid.ax.required=abhishek.charles2012@gmail.com,English';
                                
                                HttpResponse res = new HttpResponse();
                                HttpRequest req = new HttpRequest();
                                Http http = new Http();         
                                req.setEndpoint(inputURL);
                                req.setMethod('GET');
                                try 
                                {
                                    res = http.send(req);
                                    fileRespone = res.getBody();
                                    stepOneAuth();
                                }
                                 catch(System.CalloutException e) 
                                {
                                    System.debug('Job Error: '+ e);
                                    System.debug(res.toString());
                                } 
                            }
                            
                            ====================================================================================================================================
                                                                            THIS METHOD IS TO GET THE ACCESS_TOKEN
                            ====================================================================================================================================
                            //get the aouth Key. This methods returns us the access_Token with client id, redirect uri and token_type as the input parameters
                            public pageReference stepOneAuth()
                            {
                                pageReference pg;
                                
                                if(clientId == null || clientId == '')
                                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Please Provide Your Client Id'));
                                else     
                                {
                                    System.debug('clientId::::::'+clientId);
                                    inputURL = 'https://accounts.google.com/o/oauth2/auth?redirect_uri=https://c.ap1.visual.force.com/apex/googleDriveSync&response_type=token&client_id='+clientId+'&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive&approval_prompt=force&access_type=online';
                                    pg = New pageReference(inputURL);
                                    
                                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'You Have Successfully Logged In'));
                                    hashUrlValue();
                                }
                                return pg;
                            }
                            
                            ====================================================================================================================================
                                                THIS METHOD IS TO FETCH THE ACESS TOKEN AND CALL THE METHOD TO GET THE LIST OF THE FILES AVAILABLE
                            ====================================================================================================================================
                            //get the access_token from url and list of all the files in the drive
                            public void hashUrlValue()
                            {
                                System.debug('I M Being Called');
                                if(acess_Token != null && acess_Token != '')
                                {
                                    System.debug('I M Being Called::::::Inside');
                                    System.debug('acess_Token::::::'+acess_Token);
                                    bwString = acess_Token.substringBetween('access_token=','&token_type');  
                                    System.debug('bwString::::::'+bwString);
                                    //call the method to get list of the files in the drrive along with there ids
                                    googleDriveIntegration1(bwString);
                                }
                            }
                            
                            ====================================================================================================================================
                                                    THIS IS THE METHOD TO GET LIST AND CREATE MAP OF FILE NAME AND THERE ID TO GET DOWNLOAD LINK
                            ====================================================================================================================================
                            //get the map of the files in the drive along with there ids
                            public void googleDriveIntegration1(string bwString)
                            {
                                filesList = new List<String>();
                                wrapList = new List<Wrapper>();
                                showFileTable = true;
                                string auth = bwString;
                                inputURL = 'https://www.googleapis.com/drive/v2/files?access_token='+auth;
                                
                                HttpResponse res = new HttpResponse();
                                HttpRequest req = new HttpRequest();
                                Http http = new Http();         
                                
                                req.setEndpoint(inputURL);
                                req.setMethod('GET');
                                
                                try 
                                {
                                    res = http.send(req);
                                    system.debug('getTheBody::::::'+res.getBody());
                                    //resp is a JSON string
                                    JSONParser parser = JSON.createParser(res.getBody());
                                    integer i =0;
                                    boolean isNotFolder = false;
                                    while (parser.nextToken() != null) 
                                    {
                                        if ((parser.getCurrentToken() == JSONToken.FIELD_NAME))
                                        {
                                            String fieldName = parser.getText();
                                            parser.nextToken();
                                            if(fieldName == 'webContentLink') 
                                            {
                                                respFolderId = parser.getText().substringBetween('https://docs.google.com/uc?id=','&export=download');
                                                
                                            } 
                                            if(fieldName == 'mimeType')
                                            {
                                                if(parser.getText() == 'application/vnd.google-apps.folder')
                                                isNotFolder = true;
                                            }
                                            if(fieldName == 'title')
                                            {
                                                respFolderName = parser.getText();
                                                
                                                filesList.add(respFolderName);
                                            }
                                            if(fieldName == 'modifiedByMeDate')
                                            {
                                                respFolderLMDate = parser.getText();
                                                System.debug('respFolderLMDate'+respFolderLMDate);
                                                filesListModDate.put(respFolderName,respFolderLMDate);
                                                System.debug('filesListModDate'+filesListModDate);
                                            }
                                            if(respFolderName != null && respFolderId != 'me' && !isNotFolder)
                                            {
                                                //first map to get the id of the file when folder name is specified
                                                folderNameIdMap.put(respFolderName,respFolderId);
                                            }
                                            System.debug('respFolderId@@@@@@'+respFolderId);
                                            System.debug('respFolderName@@@@@@@'+respFolderName);
                                            System.debug('folderNameIdMap@@@@@@@'+folderNameIdMap);
                                        }
                                    }
                        
                                    if(filesList.size() == 0)
                                        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'There are no files to be displayed'));
                                    else
                                    {
                                        filesList.remove(filesList.size() - 1);
                                        for(String s : filesList)
                                        {
                                            //if(isNotFolder != ture)
                                            {
                                                Wrapper w = new Wrapper();
                                                w.fileAsObj = s;
                                                if(filesListModDate.containsKey(s))
                                                    w.fileLastModified = filesListModDate.get(s);
                                                w.fileOwner = 'Me';
                                                w.fileName = s;
                                                w.fileId = folderNameIdMap.get(s);
                                                w.rowIndex = wrapList.size();
                                                wrapList.add(w);
                                            }
                                        }
                                        System.debug('wrapList:::::::'+wrapList);
                                    }           
                                }
                                catch(System.CalloutException e) 
                                {
                                    System.debug('Job Error: '+ e);
                                    System.debug(res.toString());
                                }
                            }
                            ====================================================================================================================================
                                                                            THIS METHOD IS TO GET THE DOWNLOAD URL
                            ====================================================================================================================================
                            //get the file download url
                            public void downLoadFile()
                            {   
                                wrapListTemp = new List<Wrapper>();
                                for(integer i = 0; i < wrapList.size(); i++)
                                {
                                    if(wrapList.get(i).selected)
                                    {
                                        wrapListTemp.add(wrapList.get(i));
                                    }
                                }
                                System.debug('wrapListTemp:::'+wrapListTemp);
                                if(wrapListTemp.size() >= 6)
                                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'You Cannot Download More Than Six Files In One Go'));
                                else
                                {   
                                    for(Wrapper w : wrapListTemp)
                                    {
                                        System.debug('w.fileName::::::'+w.fileId);
                                        inputURL = 'https://www.googleapis.com/drive/v2/files/'+w.fileId+'?access_token='+bwString;
                                        //inputURL = 'https://www.googleapis.com/drive/v2/files/0B7caAR4APL0GMTl0eTFnWHl1OWs?access_token='+bwString;
                                        
                                        HttpResponse res = new HttpResponse();
                                        HttpRequest req = new HttpRequest();
                                        Http http = new Http();         
                                        
                                        req.setEndpoint(inputURL);
                                        req.setMethod('GET');
                                        try 
                                        {
                                            res = http.send(req);
                                            //resp is a JSON string
                                            fileRespone = res.getBody();
                                            JSONParser parser = JSON.createParser(res.getBody());
                                            integer i =0;
                                            while (parser.nextToken() != null) 
                                            {
                                                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME))
                                                {
                                                    String fieldName = parser.getText();
                                                    parser.nextToken();
                                                    if(fieldName == 'downloadUrl') 
                                                    {
                                                        respFolderId = parser.getText();
                                                    } 
                                                }
                                            }
                                            fileBody(respFolderId,bwString,w.fileName);
                                        }
                                        catch(System.CalloutException e) 
                                        {
                                            System.debug('Job Error: '+ e);
                                            System.debug(res.toString());
                                        } 
                                    }
                                }
                            }
                            
                            ====================================================================================================================================
                                                                THIS METHOD IS TO GET THE BODY OF THE FILE AND SAVE IT AS AN ATTACHMENT
                            ====================================================================================================================================
                            //method to get the file specified for downloading's body and save it as attachment in the default associated account in Salesforce
                            //@future(callout=true)
                            public void fileBody(string downloadUrl,string accTokenPrime,string fileNamePrime)
                            {
                                System.debug('downloadUrl::::::'+downloadUrl);
                                string accToken = accTokenPrime;
                                string fileName = fileNamePrime;
                                string inputURLStatic = downloadUrl+'?scope=openid%20profile%20email';
                                HttpResponse res = new HttpResponse();
                                HttpRequest req = new HttpRequest();
                                Http http = new Http();         
                                req.setHeader('Authorization', 'Bearer ' + accToken);
                                req.setEndpoint(inputURLStatic);
                                req.setMethod('GET');
                                try 
                                {
                                    res = http.send(req);
                                    string fileResponeStatic = res.getBody();
                                    
                                    Id accountId = [SELECT Id FROM Account WHERE Name =: 'Google Drive Account' LIMIT 1].Id;
                                    
                                    Attachment attachment = new Attachment();
                                    attachment.Body = Blob.valueOf(fileResponeStatic);
                                    attachment.Name = fileName;
                                    attachment.ParentId = accountId; 
                                    insert attachment;
                                    
                                }
                                 catch(System.CalloutException e) 
                                {
                                    System.debug('Job Error: '+ e);
                                    System.debug(res.toString());
                                } 
                            }
                            
                            ====================================================================================================================================
                                                                            THIS IS THE WRAPPER CLASS
                            ====================================================================================================================================
                            
                            public class wrapper
                            {
                                public string fileName{get;set;}
                                public string fileAsObj{get;set;}
                                public string fileId{get;set;}
                                public string fileOwner{get;set;}
                                public string fileLastModified{get;set;}
                                public Integer rowIndex{get;set;}
                                public Boolean selected {get; set;}
                                public Wrapper()
                                {   
                                    selected = false;
                                }
                            }
                        }
               ==================================================================================================
                                               TEST CLASS FOR BATCH CLASSS
               ==================================================================================================
               
                        @isTest 
                        public class CC_AddCampaignMembers_Test
                        {
                            static testMethod void testMethod1() 
                            {
                                Integer totalCount = 10;
                                Boolean isList = false;
                                List<MailChimp_Campaign__c> lstMailChimp = new List<MailChimp_Campaign__c>();
                                
                                
                                MailChimp_Campaign__c mc = new MailChimp_Campaign__c();
                                mc.Name ='Name';
                                mc.MailChimp_List_ID__c ='678676hgjhb';
                                mc.MailChimpSegmentId__c =1234;
                                
                                lstMailChimp.add(mc);
                                insert lstMailChimp;
                                
                                CC_AddCampaignMembers obj = new CC_AddCampaignMembers(isList, totalCount, lstMailChimp);
                                
                                Test.startTest();
                                
                                Test.setMock(HttpCalloutMock.class, new CC_AddCampaignMembers_Mock());
                                DataBase.executeBatch(obj); 
                                
                                Test.stopTest();
                            }
                            
                        }
            ===============================================================================================================
                                                        MOCK TEST CLASS
            ===============================================================================================================
            
            @isTest
            global with sharing class CC_AddCampaignMembers_Mock implements HttpCalloutMock{
                global HTTPResponse respond(HTTPRequest req) {
                    HttpResponse res = new HttpResponse();
                    res.setHeader('Content-Type', 'application/json');
                    res.setBody('{"members":[{"id":"6727675cc2c1492d8c26d9158781ff67","email_address":"dev@appcino.com","unique_email_id":"3418698401","email_type":"html","status":"subscribed","merge_fields":{"FNAME":"Dev","LNAME":"Natani"},"stats":{"avg_open_rate":0.3333,"avg_click_rate":0},"ip_signup":"","timestamp_signup":"","ip_opt":"111.93.33.254","timestamp_opt":"2017-01-31T10:52:00+00:00","member_rating":3,"last_changed":"2017-02-01T09:50:40+00:00","language":"","vip":false,"email_client":"Gmail","location":{"latitude":28.5162,"longitude":77.0708,"gmtoff":8,"dstoff":8,"country_code":"IN","timezone":"Asia/Kashgar"},"list_id":"7d8b3ff1e8","_links":[{"rel":"self","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/6727675cc2c1492d8c26d9158781ff67","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Response.json"},{"rel":"parent","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/CollectionResponse.json","schema":"https://us10.api.mailchimp.com/schema/3.0/CollectionLinks/Lists/Members.json"},{"rel":"update","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/6727675cc2c1492d8c26d9158781ff67","method":"PATCH","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Response.json","schema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/PATCH.json"},{"rel":"upsert","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/6727675cc2c1492d8c26d9158781ff67","method":"PUT","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Response.json","schema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/PUT.json"},{"rel":"delete","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/6727675cc2c1492d8c26d9158781ff67","method":"DELETE"},{"rel":"activity","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/6727675cc2c1492d8c26d9158781ff67/activity","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Activity/Response.json"},{"rel":"goals","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/6727675cc2c1492d8c26d9158781ff67/goals","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Goals/Response.json"},{"rel":"notes","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/6727675cc2c1492d8c26d9158781ff67/notes","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Notes/CollectionResponse.json"}]},{"id":"2100dd6d78eff0a3d959caeba4a99a09","email_address":"dheers@appcino.com","unique_email_id":"f26074cab6","email_type":"html","status":"subscribed","merge_fields":{"FNAME":"Dheer","LNAME":"Singh"},"stats":{"avg_open_rate":0.6667,"avg_click_rate":0},"ip_signup":"","timestamp_signup":"","ip_opt":"111.93.33.254","timestamp_opt":"2017-01-31T10:52:26+00:00","member_rating":4,"last_changed":"2017-01-31T10:52:26+00:00","language":"","vip":false,"email_client":"Gmail","location":{"latitude":28.5162,"longitude":77.0708,"gmtoff":8,"dstoff":8,"country_code":"IN","timezone":"Asia/Kashgar"},"list_id":"7d8b3ff1e8","_links":[{"rel":"self","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/2100dd6d78eff0a3d959caeba4a99a09","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Response.json"},{"rel":"parent","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/CollectionResponse.json","schema":"https://us10.api.mailchimp.com/schema/3.0/CollectionLinks/Lists/Members.json"},{"rel":"update","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/2100dd6d78eff0a3d959caeba4a99a09","method":"PATCH","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Response.json","schema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/PATCH.json"},{"rel":"upsert","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/2100dd6d78eff0a3d959caeba4a99a09","method":"PUT","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Response.json","schema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/PUT.json"},{"rel":"delete","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/2100dd6d78eff0a3d959caeba4a99a09","method":"DELETE"},{"rel":"activity","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/2100dd6d78eff0a3d959caeba4a99a09/activity","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Activity/Response.json"},{"rel":"goals","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/2100dd6d78eff0a3d959caeba4a99a09/goals","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Goals/Response.json"},{"rel":"notes","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/members/2100dd6d78eff0a3d959caeba4a99a09/notes","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Members/Notes/CollectionResponse.json"}]}],"total_items":2,"_links":[{"rel":"self","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/segments/261089/members","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Segments/Members/CollectionResponse.json"},{"rel":"parent","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/segments/261089","method":"GET","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Segments/Response.json"},{"rel":"create","href":"https://us10.api.mailchimp.com/3.0/lists/7d8b3ff1e8/segments/261089/members","method":"POST","targetSchema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Segments/Members/Response.json","schema":"https://us10.api.mailchimp.com/schema/3.0/Definitions/Lists/Segments/Members/POST.json"}]}');
                    res.setStatusCode(200);
                    System.assert(res != null);
                    return res;
                }
            
            }

           ===============================================================================================================
                                                        EINSTEIN BOT CLASS
            NOTE: to debug the apex class make sure platform integration user debug log is enabled and the class should be 
                  added into sfdc.chatbot.service.permset permission set
            ===============================================================================================================
            global class HelpBot_GetPrechatDetails {
    
            @invocableMethod(label='Create Case From Bot')
            global static List<Case> CreateCaseFromChatBot(List<inputForm> Input) {
                
                List<Case> responseData = new List<Case>();
                
                List<LiveChatTranscript> transcriptsToUpdate = new List<LiveChatTranscript>();
                
                Id devRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('SEG_Product_Support').getRecordTypeId();
                
                // CB-3867 - Dhaval | Wipro - Chat: update logic when email entered on prechat form is null
                
                List<Contact> conEmailAdd = new List<Contact>();
                
                if(input[0].UserEmailInput != 'null' && input[0].UserEmailInput != null && input[0].UserEmailInput != '')
                    conEmailAdd = [SELECT Id FROM Contact WHERE EMail = :input[0].UserEmailInput order By createdDate Desc LIMIT 1];
                
                Case ca = new Case();
                ca.Origin = 'Chat';
                ca.Case_Department__c = 'DTS - Tier 1';
                ca.RecordTypeId = devRecordTypeId;
                if(conEmailAdd.size()>0) {
                    ca.ContactId = conEmailAdd[0].Id;
                }
                
                ca.Status = 'New';
                
                ca.MPSS_Description__c = ' Name : ' + input[0].FullName + '\n' +
                    ' Email Address : ' + input[0].UserEmailInput + '\n' +
                    ' District Name : ' + input[0].districtName + '\n' +
                    ' School Name : ' + input[0].schoolName + '\n' +
                    ' Program Name : ' + input[0].programName ;
                
                insert ca;
                
                List<LiveChatTranscript> transcriptRecord = [
                    SELECT Name
                    FROM LiveChatTranscript 
                    WHERE Id = :Input[0].routableID 
                    LIMIT 1];
                
                for(LiveChatTranscript transcript :transcriptRecord) {
                    if(ca.ContactId != null) { 
                        transcriptsToUpdate.add( new LiveChatTranscript(id = input[0].routableID,caseId = ca.id,contactId = ca.ContactId));
                    } else {
                        transcriptsToUpdate.add( new LiveChatTranscript(id = input[0].routableID,caseId = ca.id));
                    }
                }
                if ( transcriptsToUpdate.size() > 0 ) {
                    update transcriptsToUpdate;
                }
                case CaseNr = new Case();
                CaseNr = [SELECT subject,Origin,Status, CaseNumber
                          FROM Case
                          WHERE id=:ca.id];
                responseData.add(CaseNr);
                return responseData;
            }
            
            global class inputform {
                @invocableVariable
                global string FullName;
                @invocableVariable
                global string UserEmailInput;
                @invocableVariable
                global string districtName;
                @invocableVariable
                global string schoolName;
                @invocableVariable
                global string programName;
                @invocableVariable
                global string routableID;
            }
        }
        ===============================================================================================================
                                                        EINSTEIN BOT TEST CLASS
        ===============================================================================================================
        @isTest
        public class HelpBot_GetPrechatDetails_Test {
            static final Id SALES_SITE_GUEST_USER = '005000000070000'; 
            
            static testmethod void testmethod1(){
                
                TestClass_Utility.PrepareData();
                Id prof = [select id from profile where name = 'SEG_Business_Admin' limit 1].id;
                User u = new User(alias = 'SEG_al',MHE_Division__c='GTS', email='segtestCaseTriggers@mcgraw-hill.com', emailencodingkey='UTF-8', lastname='Test_Usr_Seg', languagelocalekey='en_US', localesidkey='en_US', profileid = prof,timezonesidkey='America/Los_Angeles', username='Test_seguser@testorg.com');
                User u1 = new User(alias = 'SEG_a2',MHE_Division__c='GTS', email='segtestCaseTriggers@mcgraw-hill.com', emailencodingkey='UTF-8', lastname='Test_Usr_Seg', languagelocalekey='en_US', localesidkey='en_US', profileid = prof,timezonesidkey='America/Los_Angeles', username='Test_seguser2@testorg.com');
                List<User> userList = new List<User>();
                userList.add(u);
                userList.add(u1);
                insert userList;        
                
                Map<String, Schema.RecordTypeInfo> caseRectype = Schema.SObjectType.case.getRecordTypeInfosByName();
                String ProdRecID = caseRectype.get('MHES Product Retirement').getRecordTypeId();
                String KrodRecID  = caseRectype.get('MHHE Sales Support').getRecordTypeId();
                String SalesRecID = caseRectype.get('MHSE Sales Operations').getRecordTypeId();
                String CsomRTID = caseRectype.get('CSOM Support').getRecordTypeId();
                String GERCRTID = caseRectype.get('MHE GERC').getRecordTypeId();
                String SEGProdSuppRTID = caseRectype.get('SEG Product Support').getRecordTypeId();
                String RyersonRTID = caseRectype.get('Ryerson Product Support').getRecordTypeId(); 
                String CsarRTID = caseRectype.get('TC&C Support').getRecordTypeId();
                string MHHEProdSuppRTID = caseRectype.get('MHHE Product Support').getRecordTypeId();
                string MHESDataRTID = caseRectype.get('MHES Data Team').getRecordTypeId();
                Map<String, Schema.RecordTypeInfo> prodRectype = Schema.SObjectType.Product2.getRecordTypeInfosByName();
                String ProdID=prodRectype.get('MHE Product').getRecordTypeId();
                
                All_Users__c au = new All_Users__c(Name = u1.id,MHE_Division__c = u1.MHE_Division__c,Profile_Name__c = 'SEG_Business_Admin',Hold_Sample__c = u.Hold_Sample__c);
                insert au;
                All_Users__c au1 = new All_Users__c(Name = userinfo.getUserId(),MHE_Division__c = 'GTS',Profile_Name__c = 'System Administrator',Hold_Sample__c = u.Hold_Sample__c);
                insert au1;
                Account testAcc= new Account(Name = 'TestAccount',shippingstreet = 'test', shippingpostalcode='1234', shippingcity='test');        
                Account testAcc1= new Account(Name = 'SEG Product McGraw Hill Account',shippingstreet = 'test1', shippingpostalcode='12341', shippingcity='test1');        
                insert testAcc1; 
                system.runas(u1){ 
                    Test.startTest();    
                    insert testAcc;   
                    //      
                    
                    MHHE_Dummy_Accounts__c mda = new MHHE_Dummy_Accounts__c(Name='SEG Product McGraw Hill Account',Account_Name__c='001C000001NrvIgIAJ');
                    
                    Product2 prod=new Product2(name='test',RecordTypeId=ProdID);
                    insert prod;
                    
                    //create a Live Chat Visitor
                    LiveChatVisitor visitor = new LiveChatVisitor();
                    insert visitor;
                    update visitor;
                    ID MHHERyersonprofile = [select id, name from Profile where Name = 'MHHE_Sales_Representative'].ID;
                    // User u11 = new User(alias = 'TAMAC', email='Test_All_Mass_Actvty_Creat_mail@testorg.com', emailencodingkey='UTF-8', lastname='Test_All_Mass_Activity_Creation', languagelocalekey='en_US', localesidkey='en_US', profileid = MHHERyersonprofile ,timezonesidkey='America/Los_Angeles', username='Test_All_Mass_Activity_Creation@testorg.com');
                    //insert u11;
                    // Create MHE_Course__c record to be used in the Opportunity
                    // Added an addtional value of Category = 'HE' for a new validation rule. D10971  
                    
                    //create a Live Chat Transcript
                    List<MHHE_Dummy_Accounts__c > dumacclist = new List<MHHE_Dummy_Accounts__c >(); 
                    MHHE_Dummy_Accounts__c dumacc1 = new MHHE_Dummy_Accounts__c(Name='MHE CMDB Dummy Account',Account_Name__c='001C000001Ao2r9' );
                    MHHE_Dummy_Accounts__c dumacc2 = new MHHE_Dummy_Accounts__c(Name='SEG Product McGraw Hill Account', Account_Name__c = '001C000001Ao2r9');
                    MHHE_Dummy_Accounts__c dumacc3 = new MHHE_Dummy_Accounts__c(Name='Global Employee Resource Center',Account_Name__c='001C0000012bZFo' );
                    dumacclist.add(dumacc1);
                    dumacclist.add(dumacc2);
                    dumacclist.add(dumacc3);
                    insert dumacclist;
        
                    LiveChatTranscript trans = new LiveChatTranscript(
                        LiveChatVisitorId = visitor.Id,
                        Body = 'Some chat.  Blah Blah'
                    );
                    insert trans;
        
                    
                    //    LiveChatTranscript trans1 = new LiveChatTranscript( Id = input.routableID,
                     //       LiveChatVisitorId = visitor.Id,
                      //      Body = 'Some chat.  Blah Blah'
                       // );
                       // update trans1;            
                    
                    
                    HelpBot_GetPrechatDetails.inputform input = new  HelpBot_GetPrechatDetails.inputform();
                    input.FullName = 'Test name';
                    input.UserEmailInput ='test@mheducation.com';
                    input.districtName = 'testing ';
                    input.schoolName = 'test';
                    input.programName='ALEKS';
                    input.routableID = trans.Id;
                    
                    HelpBot_GetPrechatDetails.inputform input1 = new  HelpBot_GetPrechatDetails.inputform();
                    input.FullName = 'Test name1';
                    input.UserEmailInput='test1@mheducation.com';
                    input.districtName = 'testing 2';
                    input.schoolName = 'test 1';
                    input.programName='OTHER';
                    input.routableID = '232323232';
                    
                   // Contact testCon =new Contact(lastname='TestContact123',AccountId = testAcc.id,Support_Account__c=null, Email=input.UserEmailInput);        
                    //insert testCon;
                    
                    system.debug('::::::11');
                    
                    Case cse = new Case();
                    cse.Status = 'New';
                    cse.Origin = 'Chat';
                    cse.RecordTypeId = SEGProdSuppRTID;
                    //cse.AccountId = acc.id;    //'0018000000cMYTp' 
                    cse.MPSS_Description__c = 'Using data for test class';
                    //cse.ContactId= testCon.id; //'003290000079qCR'; 
                    insert cse;
                    system.debug('::::::22');
                    list<HelpBot_GetPrechatDetails.inputform> inputform = new List<HelpBot_GetPrechatDetails.inputform>();
                    inputform.add(input);
                    inputform.add(input1);
                    system.debug('::::::33');
                    Test.stopTest();
                    HelpBot_GetPrechatDetails.CreateCaseFromChatBot(inputform);
                }
            }
        }
        ===============================================================================================================
                                                        RECAPTCHA KEY FUNCTIONALITY 
        ===============================================================================================================
        //Call a method from doinit to check 
        helper.handleCaptchaListener(component,event,helper);
        
        //Inside helper class
        handleCaptchaListener : function(component,event){
            //Captcha
            let vfOrigin = $A.get('$Label.c.Captcha_Page_Host_URL');// it contains the DTS community url of the recpathcha origin i.e https://uat2-mhedu.cs191.force.com
            window.addEventListener("message", function(event) {
               if (event.origin !== vfOrigin) {
                    return;
                }
                if(!$A.util.isEmpty(event.data)){
                    if (event.data==="lock"){ 
                         component.set('v.captchaResponse','');
                    }else{
                        var getResponse = event.data;
                        component.set('v.captchaResponse',getResponse); // set the response into v.captchaResponse
                    }
                }
            }, false);  
        }
    
        // Inside JS controller on save or submit function we pass captchaResponse as a parameter to the apex class
        getInput : function(component, event, helper){
            var action = component.get("c.caseCreated");
            action.setParams({ 
                "cse" : newCse,
                "con" : newCon,
                "MPSSDesc" : MPSSDes,
                "firstnme" : fname.get("v.value"),
                "lastnme" : lname.get("v.value"),
                "resp" : component.get("v.captchaResponse")
            });
        }
        
        //Apex class calling caseCreated method
        @AuraEnabled
        public static List<RecaptchaWrapper> caseCreated(Case cse, Contact con, String MPSSDesc, String firstnme, String lastnme,String resp) {
            try {    
                //Recaptcha Verification code
                RecaptchaWrapper rw = new RecaptchaWrapper();
                List<RecaptchaWrapper> wrapList = new List<RecaptchaWrapper>();
                Boolean captchstate = Recaptcha2Controller.doVerify(resp);
                if(!captchstate  && !test.isRunningTest()){
                    rw.hasError = captchstate;
                    wrapList.add(rw);
                    return wrapList;
                }
                cse.Description = MPSSDesc + '\n' +'\n' + cse.Description;
                MHHE_Dummy_Accounts__c cs = MHHE_Dummy_Accounts__c.getInstance('MHHE Product McGraw Hill Account');
                //Condition for ContactPhone added by Surabhi as a part of TASK0206204
                if ((cse.SuppliedEmail != null && cse.SuppliedEmail != '') || (cse.ContactPhone != null && cse.ContactPhone != '')){
                    List < Contact > cons = [select id, name from contact where email =: cse.SuppliedEmail AND phone =:cse.ContactPhone];
                    if (cons != null && cons.size() == 1) {
                        cse.ContactId = cons[0].id;
                        cse.AccountId = cs.Id;
                    } else if (cons.size() == 0 || Test.isRunningTest()) {
                        // Inserting Contact
                        con.Accountid = cs.Account_Name__c;
                        cse.Accountid = cs.Account_Name__c;
                        con.Email = cse.SuppliedEmail;
                        con.Phone = cse.ContactPhone;
                        
                        List < Contact > conlist = [select id, accountid from contact where firstname =: firstnme and lastname =: lastnme];
                        
                        if (conlist != null && conlist.size() > 0) con.Is_Duplicate__c = true;
                        con.FirstName = firstnme;
                        con.LastName = lastnme;
                        
                        insert con;
                        cse.contactid = con.id;
                    }                
                }
                cse.Accountid = cs.Account_Name__c;  
                
                // Specify DML options to ensure the assignment rules are executed.            
                Database.DMLOptions dmlOpts = new Database.DMLOptions();
                dmlOpts.assignmentRuleHeader.useDefaultRule = true;
                dmlOpts.EmailHeader.triggerAutoResponseEmail = true;
                cse.setOptions(dmlOpts);
                insert cse;
                rw.caseWrap = cse;
                wrapList.add(rw);
                return wrapList;
                
                
            } 
            catch (Exception ex) {
                system.debug('##Error : ' + ex.getmessage());
                return null;            
            }        
        }
        
        // Recaptcha2Controller Class
        //NOTE: Make sure to register domain on google recaptcha admin account to get secret key and site key 
        //Example to register a domain put the url as uat2-mhedu.cs191.force.com(without https)
        public class Recaptcha2Controller {

        private static String baseUrl = 'https://www.google.com/recaptcha/api/siteverify'; 
        // This is a custom setting needs to be created to store secret key and site key
        private static Recaptcha_Key__mdt captchaKeys = [SELECT Secret_Key__c, Site_Key__c FROM Recaptcha_Key__mdt WHERE developername='Key'];
        
        public static boolean doVerify(String resp) 
        { 
            String baseUrl = 'https://www.google.com/recaptcha/api/siteverify';
            String secret = captchaKeys.Secret_Key__c;
            String responseBody = makeRequest(baseUrl,'secret=' + secret+'&response='+ resp);
            String success = getValueFromJson(responseBody, 'success'); 
            if(!success.equalsIgnoreCase('true')) {     
                return false; 
            }else{
                return true;
                
            }
        } 
        private static String makeRequest(string url, string body) 
        {
            
            HttpResponse response = null; 
            HttpRequest req = new HttpRequest(); 
            req.setEndpoint(url); 
            req.setMethod('POST'); 
            req.setBody (body); 
            
            try{ 
                Http http = new Http(); 
                response = http.send(req);
                return response.getBody(); 
            }catch(System.Exception e) { 
                
                System.debug('ERROR:' + e); 
            } return '{"success":false}'; 
            
        } 
        
        public static string getValueFromJson ( String strJson, String field ) { 
            JSONParser parser = JSON.createParser(strJson); 
            System.debug('parser=='+parser);
            while (parser.nextToken() != null) { 
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME)) { 
                    if(parser.getText() == field
                      ){ // Get the value. 
                          parser.nextToken();
                          return parser.getText(); } } } 
            return null; 
        } 
        
        
    }
  */   

}