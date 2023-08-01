@isTest
private class SyncProcessControllerTest {

   
    static testMethod void testResponseMethod(){ 
        Account acc = new Account(Name='High Volume');
        insert acc;

        Account acc1 = new Account(Name='Low Volume');
        insert acc1;
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockSyncProcessControllerTest()); 
        SyncProcessController.getcallout();
        Test.stopTest();
        
    }
}