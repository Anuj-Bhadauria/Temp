public class ObjectList {
    
    //@AuraEnabled
	public static List<String> getName(){
        //List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();    
        List<String> options = new List<String>();
        for( Schema.SObjectType o: Schema.getGlobalDescribe().values()){
            System.debug('AllObjectName == '+ o.getDescribe().getName());
            options.add(o.getDescribe().getName());
        }
    		
		return options;
	}
    
    @AuraEnabled
    public static String findObjectNameFromRecordIdPrefix(String recordIdOrPrefix){
        //SObject record = Database.query('Select Id, Name From ' + sobjectName + ' Where Id = :myId');
        return 'Account';
    }
    
    
    @AuraEnabled
    public static List<String> ObjRequiredField(String ObjName){
    	List<String> lstrequiredfields = new List<String>();
    	String sobject_type = ObjName;
        Map<String, Schema.SObjectType> global_describe = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> object_fields_map = global_describe.get(ObjName).getDescribe().fields.getMap();
        for(String f : object_fields_map.keyset()){
            Schema.DescribeFieldResult desribeResult = object_fields_map.get(f).getDescribe();
            if( desribeResult.isCreateable() && !desribeResult.isNillable() && !desribeResult.isDefaultedOnCreate() ){
                //This is mandatory / required field
                lstrequiredfields.add(f);
            }
		}
        return lstrequiredfields;
    }       
}