public with sharing class ContactsController {
    @AuraEnabled
   public static void createContact(Contact contact) {        
       Database.insert(contact); 
	        
   }
   
   @AuraEnabled
   public static List<Account> getAccountData() {  
       List<Account> accList = [Select id,Name, BillingState, BillingStreet,BillingCountry from Account where Name!= null and BillingStreet !=null limit 10];
       return accList;
           
   }
   
   
}