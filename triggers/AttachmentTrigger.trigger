trigger AttachmentTrigger on Attachment (after insert,after delete) {
    if(trigger.isAfter){
        map<id,Opportunity> oppToUpdate = new map<id,Opportunity>();
        if(trigger.isInsert || trigger.isUpdate ){
            for(Attachment att : trigger.new){
                string parentID = att.parentId;
                if(parentID.startsWith('006')){
                    oppToUpdate.put(parentId,new Opportunity(id=parentId, Has_Attachment__c='Yes'));
                }
                    
            }
        }
        else if(trigger.isDelete){
            for(Attachment att : trigger.Old){
                string parentID = att.parentId;
                if(parentID.startsWith('006')){
                    oppToUpdate.put(parentId,new Opportunity(id=parentId, Has_Attachment__c='No'));
                }
                    
            }
        }
        
        if(oppToUpdate.size() > 0){
            update oppToUpdate.values();
        }
    }
}