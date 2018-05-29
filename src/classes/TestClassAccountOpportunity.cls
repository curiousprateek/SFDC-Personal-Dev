/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestClassAccountOpportunity {

    static testMethod void myUnitTest() {
         Account acc = new Account();
         acc.Name = 'Michael Simmon';
         acc.BillingCity = 'Hawaii Island';
         Insert acc;
         Boolean flag = false;
         System.debug('Account Inserted');
         List<Account> accInserted = [Select id, name, billingCity from Account where name = 'Michael Simmon'];
         
         for (Account a : accInserted){
         	if (a.billingCity.equals(acc.billingCity)){
         		flag = true;
         	}
         }
        System.assertequals(true,flag); 
    }
    
    static testMethod void accountOpportunityTest() {
    	
    	
    }
}