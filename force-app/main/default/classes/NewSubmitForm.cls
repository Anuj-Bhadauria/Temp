public with sharing class NewSubmitForm {

    //Use @AuraEnabled to enable client- and server-side access to the method
    @AuraEnabled       
    public static void createNewRecord(String firstName,String phone) {
        Contact con = New Contact();
        
        con.FirstName = firstName;
        System.debug('New record con.FirstName ==='+con.FirstName);
        con.Phone = phone;
        insert con;
        System.debug('New record Creation ==='+con);
    }
}