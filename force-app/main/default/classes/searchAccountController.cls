public with sharing class searchAccountController {
@AuraEnabled
    public static List <Account> fetchAccount() {
        return [SELECT Id, Name, Site From Account Limit 5];
    }
}