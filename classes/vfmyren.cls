public class vfmyren {

    public String back { get; set; }

    public PageReference back() {
        PageReference pr= new PageReference('/apex/my1') ;
     return pr;
    }


    public String display { get; set; }
  public Account acc {get; set;}
  public boolean val {get; set;}
  
  public vfmyren(){
  val=false;
  }
  public void display(){
  val=true;
  
  }
}