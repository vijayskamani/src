trigger TaskremiderTrigger on Task_Reminder__c (before insert,before update) {
   
   if(trigger.isBefore){
       for(Task_Reminder__c t:trigger.new){
           t.SMS__c=label.SMS_Email;
       }
   }
}