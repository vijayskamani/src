global class populaterecordtype implements Database.Batchable<sObject>{


   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator([select id,name,RecordTypeid,RecordType.Name from product2]);
   }

   global void execute(Database.BatchableContext BC, List<product2> scope){
            RecordType r = [SELECT Id FROM RecordType WHERE Name = 'B rec' AND SobjectType = 'Product2' limit 1]; 
            for(Product2 p:scope){ 
                   if(p.RecordType==null){ 
                    p.RecordTypeID=r.id; 
                   }
                
            } 
            update scope;
    }

   global void finish(Database.BatchableContext BC){
   }
   
   
}