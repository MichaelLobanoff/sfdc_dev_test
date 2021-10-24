public class AccountProcessor {
	@future
    public static void countContacts(Set<Id> SetIds) {
    	List<Account> lstAccount = [SELECT ID,Number_of_Contacts__c , (SELECT ID FROM Contacts) FROM account WHERE id in :SetIds];
      	for(Account acc : lstAccount)
      	{
          List<Contact> lstCont = acc.Contacts;
          acc.Number_of_Contacts__c = lstCont.size();
      	}
      	update lstAccount;
    	
  	}

}