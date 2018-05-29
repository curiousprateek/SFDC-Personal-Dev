public with sharing class NewController {
    
    public List<Account> accList{get; set;}
    
    public NewController(ApexPages.StandardController controller) {
        accList = new List<Account>();
        accList = [Select name,id, Type, billingAddress from Account LIMIT 10];
    }

    public String Account { get; set; }
    
    public String inputText1 {get; set;}
    
    public String inputText2 {get; set;}
    
    public String outcome {get; set;}
    
    public void save() {
    
    Account acc = new Account();
    acc.Name = inputText1;
    acc.BillingCity = inputText2;
    Insert acc;
    outcome = 'Saved Record --' + inputText1;
    }
    
}