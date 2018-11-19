Trigger apexsharing on case (after insert, after update) {

     List<caseshare> csshares = new List<caseshare>();

        for(case cs : trigger.new){
              //if it is private only share with sharing manager
                 if(cs.Is_Private__c==true)
                {
                  caseshare csshare = new  caseshare();
                   csshare.caseId = cs.Id;
                   csshare.UserOrGroupId = cs.Sharing_Manager__c;
                    csshare.CaseAccessLevel = 'Read';
                     csshare.RowCause = 'Manual Sharing';
                    

                       csshares.add(csshare);
                }

               }

        if(! csshares.isEmpty())
             {  
             Database.SaveResult[] tripShareInsertResult = Database.insert(csshares,false);
              }

}