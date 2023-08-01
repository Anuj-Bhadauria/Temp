trigger CountisPrimaryOnAccount on Employee__c (after insert, after update, after delete,after undelete) {
    
    Set<Id> conIdSet = new Set<Id>();
    List<Account> accUpdateList = new List<Account>();
    Map<Id,Integer> accIdMap = New Map<Id,Integer>();
    
    for(Employee__c emp : trigger.new){
        if(emp.Is_Primary__c == true && emp.Contact__c != null){
            conIdSet.add(emp.Contact__c);
        }
    }
    if(trigger.isDelete){
        for(Employee__c emp : trigger.old){
            if(emp.Is_Primary__c == true && emp.Contact__c != null){
                conIdSet.add(emp.Contact__c);
            }
        }
    }
     List<Contact> conList = [SELECT AccountId,(SELECT Is_Primary__c FROM Employee__r WHERE Is_Primary__c = true) FROM Contact WHERE Id IN:conIdSet];
     
     for(Contact con: conList){
         accIdMap.put(con.AccountId,con.Employee__r.size());
     }
     
     List<Account> accList = [SELECT Id FROM Account WHERE ID IN: accIdMap.keyset()];
     
     for(Account acc: accList){
         acc.Is_Primary_Count__c = accIdMap.get(acc.Id);
         accUpdateList.add(acc);
     }
     
     if(accUpdateList.size() >0){
         update accUpdateList;
     }

}