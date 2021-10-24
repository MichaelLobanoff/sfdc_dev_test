public with sharing class CaseService {
   public static void closeCases(Set<Id> caseIds, String CloseReason) {
		List<Case> casesToUpdate = [SELECT Status, Reason FROM Case WHERE Id in :caseIds];
        
        for (Case c : casesToUpdate) {
            c.Status = 'Closed';
            c.Reason = CloseReason;
        }
        
        update casesToUpdate ;
   }    
}