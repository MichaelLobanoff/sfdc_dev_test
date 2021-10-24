public class AddPrimaryContact implements Queueable { 
    private Contact contacts;
    private String state;
    
    public AddPrimaryContact(Contact cont, String st) {
        this.contacts = cont;
        this.state = st;
        }
    
    public void execute(QueueableContext context) {
        List<Account> acc = [SELECT ID FROM Account WHERE billingstate = :state LIMIT 200];
        for (Account a: acc){
            Contact cc= contacts.clone();
            cc.accountID=a.id;
            insert cc;
        }
    }
}