public class soql1 {
    public void my()
    {    
        list<account> acc=[SELECT Account.Name, (SELECT Contact.LastName FROM Account.Contacts) FROM Account];
       
        system.debug(acc);
        for(account a:acc)
        {    
            for(Contact c: a.Contacts)
            {     
                   system.debug(c);
                
            }
            
        }
    }

}