public class FirstLightningController {
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> accList = new List<Account>();
    	accList = [SELECT Id,Name From Account];
        return accList;
    }
    /*
    public static List<String> getAccounts(){
        List<String> options = new List<String>();    
        Schema.DescribeFieldResult fieldResult =
        Account.AccountSource.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            
        for( Schema.PicklistEntry f : ple){
        	String s = f.getLabel();
           options.add(s);
           //system.debug('## '+f.getLabel()+' '+ f.getValue());
        }       
        return options;
        
    }
    
    */
    
    @AuraEnabled
    public static List<Opportunity> getAccountList(Integer offset, Integer limits, String accId){
        List<Opportunity> accList = new List<Opportunity>();
        System.debug(accId);
        accList = [SELECT id, Name, Amount, CloseDate, Account.Name From Opportunity where AccountId =: accId LIMIT :Integer.valueOf(limits) OFFSET :Integer.valueOf(offset)];
        System.debug(accList);
        return accList;
    }
    
    @AuraEnabled
    public static integer getAccountCount(String accId){
        Integer cnt = [SELECT count() From Opportunity where AccountId =: accId];
        System.debug('count= '+cnt);
        return cnt;
    }
    
    @AuraEnabled
    public static List<Opportunity> getOpportunities(String accId){
        System.debug(accId);
        List<Opportunity> oppList = [SELECT Id, Name From Opportunity where AccountId =: accId];  
        System.debug(oppList);
        return oppList;
    }
    
    @AuraEnabled
    public static List<Opportunity> getSaveOpp(String oppList){
        List<Opportunity> updatedOppList;
        Boolean greaterAmount = false;
        try {
            updatedOppList = (List<Opportunity>)JSON.deserialize(oppList, List<Opportunity>.class);
            for(Opportunity o : updatedOppList){
            	if(o.Amount > 2000){
                    System.debug('amount ==  ' + o.Amount);
                	greaterAmount = true;
                }
            }
        } catch (Exception e) {
            //handle error
        }
        if(greaterAmount == true){
            System.debug('greaterAmount = ' + greaterAmount);
            return updatedOppList;
        }
        else{
            System.debug('greaterAmount = ' + greaterAmount);
            Update updatedOppList;
        	return updatedOppList;
        }
    }
    
    @AuraEnabled
    public static List<Account> getAccountSearch(String accountSearch){
        List<Account> accList = new List<Account>();
        try {
            string searchKey = '%'+accountSearch+'%';
        	List<Account> accList1 = [Select Id, Name From Account Where Name LIKE: searchKey];
            for(Account a : accList1){
                accList.add(a);
            }
         } catch (Exception e) {
            //handle error
        }
		return accList;
    }
   /* @AuraEnabled
    public static List<String> getOppStage(){
        List<String> options = new List<String>();    
        Schema.DescribeFieldResult fieldResult =
        Opportunity.stagename.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            
        for( Schema.PicklistEntry f : ple){
        	String s = f.getLabel();
        	options.add(s);
           //system.debug('## '+f.getLabel()+' '+ f.getValue());
        }       
        return options;
        
    }
    
    @AuraEnabled
    public static List<Opportunity> getFilter(String accName, String oppName, String oppStageName){
        List<String> stages = oppStageName.split(';');  
        List<Opportunity> oppList = new List<Opportunity>();
        //And Name =: oppName 
       	oppList = [Select id, Name, StageName From Opportunity Where Account.Name =: accName AND StageName IN: stages];
        System.debug('oppList== '+oppList);
        return opplist;   
     } */
    
}