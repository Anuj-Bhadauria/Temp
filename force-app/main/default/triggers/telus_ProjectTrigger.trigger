trigger telus_ProjectTrigger on Project__c (after Update, after insert, after delete, after undelete) {

    if(Trigger.isAfter) {
        //if(telus_ProjectHandler.FirstRun){
        //telus_ProjectHandler.FirstRun = false;        
            if(Trigger.isUpdate) {  
                //telus_ProjectHandler.updateCase(Trigger.new,Trigger.Old);
                //telus_ProjectHandler.closeCaseProject(Trigger.newMap); 
                telus_ProjectHandler.countNumberOfOppsAfterInsert(trigger.new);
                telus_ProjectHandler.countNumberOfOppsAfterInsert(trigger.old);
            } else if (Trigger.isInsert) {
                //telus_ProjectHandler.updateCase(Trigger.new,Trigger.new); 
               // telus_ProjectHandler.createEventAfterInsert(trigger.new);
                telus_ProjectHandler.countNumberOfOppsAfterInsert(trigger.new);
            }
              else if (Trigger.isUndelete){
                  telus_ProjectHandler.countNumberOfOppsAfterInsert(trigger.new);
              }
              else if (Trigger.isDelete){
                  telus_ProjectHandler.countNumberOfOppsAfterInsert(trigger.old);
              }
        //} 
        
       
    }

}