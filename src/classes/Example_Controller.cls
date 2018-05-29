global with sharing class Example_Controller {
    
    public static String jsonAccount{get;set;}
    public static String jsonTypeOptions{get;set;}
    
    global Example_Controller(){
        jsonAccount = JSON.serialize(new Account());
        
        List<Option> lstTypes = new List<Option>();
        lstTypes.add(new Option('--none--', ''));
        
        for(Schema.PicklistEntry ple: Account.Type.getDescribe().getPicklistValues())
            lstTypes.add(new Option(ple.getLabel(), ple.getValue()));
            
        jsonTypeOptions = JSON.serialize(lstTypes);
    }
    
    @RemoteAction
    global static List<Account> getAccounts(){
        
        return [Select Id, Name, Type from Account Order by Name];
    }
    
    @RemoteAction
    global static Account getAccountDetail(String strId){
        
        return [Select Id, Name, Type, Owner.Name, Owner.Id, Industry, Description from Account where Id = :strId];
    }
    
    @RemoteAction
    global static String save(Account sObjAccount){
        try {
            Upsert sObjAccount;
            return sObjAccount.Id;
        } catch (DMLException e){
            return e.getDmlMessage(0);
        }
    }
}