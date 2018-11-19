trigger PreventDuplicateContact on Contact (before insert, before update) {
 
  Try {
   Map<String,
Contact> contactMap = new Map<String, Contact>();
   
for (Contact contact : System.Trigger.new)  {
       
       

       
if ((contact.Email != null) &&
                (System.Trigger.isInsert ||
                (contact.Email !=
                    System.Trigger.oldMap.get(contact.Id).Email))) {
       
           

   
           
if (contactMap.containsKey(contact.Email)) {
                contact.Email.addError(
'A record with this email address already exists as a Lead or Contact.');
            }
           
else {
                contactMap.put(contact.Email, contact);
            }
       }
    }
   

   
for (Contact contact : [SELECT Email FROM contact
                     
WHERE Email IN :contactMap.KeySet()]) {
       
Contact newContact = contactMap.get(contact.Email);
        newContact.Email.addError(
'A record with this email address already exists as a Lead or Contact.');
    }
   
for (Lead lead : [SELECT Email FROM Lead WHERE Email IN :contactMap.KeySet()]) {
      
if (lead.IsConverted == false ) {
           
Contact newContact = contactMap.get(lead.Email);
            newContact.Email.addError(
'A record with this email address already exists as a Lead or Contact.');
       }
    } 
       
   
  }
 
catch (exception e){
  } 
 
}