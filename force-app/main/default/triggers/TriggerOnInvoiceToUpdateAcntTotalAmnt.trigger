trigger TriggerOnInvoiceToUpdateAcntTotalAmnt on Invoice__c (after insert, after update) {
    Set<Id> accId=new Set<Id>();
    for(Invoice__c inv:trigger.new){
        accId.add(inv.Account__c);
    }
    List<Account> accList=[select id,Total_Draft_Invoice_Amnt__c, Total_Approved_Invoice_Amnt__c, Total_Paid_Invoice_Amnt__c ,(select id,Invoice_Status__c,Invoice_Amnt__c from Invoices__r) from account where id in:accId];
    for(Account a:accList){
        
        a.Total_Draft_Invoice_Amnt__c=0;
        a.Total_Approved_Invoice_Amnt__c=0;
        a.Total_Paid_Invoice_Amnt__c=0;
        for(Invoice__c inv:a.Invoices__r){
            if(inv.Invoice_Status__c  == 'Draft'){
                a.Total_Draft_Invoice_Amnt__c+=inv.Invoice_Amnt__c;
            }
            if(inv.Invoice_Status__c  == 'Approved'){
                a.Total_Approved_Invoice_Amnt__c +=inv.Invoice_Amnt__c;
            }
            if(inv.Invoice_Status__c  == 'Paid'){
                a.Total_Paid_Invoice_Amnt__c +=inv.Invoice_Amnt__c;
            }
        }
    }
    if(accList.size()>0){
        update accList;
    }
}