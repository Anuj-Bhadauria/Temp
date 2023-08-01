trigger caseReminderNotification on Case (after insert, after update) {
    
    Map<id, User> owners = new Map<id, User>();
    Set<Id> ownerIds = new Set<Id>();
    for (Case c: trigger.new) {
        if(c.Status != 'Closed'){
            ownerIds.add(c.OwnerId);
        }
    }
    
    if (ownerIds.size() > 0) {
        Database.executeBatch(new SendOpencasesReminder(owners));
    }
    
}