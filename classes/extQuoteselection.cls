public class extQuoteselection {
public Boolean isDisplayPopUp {get; set;}
public opportunity opp {get; set;}
public Boolean val{get; set; }
    public extQuoteselection(ApexPages.StandardController controller) {
    
    }
 public void val(){
 if(opp.StageName=='Qualification'){
    isDisplayPopUp = true;
    }
    else {
    isDisplayPopUp = false;
    }
 }
}