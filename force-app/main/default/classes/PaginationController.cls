public class PaginationController {

    @AuraEnabled
    public static List<Opportunity> getAccountList(Integer offset, Integer limits, String accName){
        List<Opportunity> accList = new List<Opportunity>();
        accList = [SELECT id, Name, Amount From Opportunity where Account.Name =: accName LIMIT :Integer.valueOf(limits) OFFSET :Integer.valueOf(offset)];
        System.debug(accList);
        return accList;
    }
    
    @AuraEnabled
    public static integer getAccountCount(String accName){
        Integer cnt = [SELECT count() From Opportunity where Account.Name =: accName];
        System.debug(cnt);
        return cnt;
    }
    
}