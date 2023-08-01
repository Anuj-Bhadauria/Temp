public class AccountTriggerHandler{

    public static void handleBeforeInsert(List<Account> newAccList) {
        Set<String> duplicateAccount = new Set<String>();
        
        for(Account acc : newAccList){
            duplicateAccount.add(acc.Name);
        }
        
        List<Account> accList = [SELECT Id, Name, Rating from Account where Name In : duplicateAccount];
        
        if(accList.size() > 0){
            for(Account a : newAccList){
                for(Account acc : accList){
                    if(a.Name != null && a.Name == acc.Name){
                        a.addError('Account already exists in your Organization with name '+'"'+a.name+'"' );
                    }
                }
            }
        }        
    }
    
    public static void handleBeforeUpdate(List<Account> newAccUpdatedList) {
        
        Set<String> duplicateAccount = new Set<String>();
        
        for(Account acc : newAccUpdatedList){
            duplicateAccount.add(acc.Name);
        }
        
        List<Account> acctList = [SELECT Id, Name, Rating from Account where Name In : duplicateAccount];
        
        if(acctList.size() > 0){
            for(Account a : newAccUpdatedList){
                for(Account acc : acctList){
                    if(a.Name != null && a.Name == acc.Name){
                        a.addError('Account already exists in your Organization with name '+a.name +'!! '+'Try for a different name' );
                    }
                }
            }
        }
    }
}