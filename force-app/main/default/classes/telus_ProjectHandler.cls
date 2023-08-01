public class telus_ProjectHandler{

     public static void countNumberOfOppsAfterInsert (List<Project__c> theNewProjectList){ 
        List<Id> caseListId = new List<Id>();
        List<Case> caseListToUpdate = new List<Case>();
        for(Project__c wolfProj :theNewProjectList){
            if(wolfProj.Case__c != null){
                caseListId.add(wolfProj.Case__c);
            }
             System.debug('CaseID === '+caseListId);
        }
        System.debug('caseListId.size() === '+caseListId.size());
         System.debug('CaseID === '+caseListId);
        if(caseListId.size() > 0){
            Map<id,Case> caseMap = new Map<id,Case>([select id, Number_of_Projects__c from Case where id IN :caseListId]);
            for (Case cs : [select Id, Number_of_Projects__c,(select id from Projects__r) from Case where Id IN :caseListId]) {
                caseMap.get(cs.Id).Number_of_Projects__c = cs.Projects__r.size();
                System.debug('no.ofProj == '+caseMap.get(cs.Id).Number_of_Projects__c);
                caseListToUpdate.add(caseMap.get(cs.Id));
                /*if(caseMap.get(cs.Id).Number_of_Projects__c >1){
                    cs.addError('Cannot create more than a single record.');
                }*/
            }
        }
        if(caseListToUpdate.size() > 0){
            Update caseListToUpdate;
        }
    }

}