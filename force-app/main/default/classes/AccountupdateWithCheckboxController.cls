public with sharing class AccountupdateWithCheckboxController {

 @AuraEnabled
	public static list < Account > fetchAccount() {
        List<Account> returnAccList = new List<Account>();
     
        List<Account> accList = [SELECT Name, AnnualRevenue, Website, Active__c From Account LIMIT 50];
  // play for loop on accList and add each account to returnAccList List.
  for (Account acc: accList) {
   returnAccList.add(acc);
  }
 // return the List of Accounts
  return returnAccList;
 }
 
 
 @AuraEnabled
 public static void updateRecords(List <String> lstRecordId) {
    
  List<Account> updateAccRec = new List<Account> ();
  // Query Records for update where id in lstRecordId [which is pass from client side controller] 
  List<Account> lstUpdateRec = [select Id, Active__c from Account where id IN: lstRecordId];
  
     for(Account acc: lstUpdateRec){
     	acc.Active__c = 'Yes';
         updateAccRec.add(acc);
     }
     if(updateAccRec.size() > 0){
         update updateAccRec;
     }
 }
}