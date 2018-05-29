@isTest
private class SearchFieldControllerTest{
    static testMethod void test_SearchFieldControllerTest(){
        //create some test account
        List<Account> accountList = new List<Account>();
        for(Integer i =0 ; i < 200 ; i++){
            accountList.add(new Account(Name='Test'+i));
        }
        //insert test records
        insert accountList;
        Test.startTest();
            System.assertEquals(accountList.size(),SearchFieldController.getData('Account','Name','Id','T',false,'undefined').size());
            System.assertEquals(1, SearchFieldController.getData('Account','Name','Id','Test111',false,'undefined').size());
            System.assertEquals(0, SearchFieldController.getData('Account','Name','Id','xxxxxxx',false,'undefined').size());
            SearchFieldController controller = new SearchFieldController();
            controller.setTargetFieldVar(accountList[0].Id);
            System.assertEquals(accountList[0].Id,controller.getTargetFieldVar());
            controller.setCacheField(null);
        Test.stopTest();
        
    }
}