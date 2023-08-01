public class TestAccountContactController {
	
    @AuraEnabled
    public static List <Contact> getContactLists(Id accountId) {
       return  [Select Name from Contact WHERE AccountId =: accountId];
    }
    
    @AuraEnabled
    public static List <Account> getAccountData(Id accountId) {
       return  [Select Name, Industry from Account WHERE Id =: accountId];
    }
}