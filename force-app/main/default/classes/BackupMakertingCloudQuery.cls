public class BackupMakertingCloudQuery{
    /*
    Registered Account
    ----------------------
    SELECT *
    FROM ent.Account_Salesforce_Registered_Australia
    
    Guest Account
    -------------------
    SELECT *
    FROM ent.Account_Salesforce_Guest_Australia
    
    Store Language
    ----------------------
    SELECT *                                                            
    FROM ent.Store_Language__c_Salesforce_Australia
    
    store
    ------------------
    SELECT *
    FROM ent.Store__c_Salesforce_Australia
    
    Wishlistitem
    -------------------------
    SELECT *
    FROM ent.Wishlistitem__c_Salesforce_Australia
    
    Asset
    -----------------------
    SELECT *
    FROM ent.Asset_Salesforce_Australia
    
    Contact
    ----------------
    SELECT *
    FROM ent.Contact_Salesforce_Australia
    
    001 Account Guest UK Segmentation
    SELECT *
    FROM ent.Account_Salesforce_Guest_UK
    
    
    001 Account Registered UK Segmentation
    SELECT *
    FROM ent.Account_Salesforce_Registered_UK
    
    
    002 Address UK Segmentation
    SELECT T1.*
    FROM ent.Address_Salesforce_UK T1
    INNER JOIN ent.Account_Salesforce_All T2
    ON T1.Customer_Id__c = T2.Id
    WHERE 
    T2.BillingCountry = 'United Kingdom'
    
    
    003 Asset UK Segmentation
    SELECT T1.*
    FROM ent.Asset_Salesforce_UK T1
    INNER JOIN ent.Account_Salesforce_All T2
    ON T1.AccountId = T2.Id
    WHERE 
    T2.BillingCountry = 'United Kingdom'
    
    
    004 Contact UK Segmentation
    SELECT T1.*
    FROM ent.Contact_Salesforce_UK T1
    INNER JOIN ent.Account_Salesforce_All T2
    ON T1.AccountId = T2.Id
    WHERE 
    T2.BillingCountry = 'United Kingdom'
    
    
    005 Product UK Segmentation
    SELECT *
    FROM ent.Product2_Salesforce_UK
    
    
    006 User UK Segmentation
    SELECT *
    FROM ent.User_Salesforce_UK
    
    
    007 Wishlistitem UK Segmentation
    SELECT T1.*
    FROM ent.Wishlistitem__c_Salesforce_UK T1
    INNER JOIN ent.Account_Salesforce_All T2
    ON T1.Customer_Id__c = T2.Id
    WHERE 
    T2.BillingCountry = 'United Kingdom'
    
    
    008 Store UK Segmentation
    SELECT *
    FROM ent.Store__c_Salesforce_UK
    WHERE 
    Country__c = 'United Kingdom'
    
    
    009 Interaction UK Segmentation
    SELECT *
    FROM ent.Interaction__c_Salesforce_UK
    
    
    010 Store Language Australia Segmentation
    SELECT *                                                            
    FROM ent.Store_Language__c_Salesforce_UK where Country_Code__c = 'UK'
    
    
    011 Interaction Product Australia Segmentation
    SELECT *
    FROM ent.Interaction_Product__c_Salesforce_UK
    
    
    012 InteractionlineItem Australia Segmentation
    SELECT *
    FROM ent.InteractionLineItems__c_Salesforce_UK
    
    
    013 Review Australia Segmentation
    SELECT *                                                            
    FROM ent.Review__c_Salesforce_UK
    
    
    014 Recordtype Australia Segmentation
    SELECT *
    FROM ent.RecordType_Salesforce_UK

    SELECT T1.*
    FROM Address__c_Salesforce T1
    INNER JOIN Account_Salesforce T2
    ON T1.Customer_Id__c = T2.Id
    WHERE 
    T2.BillingCountry = 'Australia'
    
    
    SELECT T1.*, T2.DeveloperName
    FROM Account_Salesforce T1
    INNER JOIN RecordType_Salesforce T2
    ON T1.RecordTypeId = T2.Id
    WHERE 
    T2.DeveloperName = 'Guest' AND BillingCountry = 'Australia'    
    
    
    
    007 Wishlist Item Australia
    
    SELECT T1.*
    FROM Wishlistitem__c_Salesforce T1
    INNER JOIN Account_Salesforce T2
    ON T1.Customer_Id__c = T2.Id
    WHERE 
    T2.BillingCountry = 'Canada'
    
    
    004 Contact France
    SELECT T1.*                                          
    FROM Contact_Salesforce T1
    INNER JOIN Account_Salesforce T2
    ON T1.AccountId = T2.Id
    WHERE 
    T2.BillingCountry = 'Australia'
    
    
    008 Store Australia     // Store
    SELECT *                                         
    FROM Store__c_Salesforce
    WHERE 
    Country__c = 'Australia'
    
    
    SELECT *
    FROM Product2_Salesforce
    
    
    013 Store Language Canada
    SELECT *                                                            
    FROM Store_Language__c_Salesforce
    
    
    012 Recordtype Guest Canada
    SELECT *
    FROM RecordType_Salesforce where de
    
    
    SELECT T1.*, T2.DeveloperName
    FROM Account_Salesforce T1
    INNER JOIN RecordType_Salesforce T2
    ON T1.RecordTypeId = T2.Id
    WHERE 
    T2.DeveloperName = 'Guest' AND BillingCountry = 'Australia'
    
    For Asset
    ----------
    SELECT T1.*
    FROM Asset_Salesforce T1
    INNER JOIN Account_Salesforce T2
    ON T1.AccountId = T2.Id
    WHERE 
    T2.BillingCountry = 'Canada'
    
    For user
    -----------
    SELECT *
    FROM ent.User_Salesforce_Shared_Folder
    
    
    
    SELECT T1.*
    FROM RecordType_Salesforce T1
    INNER JOIN Account_Salesforce T2
    ON T1.Id = T2.RecordTypeId
    WHERE 
    T2.BillingCountry = 'Australia'
                                    

    
    */
    
    /*---------------------------Journey Builder Criteria----------------------*/
    /*
    Reactivation - Non-Recent Visit    Last_Visit_Time__pc is before Today Minus 50 days AND Order_date_UTC__c is before Today Minus 108 days

    Reactivation - Recent Visit         Last_Visit_Time__pc is after Today Minus 50 days AND Order_date_UTC__c is on or before Today Minus 108 days
    */
}