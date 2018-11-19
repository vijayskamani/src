public class GetAllApexClasses{
public List<ApexClass> apexclassList {get;set;}
//public string apexclassList{get; set;}
    public list<selectOption> classList {get; set;}
    private map<id, ApexClass> ApexClasse;
public GetAllApexClasses(){
apexclassList=new list<ApexClass>();
ApexClasse=new map<id, ApexClass>();
classList = new list<selectOption>();
classList .add(new selectOption('', '-None-'));
for( ApexClass ac : [SELECT id, name from ApexClass]){
           classList .add(new selectOption(ac.id, ac.Name));
        }
    
}
    
    

}