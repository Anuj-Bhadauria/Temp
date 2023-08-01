public class CreateNewRecord {
	 @AuraEnabled
    public static void createRecord (String contact){
        
        try{
            System.debug('CreateCandidateRecord::createRecord::candidate'+contact);
            Contact con = new Contact();
            con.LastName = contact;
            System.debug('New Contact FirstName === '+con.LastName);  
            //if(contact != null){
                insert con;
			System.debug('New Contact Record ID'+con.id);            
            //}
            
        } catch (Exception ex){
            
        }
        
    }    
}