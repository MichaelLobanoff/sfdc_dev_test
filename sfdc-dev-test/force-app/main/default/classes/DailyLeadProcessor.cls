global class DailyLeadProcessor implements Schedulable {
	 
    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT ID, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
        for(Lead l: leads){
            l.LeadSource =  'Dreamforce';
            leads.add(l);
            }
        //insert leads;
    }
}