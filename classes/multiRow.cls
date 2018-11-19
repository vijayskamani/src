public class multiRow {
    public List<Contact> sObjectContacts { get; set; }
    public List<ContactRow> contacts { get; set; }
     
    public multiRow() {
        contacts = new List<ContactRow>();
        sObjectContacts = [Select c.Id, c.Name, c.AccountId, c.FirstName, c.LastName From Contact c WHERE c.AccountID != null LIMIT 5];
        for (Contact c : sObjectContacts) {
            contacts.add(new ContactRow(c));
        }
    }
    
    public PageReference Save() {
        update sObjectContacts;
        return null;
    }
     
    public class ContactRow {
        public ID rowAccountID { get; set; }
        public Account rowAccount { get; set; }
        public Contact rowContact { get; set; }
        public integer count { get; private set; }
         
        public ContactRow(contact c) {
            rowContact = c;
            rowAccount = [SELECT ID, Name From Account Where ID = :c.AccountID];
            rowAccountID = rowContact.AccountID;
            count = 0;
        }
 
        public String getDescription() {
            /* NOTE: One very important thing to remember is that although the <apex:InputField> tag
             * shows the Contact.Account.Name, the only field that it is setting is the Contact.AccountID. 
             * If you were to remove the SOQL statement in the AccountName getter, the value that you would
             * get would be the original name, and would never reflect the changes made on the page by the user. 
             */
            if (rowContact.AccountID != rowAccountID) {
                rowAccountID = rowContact.AccountID;
                rowAccount = [SELECT name FROM account where ID = :rowAccountID];
            }
            return 'Contact: ' + rowcontact.Name + '. Account: ' + rowAccount.Name;
        }
        public PageReference demoAction() {
            System.debug('Invoked ExpressionPassingDemo.demoAction()!');
            count++;
            return null;
        }
        public PageReference Save() {
            update rowContact;
            return null;
        }
    }
}