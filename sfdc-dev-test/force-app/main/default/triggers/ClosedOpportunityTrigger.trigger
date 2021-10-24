trigger ClosedOpportunityTrigger on Opportunity (before insert) {
    List<Task> newTask = new List<Task> ();
    
    for (Opportunity opp: Trigger.new) {
        
        if (opp.StageName == 'Closed Won') {
            Task t = new Task();
            t.Subject = 'Follow Up Test Task';
            t.WhatId = opp.Id;
            newTask.add(t);
        }
    }
	
    insert newTask;
}