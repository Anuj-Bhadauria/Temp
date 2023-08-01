public class WebToLeadController {
	
    @AuraEnabled
    public static Void getWebToLeadForm(String ldName, String email, String phoneNum, String comments){
        try{
            System.debug(ldName);
            System.debug(email);
            System.debug(phoneNum);
            Lead l = new Lead();
            l.FirstName = ldName;
            l.Email = email;
            l.Phone = phoneNum;
            l.Description = comments;
            insert l;
        }
        catch(Exception e){
            System.debug(e);
        }

    }
}