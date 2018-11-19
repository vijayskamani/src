public class expenses {

    public expenses(ApexPages.StandardController controller) {
      My_Expen__c exp=new My_Expen__c();
      lst =new list<My_Expen__c>();
      lst.add(exp);
    }

 
  public list<My_Expen__c> lst{get; set;}
    
  public void adding(){
    My_Expen__c e=new My_Expen__c();
    lst.add(e);
  }
  public pagereference saving(){
    for(integer i=0;i<lst.size();i++){
      upsert lst;
    }
    return new Pagereference('/apex/ExpensesView');
  }
  
}