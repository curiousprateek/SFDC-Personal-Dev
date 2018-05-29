@isTest
public class PlatformEventTest {

    @isTest static void testMethod1(){
        Order_Event__e orderEvent = new Order_Event__e(Has_Shipped__c = true, Order_Number__c = '123456');
        
        Test.startTest();
        
        Database.SaveResult sr = EventBus.publish(orderEvent);
        Test.stopTest();
        
        System.assertEquals(true, sr.isSuccess());
        // Check that the case that the trigger created is present.
        List<Task> tasksList = [SELECT Id FROM Task];
        // Validate that this case was found.
        // There is only one test case in test context.
        System.assertEquals(1, tasksList.size());
        
    }
}