public class RandomContactFactory {
  
          public static List<Contact> generateRandomContacts(Integer CNumber,string PostalCode)
        {
        List<Contact> lstContact = new List<Contact>();
        for(Integer i = 0 ; i< CNumber;i++)
        {
            lstContact.add(New contact(FirstName = 'Test'+i, LastName = 'Contact', OtherPostalCode = PostalCode));
        }
        insert lstContact;
        return lstContact;
        }
}