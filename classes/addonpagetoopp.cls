public class addonpagetoopp {

    public addonpagetoopp(ApexPages.StandardController controller) {
       val=false;
        if(opp.StageName=='Closed Won'){
    val=true;
    
    }
    }
    
    public opportunity opp {get;set;}
    public boolean val {get; set;}
   

}