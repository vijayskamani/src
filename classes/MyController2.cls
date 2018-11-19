global without sharing class MyController2
{
   public Account acnt{get;set;}
   public Account a{get;set;}
   Contact con=new contact();
   public Contact con1{get;set;}
   public Opportunity opp{get;set;}
   Opportunity op=new Opportunity();
   public Account getAccount() {
        Account acc = new Account();
        acc.Name = 'Test Account';
        //insert acc;
        
        ApexPages.StandardController sc = new ApexPages.StandardController(acc);
        //ControllerEx1 c = new ControllerEx1(sc);
        //acnt = c.returnAccount();
        return null;
    }
        
      
   Public Pagereference InsertNewContact()
   { 
     a=getAccount();
     con1=new contact();
     con1.AccountID=a.ID;
     insert con;
     return new PageReference('/'+con.Id);
    }
    public contact getCon()
    {
      return con;
    }
     Public Pagereference InsertNewOpportunity()
     {
       a=getAccount();
       opp=new Opportunity();
       opp.AccountID=a.ID;
       insert op;
       return new PageReference('/'+op.Id);
     }
     public opportunity getop()
     {
        return opp;
     }
    }