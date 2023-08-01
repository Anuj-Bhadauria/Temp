global class SendOpencasesReminder implements Database.Batchable<sObject> {

    //Send an email to the User after your batch completes
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
    //List<Case> caseNumberList = new List<Case>();
    //List<Case> caseCreatedDateList = new List<Case>();
    //List<User> userList = new List<User>();
    //map of userid - user
    Map<Id, User> ownerMap = new Map<Id, User>();
    
    //Constructor initialization
    global SendOpencasesReminder(Map<Id, User> owners) {
    ownerMap = owners;
    }
    
    //Quuery method.
    global Database.QueryLocator start(Database.BatchableContext BC) {
    return DataBase.getQueryLocator([SELECT Id, CaseNumber, CreatedDate, Owner.Email, OwnerId FROM Case WHERE OwnerId IN : ownerMap.keySet()]);
    }
    
    //Execute Method.
    global void execute(Database.BatchableContext BC,List<Case> cases) {
    
       
        for(Case c : cases){
    
            
                String[] toAddresses = new String[] {c.Owner.Email};
                mail.setToAddresses(toAddresses);   
                mail.setSubject('Open Cases Reminder');
                mail.setPlainTextBody('Dear '+ user.Name+'Please find the list of cases that are in open satatus :' + 'Case Number : ' + c.CaseNumber + 'Created By : ' +c.CreatedDate );
            
            
        }
    }

    //Finish method to execute at last.
    global void finish(Database.BatchableContext BC) {
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

}