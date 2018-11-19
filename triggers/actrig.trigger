trigger actrig on Account (before insert,before update,after  insert,after delete ,after undelete) {
    if(trigger.isbefore){
        if(trigger.isinsert){}
        if(trigger.isupdate){}
        if(trigger.isdelete){}
    }
    if(trigger.isafter){
        if(trigger.isinsert){}
        if(trigger.isupdate){}
        if(trigger.isdelete){}
        if(trigger.isundelete){}
        
    }
    

}