public class AccountListFetch {
 
    @AuraEnabled
    public static List < Account > fetchAccts() {
        return [ SELECT Id, Name, Industry FROM Account];
    }
    
}