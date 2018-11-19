public class vfmylst4 {
public list<contact> cont {get; set;}
    public vfmylst4(ApexPages.StandardController controller) {
cont = new list<contact>();
cont.add(new contact(email=''));
    }
    
    public pageReference addcon(){
    cont.add(new contact(email=''));
    return null;
    }
 

}