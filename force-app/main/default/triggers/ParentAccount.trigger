trigger ParentAccount on Account (after Insert, after update) {
    Set<Id> accParentIdSet = new Set<Id>();
    List<Account> accUpdateList = new List<Account>();
    Map<Id,Decimal> accIdMap = New Map<Id,Decimal>();
    Decimal amountStore = 0;
    for(Account acc : trigger.new){
        if(acc.ParentId != null){
            accParentIdSet.add(acc.ParentId);
        }
    }
    
 List<Account> accParentList = [SELECT Id,(SELECT Amount__c FROM ChildAccounts ) FROM Account WHERE Id IN:accParentIdSet];
  
  for(Account par : accParentList){
    for(Account acc : par.ChildAccounts){
        if(acc.Amount__c != null)
         amountStore += acc.Amount__c;
     }
     accIdMap.put(par.Id,amountStore);
     }
     
     List<Account> parList = [SELECT Id FROM Account WHERE ID IN: accIdMap.keyset()];
     
     for(Account par: parList){
         par.Amount__c = accIdMap.get(par.Id);
         accUpdateList.add(par);
     }
     
     if(accUpdateList.size() >0){
         update accUpdateList;
     }
}