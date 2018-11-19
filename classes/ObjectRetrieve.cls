public with sharing class ObjectRetrieve {

//Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();

public List<SelectOption> getobjNames()
{
List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
List<SelectOption> options = new List<SelectOption>();
options.add(new SelectOption('--None','--None--'));
for(Schema.SObjectType f : gd)
{
if(f.getDescribe().getName().contains('__c'))
options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
}
return options;
}
}