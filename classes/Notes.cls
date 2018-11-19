public class Notes {
public Notes__c Notes {get;set;}
public List<ApexClass> apexclassList {get;set;}
public list<selectOption> classList {get; set;}
    private map<id, ApexClass> ApexClasse;
public Notes(){
apexclassList=new list<ApexClass>();
ApexClasse=new map<id, ApexClass>();
classList = new list<selectOption>();
classList .add(new selectOption('', '-None-'));
for( ApexClass ac : [SELECT id, name from ApexClass]){
           classList .add(new selectOption(ac.id, ac.Name));
        }
    
}
public PageReference savecls(){
    //Notes__c.name='test';
    //Notes__c.Class_Nmaes__c =classList  ;
    upsert Notes  ;
    PageReference ref = new PageReference('/apex/NotesObject');
    return ref;
}
    
}