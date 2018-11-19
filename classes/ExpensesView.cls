public class ExpensesView {
   public list<My_Expen__c> lst{get; set;}
   public list<selectOption> yearSP {get; set;}
   public string selectedYear {get; set;}
    public boolean disableFilters{get; set;}
    public ExpensesView(ApexPages.StandardController controller) {
        yearSP = new list<selectoption>();
       yearSP.add(new selectOption('','-None-'));
        for(Schema.PicklistEntry pe : My_Expen__c.Month__c.getDescribe().getPicklistValues()){
            yearSP.add(new selectOption(pe.getValue(),pe.getValue()));
        }
       
    }
    public pageReference prepareRecords(){
        lst =[select id,name,Amount__c,Target_Date__c,Completed__c,Due2__c,Due__c,Expense_Name__c,Month__c,Other__c,Reason__c,Type__c from My_Expen__c where Month__c =:selectedYear];
    
    return null;
    }
     public pageReference saving(){
       upsert lst;
       return new Pagereference('/apex/ExpensesView');
    }
}