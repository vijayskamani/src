public without sharing class ChartHelper {
    
    @AuraEnabled// Make sure annotation should be applied for this method 
    public static List<chartData> GetInventory(){
        List<chartData> cht = new List<chartData>();
        for(AggregateResult ar : [SELECT Family family, Sum(Quantity_Remaining__c) total 
                                  FROM Product2
                                  WHERE Quantity_Remaining__c > 0 GROUP BY Family]){
                                      cht.add(new chartData((String)ar.get('family'), Integer.valueOf(ar.get('total'))));
                                  }
        return cht;
    }
    
    public class ChartData {
        public String name {get;set;}
        public Decimal val {get;set;}
        public ChartData(String name, Decimal val){
            this.name = name;
            this.val = val;
        }
    }
}