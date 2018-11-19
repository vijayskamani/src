public class fetchingall {
    public void my()
    {
        list<account> acc=[SELECT Account.Name, (SELECT Contact.LastName FROM Account.Contacts),(SELECT Opportunity.Name from Account.Opportunities) FROM Account];
       
        system.debug(acc);
        for(account a:acc)
        {    
            for(Contact c: a.Contacts)
            {
                system.debug(c);
            }
            for(Opportunity o: a.Opportunities)
            {
              system.debug(o);  
            }
            
        }
    }

}