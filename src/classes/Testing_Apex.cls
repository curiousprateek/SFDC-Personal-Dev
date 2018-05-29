public class Testing_Apex {
	List<Account> accts = new List<Account>();
    Account abc = new Account();
    public void prateek(){
       abc.billingcity = 'abc';
        abc.name = 'Jack';
        abc.accountNumber = '123123123';
        accts.add(abc);
        Insert accts;
    }             
}