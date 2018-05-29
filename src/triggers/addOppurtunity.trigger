trigger addOppurtunity on Account (after Insert) {
    List<Opportunity> OppList = new List<Opportunity>();
    Opportunity opp;
    for (Account acc : Trigger.new){
        opp = new Opportunity();
        opp.StageName = 'Prospecting';
        opp.Name = acc.Name + 'oppurtunity';
        opp.closeDate = System.today();
        opp.AccountId = acc.id;
        OppList.add(opp);
    }
    Insert OppList;
}