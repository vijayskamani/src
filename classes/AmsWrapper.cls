public class AmsWrapper { 
   
// Account Merge Search Wrapper

    public Boolean checked{ get; set;}
    public Account acct { get; set;}

    public AmsWrapper(){
        acct = new Account();
        checked = false;
    }

    public AmsWrapper(Account a){
        acct = a;
        checked = false;
    }

}