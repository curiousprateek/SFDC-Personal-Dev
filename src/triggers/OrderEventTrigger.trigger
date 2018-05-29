trigger OrderEventTrigger on Order_Event__e (After Insert) {
    
    List<Task> taskList = new List<Task>();
    Task eventTask = null;
    
    User usr = [Select Id from User where Name = 'Prateek Saxena' Limit 1];
    
    for (Order_Event__e orderEvent : trigger.new){

        if (orderEvent.Has_shipped__c ==  true){
            eventTask = new Task();
            eventTask.priority = 'Medium';
            eventTask.status = 'New';
            eventTask.Subject = 'Follow up on shipped order ' + orderEvent.Order_Number__c;
            eventTask.OwnerId = usr.Id;
            taskList.add(eventTask);
            
        }
    }
    
    Insert taskList;
}