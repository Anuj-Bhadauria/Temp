public class ActivitiesOfLeadContact{
    
    public static void testDemo(){
        List<Sobject> taskEventList = new List<Sobject>();
        
        List<Account> accList = [Select id,(Select id,Name,Account__c from leads__r where isConverted = False),(Select id,Name From Contacts) From Account];
        for(Account a : accList){
            
       }
   
   }
     
}