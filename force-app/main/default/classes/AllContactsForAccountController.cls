public class AllContactsForAccountController {
	
     @AuraEnabled
    public static List<Contact> getContactData(Id recordId){
        return [SELECT Id, Name, Email FROM Contact WHERE AccountId =: recordId];
    }
    
}