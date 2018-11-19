Global class Reopen implements Messaging.inboundEmailHandler{

Global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope env ) {
            Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
            List<Opportunity> opp = new List <Opportunity>();
            String mySubject = email.subject;
            String s = 'OPP';
            Boolean reopen;
            reopen = mySubject.contains(s);
 system.debug('SUB ::'+mySubject );
 
    
    try {
       for(opportunity o:[select id,name,StageName,Opp_Number__c from opportunity where Opp_Number__c=:mySubject limit 1]){
          o.stagename='Qualification';
          opp.add(o);
       }
        if(opp.size()>0){
          database.update(opp,false);
        }
     }catch(exception ex){
        system.debug('Exception'+ex);
     }
    
    result.success = true;
    return result;                    
 }
 
 }