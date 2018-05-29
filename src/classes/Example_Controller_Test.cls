@isTest
private class Example_Controller_Test {

	private static testMethod void test() {
    
    Example_Controller controller = new Example_Controller();
    
    Account sObjAccount = new Account(Name = 'Test Account');
    Example_Controller.save(sObjAccount);
    
    List<Account> lstAccounts = Example_Controller.getAccounts();
    
    sObjAccount = Example_Controller.getAccountDetail(lstAccounts[0].Id);
	}

}