trigger AccountAllTriggers on Account (before insert,before update) {
    
    Test_RunSetting__c testSetting = Test_RunSetting__c.getValues('Account');
    
    if(testSetting.Run_Trigger__c == true){
        if(trigger.isBefore && trigger.isInsert ){
            AccountTriggerHandler.handleBeforeInsert(trigger.new);        
        }
        if(trigger.isBefore && trigger.isUpdate ){
            AccountTriggerHandler.handleBeforeUpdate(trigger.new);        
        }
    }
}