public class AsychSOQLExample{
    
    public POC_Obj1__c objPOCObj1;
    public POCObj2__c objPOCObj2;
    public String soqlQuery;
    
    public AsychSOQLExample(){
        objPOCObj1 = new POC_Obj1__c();
        objPOCObj2 = new POCObj2__c();
        
    }
    
    public void AsychSOQLExampleMethod(){
        soqlQuery = 'SELECT Id, First_Name__c ,Last_Name__c , Phone__c, Email__c FROM POC_Obj1__c';
        List<POC_Obj1__c> sobjList = Database.query(soqlQuery);
        List<POCObj2__c> objToclone = new List<POCObj2__c>();
        
        for(POC_Obj1__c obj1 : sobjList){
            POCObj2__c obj2 = new POCObj2__c();
            obj2.First_Name__c = obj1.First_Name__c;
            obj2.Last_Name__c  = obj1.Last_Name__c;
            obj2.Phone__c = obj1.Phone__c;
            obj2.Email__c = obj1.Email__c;
            
        }

       
    }
    
}