global class SFDCUserLicenseScheduledClass implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        string sfdc = 'Active';
        //List<PackageLicense> packageLicenseList = [SELECT NamespacePrefix, AllowedLicenses, UsedLicenses, ExpirationDate FROM PackageLicense WHERE Status = 'Active'];

        String query = 'SELECT NamespacePrefix, AllowedLicenses, UsedLicenses, ExpirationDate FROM PackageLicense WHERE Status = \'' +sfdc+ '\'' ;
        system.debug('====7'+query);
        return Database.getQueryLocator(query);

    }

    global void execute(Database.BatchableContext BC, List<PackageLicense> scope)
    {
        system.debug('====16>>>>'+scope);
        String emailBody = '';
        Map<String,Double> licenseUsedMap = new Map<String,Double>();
        for(PackageLicense pl : scope){
            Integer usedLicense = pl.UsedLicenses;
        	Integer totalLicense = pl.AllowedLicenses;
            Double x = double.valueOf(usedLicense);
        	Double y = double.valueOf(totalLicense);
            Double usedPercent = (x/y)*100;
            system.debug('====24>>>>'+pl.NamespacePrefix + ': '+usedPercent);
            if(usedPercent > 90){
                licenseUsedMap.put(pl.NamespacePrefix,usedPercent);
            	//Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        	}
        }
        system.debug('====29>>>>'+licenseUsedMap);
        if(!licenseUsedMap.isEmpty()){
            for(String str : licenseUsedMap.keySet()){
                emailBody += str+': '+licenseUsedMap.get(str);
            }
        }
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        // use the html body to set the content of the body
        mail.setHtmlBody('The list of Licenses are mentioned below:<b> ' + emailBody);
        mail.setToAddresses(new String[] {'salesforce.anuj@gmail.com'});
        mail.setSaveAsActivity(false);
        mail.setTargetObjectId('0056F000006PbI2QAK');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        //List<UserLicense> userLicenseRecord = scope;
        //system.debug('====14>>>>'+scope);
        //EmailTemplate emailTemplate = [select Id, Body from EmailTemplate where DeveloperName = 'Open_Case_Reminder'];
        //Integer totalLicenses = 0;
        //Integer usedLicense = 0;
        //Integer usedPercent = 0;
        //Messaging.SingleEmailMessage email;
        //for(UserLicense license: scope){
            //totalLicenses += license.TotalLicenses;
            //usedLicense += license.UsedLicenses;
            /*email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] {'salesforce.anuj@gmail.com'});
            email.setSaveAsActivity(false);
            email.setTargetObjectId('0056F000006PbI2QAK');
            email.setTemplateId(emailTemplate.Id);*/
            //email.setWhatId(license.Id);

        //}
        /*Integer usedLicense = userLicenseRecord[0].UsedLicenses;
        Integer totalLicense = userLicenseRecord[0].TotalLicenses;
        Double x = double.valueOf(usedLicense);
        Double y = double.valueOf(totalLicense);
            system.debug('====34>>>>'+usedLicense);
        system.debug('====35>>>>'+totalLicense);
        Double usedPercent = (x/y)*100;
        system.debug('====37>>>>'+usedPercent);
        if(usedPercent > 90){
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        }*/


        /*for(UserLicense ul : (List<UserLicense>)scope) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] {'anuj.singh@ext.doordash.com'});
            email.setSaveAsActivity(false);
            //email.setTargetObjectId();
            email.setTemplateId(emailTemplate.Id);
            //email.setWhatId();
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        }*/
    }
    global void finish(Database.BatchableContext BC)
    {
    }
}