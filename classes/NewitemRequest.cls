public class NewitemRequest {

public boolean show{get;set;}
    public boolean hide{get;set;}      
    public NewitemRequest(ApexPages.StandardController controller) {
        show=true;
        hide=false;
    }
    public void showfields()
    {
        show=true;
        hide=true;
       
    }
}