@isTest
private class LeadProcessorTest {
    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(LastName='Lead '+i, Company = 'Company', Status = 'Open - Not Contacted'));
        }
        insert leads;
    }
    static testmethod void test() {        
        List<lead> leadsForUpdate =[select ID, LeadSource from Lead];
        Test.startTest();
        LeadProcessor LP = new LeadProcessor();
        Id batchId = Database.executeBatch(LP,200);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
    
}