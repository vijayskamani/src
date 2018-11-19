public class Exportdetails {
    public list<Opportunity> cs{get; set;}
    Public string searchstring{get; set;}
     public PageReference doSearch() {
         init();
         return null;
      }
      public void init(){
         if(searchstring != null && searchstring != ''){
          for(Opportunity op:[select id,name from Opportunity]){
              cs.add(op);
            }
         }
      }  
      
}