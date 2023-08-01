public class SampleAuraController {
@AuraEnabled
    public static List < Account > getselectOptions(sObject objObject, string fld) {
        system.debug('objObject --->' + objObject);
        system.debug('fld --->' + fld);
        List < Account > allOpts = new list < Account > ();
        allOpts = [Select id,Name from Account limit 5];
        
        system.debug('allOpts ---->' + allOpts);
        allOpts.sort();
        return allOpts;
        
    }
}