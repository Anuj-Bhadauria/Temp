public class MyMapController {
    
    
    @AuraEnabled
    public static map<String,String> getMyMap(String objName){
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Schema.SObjectType ctype = gd.get(objName);
        Map<String, Schema.SobjectField> fmap = ctype.getDescribe().fields.getMap();
        List<String> apiNames =  new list<String>();
        map<string,string> fieldApiLabelMap = new map<string,string>();
        
        Integer i=0;
        
        for(string apiName : fmap.keySet()){
            if(i<10){
                fieldApiLabelMap.put(apiname,fMap.get(apiName).getDescribe().getLabel());
                
                i++;
            }else{
                break;
            }
        }
        
        //System.debug('MyMAp === '+);
        return fieldApiLabelMap;
    }
}