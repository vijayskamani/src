trigger AccountAddressTrigger on Account (before insert,before Update) {

  if(trigger.Isbefore && (Trigger.IsInsert || Trigger.IsUpdate)){
       for(Account a :trigger.new){
       
          if(a.BillingPostalCode!=null && a.Match_Billing_Address__c==true){
            a.ShippingPostalCode=a.BillingPostalCode;
          }
       
       } 
    
  }

}