public class AdminContollingPageController {
Public list<SelectOption> options {get; set;}
Public list<Profile> profiles {get; set;}
Public list<FieldPermissions> fields {get; set;}
public List<SelectOption> objects {get; set;}
public List<SObject> records {get; set;}
public string choosenObject {get; set;}
 Public string selectedoption {get; set;}
        public AdminContollingPageController(){
               options=new list<SelectOption>();
                for(string s:Label.Select_Options.split('; ')){
                   options.add(new SelectOption(s,s));
                }           
               profiles =new list<Profile>([select id,name from Profile]);
               objects = new List<SelectOption>();
               records = new List<SObject>();
               Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
               List<String> objectList = new List<String>();
               objectList.addAll(gd.keyset());
               Schema.DescribeSobjectResult[] results = Schema.describeSObjects(objectList );
               for(Schema.DescribeSobjectResult res : results) { 
                    if( ! res.isCustom()) 
                          objects.add(new selectOption(res.getName() ,res.getLabel())); 
               }

        }

      
}