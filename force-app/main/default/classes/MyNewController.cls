public class MyNewController {
	@AuraEnabled
    public static List<String> getSobjectList(){
        List<String> options = new List<String>();
        for( Schema.SObjectType o: Schema.getGlobalDescribe().values()){
            //System.debug('AllObjectName == '+ o.getDescribe().getName());
            options.add(o.getDescribe().getName());
        }
    		
		return options;
    }
    
    @AuraEnabled
    public static SObject[] getObjectRecords(SObject objName){
        String queryFinal = 'SELECT id, Name FROM '+objName;
        SObject[] objResult = Database.query(queryFinal);
        //List<objName> childRecords = [SELECT Id, Name From objName];
        return objResult;
    }
}