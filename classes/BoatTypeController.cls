public class BoatTypeController {
@AuraEnabled
    public static List<String> getpickval() {
        List<String> options = new List<String>();

        Schema.DescribeFieldResult fieldResult = BoatType__c.Name.getDescribe();

        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

        for (Schema.PicklistEntry f: ple) {
            options.add(f.getLabel());
        }       
        return options;
    }
}