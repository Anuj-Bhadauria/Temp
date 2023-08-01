public class BE_DNR_Scripts{

    //For Creating OLI
    /*
    private String query;
    public Set<Id> oppLiIds = new Set<Id>();
    private List<String> getRequiredFields(){
        return new List<String>{
                                'Name',
                                'Product2Id',
                                'Expiry_Date__c',
                                'Renewal_Price__c',
                                'Effective_From__c',
                                'Member__c',
                                'Member__r.Do_Not_Renew__c',
                                'Group__c',
                                'Group__r.Do_Not_Renew__c',
                                'Group__r.Name',
                                'ContactId',
                                'Payment_Method__c',
                                'AccountId',
                                'Id',
                                'Contact.LastName',
                                'Product_Name__c',
                                'Source_of_Purchase__c',
                                'Group__r.Admin_Contact__c',
                                'Complimentary_Membership__c'
                                };
    }
    query = 'SELECT ';
    query += String.join(getRequiredFields(), ',');
    query += ' FROM Asset';
    query += ' WHERE ID =\'02i58000006E4lT\'';
    List<Asset> scope = Database.query(query);
    
    public static Opportunity createOpportunity(Id memberId, String paymentMethod, Id accountId,String memberLastName,Id pricebookId, Id assetId,Date expiryDate,String sourceOfPurchase){
        Opportunity opp = new Opportunity();
        String name = 'RENWAL:'+memberLastName +' D'+System.now().format('YYYY-MM-dd')+ ' T'+System.now().format('hh:mm');
        opp.Name = name.length()> 120 ? name.subString(0,120) : name;
        opp.RecordtypeId = BEHelper.getRecordTypeId(Opportunity.sObjectType, 'Product');
        opp.AccountId = accountId;
        opp.Purchasing_Member__c = memberId;
        opp.StageName = 'Negotiation/Review';
        opp.CloseDate = expiryDate;
        opp.Payment_Method__c = paymentMethod;
        opp.Pricebook2Id = pricebookId;
        opp.Source_Of_Purchase__c = sourceOfPurchase;
        opp.Type = BEConstants.RENEW_FLOW_TYPE;
        opp.Renewal_Opportunity__c = true;
        opp.Created_From__c = assetId;
        return opp;
    }
    
    private static OpportunityLineItem createOli(Id oppId, Asset asset, PricebookEntry pbe){
        OpportunityLineItem oli = new OpportunityLineItem();
        oli.OpportunityId = oppId;
        oli.Member__c = asset.Member__c;
        oli.Group__c = asset.Group__c;
        oli.Quantity = 1;
        oli.Complimentary_Membership__c = asset.Complimentary_Membership__c;
        oli.PricebookEntryId = pbe.Id;
        oli.UnitPrice = pbe.UnitPrice;
        oli.CreatedFromAssetId__c = asset.Id;//hidden field
        return oli;
    }
    
    Set<Id> productIdsSet = new Set<Id>();
    Set<Id> groupsProcessed = new Set<Id>();
    Set<Id> incompleteGroups = new Set<Id>();
    
    List<OpportunityLineItem> olisToBeCreated = new List<OpportunityLineItem>();
    List<Asset> errorAssetLi = new List<Asset>();
    
    Map<Integer,Map<Id,List<PricebookEntry>>> priceBookEntryMap = new Map<Integer,Map<Id,List<PricebookEntry>>>();
    Map<Id,Opportunity> oppsToBeCreated = new Map<Id,Opportunity>();
    Map<Id,Asset> assetMap = new Map<Id,Asset>();
    Map<Id,List<Asset>> groupsInScope = new Map<Id,List<Asset>>();
    
    for (Asset assetVar : scope) {//Filter all the assets which we shouldnt be creating renewal assets
            if(String.isNotBlank(assetVar.Group__c)){
                //Process group asset only
                productIdsSet.add(assetVar.Product2Id);
            assetMap.put(assetVar.Id, assetVar);
            if(!groupsInScope.containsKey(assetVar.Group__c)){
                groupsInScope.put(assetVar.Group__c, new List<Asset>());
            }
            groupsInScope.get(assetVar.Group__c).add(assetVar);
            groupsProcessed.add(assetVar.Id);// populated for query only
            } else if(String.isNotBlank(assetVar.Member__c) && String.isBlank(assetVar.Group__c)){
                productIdsSet.add(assetVar.Product2Id);
                assetMap.put(assetVar.Id, assetVar);
            }
    }
    
    for (PricebookEntry preVar : [SELECT Pricebook2Id,Pricebook2.Valid_From__c,Product2Id,UnitPrice
                                    FROM PricebookEntry
                                        WHERE Product2.id
                                            IN : productIdsSet
                                            AND Pricebook2.Valid_From__c != null]) {
    
        Integer validYear = preVar.Pricebook2.Valid_From__c.year();
        if (!priceBookEntryMap.containsKey(validYear)){
            priceBookEntryMap.put(validYear, new map<Id,List<PricebookEntry>>());
        }
        if (!priceBookEntryMap.get(validYear).containsKey(preVar.Product2Id)){
            priceBookEntryMap.get(validYear).put(preVar.Product2Id,new List<PricebookEntry>());
        }
        priceBookEntryMap.get(validYear).get(preVar.Product2Id).add(preVar);
    }
    
    for(Asset assetObj : assetMap.values()){
        //Assumption: Renewal Price are always picked from the price book of the Year of membership start date
        Date startDate = assetObj.Expiry_Date__c.addDays(1);
        Integer pricebookYear = startDate.year();
        if(priceBookEntryMap.containsKey(pricebookYear)){//Check if the price book exist for the asset expiry date
            Map<Id,List<PricebookEntry>> pricBookIdMap = priceBookEntryMap.get(pricebookYear);
            if(pricBookIdMap.containsKey(assetObj.Product2Id) &&
                         pricBookIdMap.get(assetObj.Product2Id).size() > 0){//Check if the price book entry exist for the product
    
                Id priceBookId = pricBookIdMap.get(assetObj.Product2Id)[0].Pricebook2Id;
    
            } else {
                assetObj.Auto_Renewal_Error_Message__c = 'No PriceBookEntry Found for the product Name: '+ assetObj.Product_Name__c+' Id: '+ assetObj.Product2Id +' For the Pricebook Year:'+ pricebookYear;
                errorAssetLi.add(assetObj);
            }
    
        } else {
            //update the asset record with Error message
            assetObj.Auto_Renewal_Error_Message__c = 'No Pricebook found with ValidFrom date year with:'+ pricebookYear;
            errorAssetLi.add(assetObj);
        }
    }
    Opportunity oppId = [SELECT Id, Created_From__c FROM Opportunity WHERE ID = '0065800000X335g'];
    oppsToBeCreated.put(oppId.Created_From__c, oppId);
    for(Id key : oppsToBeCreated.keySet()){
        if(String.isNotBlank(oppsToBeCreated.get(key).Id)){
            Id assetId = key;
            Map<Id,List<PricebookEntry>> pricBookIdMap;
            //Group asset line items
            if(groupsInScope.containsKey(key)){
                 for(Asset assetObj : groupsInScope.get(key)){
                    Date startDate = assetObj.Expiry_Date__c.addDays(1);
                    Integer pricebookYear = startDate.year();
                    pricBookIdMap = priceBookEntryMap.get(pricebookYear);
                    if(priceBookEntryMap.containsKey(pricebookYear) &&
                            pricBookIdMap.containsKey(assetObj.Product2Id) &&
                                pricBookIdMap.get(assetObj.Product2Id).size() > 0){
    
                        PricebookEntry pbe = pricBookIdMap.get(assetObj.Product2Id)[0];
                        olisToBeCreated.add(createOli(oppsToBeCreated.get(key).Id, assetObj, pbe));
                    }
                 }
    
            } else {
                Asset asset = assetMap.get(assetId);
                Date startDate = asset.Expiry_Date__c.addDays(1);
                Integer pricebookYear = startDate.year();
                pricBookIdMap = priceBookEntryMap.get(pricebookYear);
                if(priceBookEntryMap.containsKey(pricebookYear) &&
                        pricBookIdMap.containsKey(asset.Product2Id) &&
                            pricBookIdMap.get(asset.Product2Id).size() > 0){
    
                    PricebookEntry pbe = pricBookIdMap.get(asset.Product2Id)[0];
                    olisToBeCreated.add(createOli(oppsToBeCreated.get(key).Id, asset, pbe));
                }
            }
    
        }
    }
    
    if(!olisToBeCreated.isEmpty()){
        insert olisToBeCreated;
        for(OpportunityLineItem oppLi : olisToBeCreated){
            oppLiIds.add(oppLi.Id);
        }
    }
    //update asset with Error messages
    if(!errorAssetLi.isEmpty()){
        update errorAssetLi;
    }
    */
    
    
    
    //------------------------------------------------------------------------------------------------------------------
    
    //For creating Renewal Opp Manually
    /*
    private String query;
    
    private List<String> getRequiredFields(){
        return new List<String>{
                                'Name',
                                'Product2Id',
                                'Expiry_Date__c',
                                'Renewal_Price__c',
                                'Effective_From__c',
                                'Member__c',
                                'Member__r.Do_Not_Renew__c',
                                'Group__c',
                                'Group__r.Do_Not_Renew__c',
                                'Group__r.Name',
                                'ContactId',
                                'Payment_Method__c',
                                'AccountId',
                                'Id',
                                'Contact.LastName',
                                'Product_Name__c',
                                'Source_of_Purchase__c',
                                'Group__r.Admin_Contact__c',
                                'Complimentary_Membership__c'
                                };
    }
    query = 'SELECT ';
    query += String.join(getRequiredFields(), ',');
    query += ' FROM Asset';
    query += ' WHERE ID =\'02i58000006E4lT\'';
    List<Asset> scope = Database.query(query);
    
    public static Opportunity createOpportunity(Id memberId, String paymentMethod, Id accountId,String memberLastName,Id pricebookId, Id assetId,Date expiryDate,String sourceOfPurchase){
        Opportunity opp = new Opportunity();
        String name = 'RENWAL:'+memberLastName +' D'+System.now().format('YYYY-MM-dd')+ ' T'+System.now().format('hh:mm');
        opp.Name = name.length()> 120 ? name.subString(0,120) : name;
        opp.RecordtypeId = BEHelper.getRecordTypeId(Opportunity.sObjectType, 'Product');
        opp.AccountId = accountId;
        opp.Purchasing_Member__c = memberId;
        opp.StageName = 'Negotiation/Review';
        opp.CloseDate = expiryDate;
        opp.Payment_Method__c = paymentMethod;
        opp.Pricebook2Id = pricebookId;
        opp.Source_Of_Purchase__c = sourceOfPurchase;
        opp.Type = BEConstants.RENEW_FLOW_TYPE;
        opp.Renewal_Opportunity__c = true;
        opp.Created_From__c = assetId;
        return opp;
    }
    
    Set<Id> productIdsSet = new Set<Id>();
    Set<Id> groupsProcessed = new Set<Id>();
    Set<Id> incompleteGroups = new Set<Id>();
    
    List<OpportunityLineItem> olisToBeCreated = new List<OpportunityLineItem>();
    List<Asset> errorAssetLi = new List<Asset>();
    
    Map<Integer,Map<Id,List<PricebookEntry>>> priceBookEntryMap = new Map<Integer,Map<Id,List<PricebookEntry>>>();
    Map<Id,Opportunity> oppsToBeCreated = new Map<Id,Opportunity>();
    Map<Id,Asset> assetMap = new Map<Id,Asset>();
    Map<Id,List<Asset>> groupsInScope = new Map<Id,List<Asset>>();
    
    for (Asset assetVar : scope) {//Filter all the assets which we shouldnt be creating renewal assets
            if(String.isNotBlank(assetVar.Group__c)){
                //Process group asset only
                productIdsSet.add(assetVar.Product2Id);
            assetMap.put(assetVar.Id, assetVar);
            if(!groupsInScope.containsKey(assetVar.Group__c)){
                groupsInScope.put(assetVar.Group__c, new List<Asset>());
            }
            groupsInScope.get(assetVar.Group__c).add(assetVar);
            groupsProcessed.add(assetVar.Id);// populated for query only
            } else if(String.isNotBlank(assetVar.Member__c) && String.isBlank(assetVar.Group__c)){
                productIdsSet.add(assetVar.Product2Id);
                assetMap.put(assetVar.Id, assetVar);
            }
    }
    
    //Check if the groups has other assets which is not in the currect batch
    for(Asset groupAssetObj : [SELECT Id,Group__c FROM Asset WHERE Group__c IN :groupsInScope.keySet() AND
                                                                    Id NOT IN :groupsProcessed AND
                                                                    Expiry_date__c > Today AND
                                                                    Expiry_date__c <= NEXT_N_DAYS:42 AND
                                                                    RecordType.DeveloperName='Membership' AND
                                                                    Status='Active']){
        incompleteGroups.add(groupAssetObj.Group__c);
    }
    
    for (PricebookEntry preVar : [SELECT Pricebook2Id,Pricebook2.Valid_From__c,Product2Id,UnitPrice
                                    FROM PricebookEntry
                                        WHERE Product2.id
                                            IN : productIdsSet
                                            AND Pricebook2.Valid_From__c != null]) {
    
        Integer validYear = preVar.Pricebook2.Valid_From__c.year();
        if (!priceBookEntryMap.containsKey(validYear)){
            priceBookEntryMap.put(validYear, new map<Id,List<PricebookEntry>>());
        }
        if (!priceBookEntryMap.get(validYear).containsKey(preVar.Product2Id)){
            priceBookEntryMap.get(validYear).put(preVar.Product2Id,new List<PricebookEntry>());
        }
        priceBookEntryMap.get(validYear).get(preVar.Product2Id).add(preVar);
    }
    
    for(Asset assetObj : assetMap.values()){
        //Assumption: Renewal Price are always picked from the price book of the Year of membership start date
        Date startDate = assetObj.Expiry_Date__c.addDays(1);
        Integer pricebookYear = startDate.year();
        if(priceBookEntryMap.containsKey(pricebookYear)){//Check if the price book exist for the asset expiry date
            Map<Id,List<PricebookEntry>> pricBookIdMap = priceBookEntryMap.get(pricebookYear);
            if(pricBookIdMap.containsKey(assetObj.Product2Id) &&
                         pricBookIdMap.get(assetObj.Product2Id).size() > 0){//Check if the price book entry exist for the product
    
                Id priceBookId = pricBookIdMap.get(assetObj.Product2Id)[0].Pricebook2Id;
                system.debug('====> set up ' + priceBookId);
                //process the asset for Opportunity creation
                
                //Group Membership
                if(String.isNotBlank(assetObj.Group__c) &&
                        !incompleteGroups.contains(assetObj.Group__c) &&
                            !oppsToBeCreated.containsKey(assetObj.Group__c) &&
                                assetObj.Group__r.Admin_Contact__c == assetObj.ContactId &&
                                    !assetObj.Product_Name__c.toLowerCase().contains('secondary')){
                    //add the group Id to make sure we create only One opportunity for the group Memberships
                    oppsToBeCreated.put(assetObj.Group__c,createOpportunity(assetObj.ContactId,
                                                            assetObj.Payment_Method__c,
                                                                assetObj.AccountId,
                                                                    assetObj.Group__r.Name,
                                                                        priceBookId,assetObj.Id,assetObj.Expiry_Date__c,assetObj.Source_Of_Purchase__c));
    
                } else if(String.isNotBlank(assetObj.Member__c) && String.isBlank(assetObj.Group__c)){ //Individual Membership
                    oppsToBeCreated.put(assetObj.Id,createOpportunity(assetObj.ContactId,
                                                            assetObj.Payment_Method__c,
                                                                assetObj.AccountId,
                                                                    assetObj.Contact.LastName,
                                                                        priceBookId,assetObj.Id,assetObj.Expiry_Date__c,assetObj.Source_Of_Purchase__c));
                }
                
    
    
            } else {
                assetObj.Auto_Renewal_Error_Message__c = 'No PriceBookEntry Found for the product Name: '+ assetObj.Product_Name__c+' Id: '+ assetObj.Product2Id +' For the Pricebook Year:'+ pricebookYear;
                errorAssetLi.add(assetObj);
            }
    
        } else {
            //update the asset record with Error message
            assetObj.Auto_Renewal_Error_Message__c = 'No Pricebook found with ValidFrom date year with:'+ pricebookYear;
            errorAssetLi.add(assetObj);
        }
    }
    if(!oppsToBeCreated.isEmpty()){
        List<Opportunity> oppToInsertLi = new List<Opportunity>();
        oppToInsertLi.addAll(oppsToBeCreated.values());
        List<Database.SaveResult> insertResult = Database.insert(oppToInsertLi,false);
        Integer count = 0;
        for(Database.SaveResult sr : insertResult){
            if(!sr.isSuccess()){
                Asset tempObj = assetMap.get(oppToInsertLi[count].Created_From__c);
                String errosStr = String.join(sr.getErrors(),'');
                tempObj.Auto_Renewal_Error_Message__c = errosStr.length() > 250 ? errosStr.substring(0,250) : errosStr;
                errorAssetLi.add(tempObj);
                for(Database.Error err : sr.getErrors()) {
                    System.debug(LoggingLevel.DEBUG,'## The following error has occurred.');
                    System.debug(LoggingLevel.DEBUG, err.getStatusCode() + ': ' + err.getMessage());
                    System.debug(LoggingLevel.DEBUG,' ##Account fields that affected this error: ' + err.getFields());
                }
            }
            count++;
        }
    }
    */
    
    
    //--------------------------------------------------------------------
    //For Discount to OLI
    /*
    RenewalOpportunitiesBatch discountBatch = new RenewalOpportunitiesBatch(new Set<Id>{'00k5800000l7FCy'},userinfo.getSessionId());
    Database.executebatch(discountBatch);
*/
}