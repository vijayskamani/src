public class TestExport {
    public string searchboxstring{get; set;}
    public List<Opportunity> oplist {get; set;} 
   public PageReference doSearch() {
         oplist =new List<Opportunity>();
         if(searchBoxstring != null && searchBoxstring != ''){
             for(Opportunity o:[select id,name,StageName from Opportunity where StageName=:searchBoxstring]){
                 oplist.add(o);
             }
         }
        return null;       
      }
        public Pagereference exportAll(){
    return new Pagereference('/apex/TestExportCSV');
    }
}