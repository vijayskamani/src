trigger LeadTrigger on Lead (Before insert,Before Update) {

     BusinessHours stdBusinessHours = [select id from businesshours where id='01m36000000Ei3B'];
     if(Trigger.isInsert){
         
          for (Lead so : Trigger.new) {
            Datetime startDate = system.now();
            // BSC works 11.5 hours / day (8:00 AM - 7:30 PM, M-F). Our SLA is 2-days (23 business hours)
            so.Test_Date__c = BusinessHours.addGmt (stdBusinessHours.id, System.now(), 8 * 60 * 60 * 1000L);
             so.NumberofLocations__c = ((so.Test_Date__c.getTime())/1000/60/60) - ((startDate.getTime())/1000/60/60);

      } 
     }
     
    


}