public class PriceBookAdministration {
    
    public blob contentInFile {get; set;}
    public string fileName {get; set;}
    
    public string selectedPriceBook {get; set;}
    public list<selectOption> priceBookList {get; set;}
    
    private map<id, PricebookEntry> priceBookEntries;
    
    public list<PricebookEntry> peList {get; set;}
    
    
    public PriceBookAdministration(){
        
        peList = new list<PricebookEntry> ();
        priceBookEntries = new map<id, PricebookEntry>();
        priceBookList = new list<selectOption>();
        priceBookList.add(new selectOption('', '-None-'));
        for(PriceBook2 pb : [select id,Name from PriceBook2 where IsActive = :true order by Name]){
            priceBookList.add(new selectOption(pb.id, pb.Name));
        }
        
    }
    
    public pageReference upsertRecords(){
        try{
            if(selectedPriceBook == null || selectedPriceBook == ''){
                ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'Please select the price book');
                ApexPages.addMessage(errormsg);
                return null;
            }
            
            if(fileName != null){
                if(!fileName.contains('csv')){
                    ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please upload valid CSV file');
                    ApexPages.addMessage(errormsg);
                    return null;
                }
            }else{
                ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please upload the file');
                ApexPages.addMessage(errormsg);
                return null;
            }
            
            peList = new list<PricebookEntry> ();
            //string allRowsInfo = contentInFile.toString();
            string allRowsInfo = EncodingUtil.base64Encode(contentInFile);
            
            set<string> productNames = new set<string>();
            integer i = 0;
            for(string rowInfo : allRowsInfo.split('\n')){
                if(i !=0){
                    productNames.add(rowInfo.split(',')[0]);
                }else{  
                    // Need to leave the first row, as it contains column names
                    i = i+1;
                }            
            }
            
            map<string, string> productIds = new map<string, string>();
            map<string, string> peForprodAndPriceBook = new map<string, string>();
            set<id> prodIds = new set<id>();
            
            for(product2 prod : [select id, Name from product2 where name in :productNames]){
                productIds.put(prod.Name, prod.id);
                prodIds.add(prod.id);
            }
            
            for(PricebookEntry pe : [select id,Name, Pricebook2Id,IsActive,Product2Id, UnitPrice from PricebookEntry where Pricebook2Id=:selectedPriceBook and Product2Id in:prodIds]){
                peForprodAndPriceBook.put(pe.Product2Id+'-'+pe.Pricebook2Id, pe.id);
                priceBookEntries.put(pe.id, pe);
            }
            
            
            map<string, PricebookEntry> peByProdNames = new map<string, PricebookEntry>();
            
            i = 0;
            for(string allRows : allRowsInfo.split('\n')){
                if(i !=0){
                    list<string> rowInfo = allRows.split(',');
                    string prodName = rowInfo[0];
                    decimal unitPrice = decimal.valueOf(rowInfo[1]);
                    string isActiveString = rowInfo[2].toLowerCase();
                    boolean isActive = false;
                    if(isActiveString.contains('true')){
                        isActive = true;
                    }
                    id prodId = productIds.get(prodName);
                    PricebookEntry tmpPE = new PricebookEntry(product2Id= prodId, isActive=isActive,unitPrice=unitPrice);
                    peByProdNames.put(prodName,tmpPE);
                }else{
                    i=i+1;
                }
            }
            
            i = 0;
            for(PricebookEntry pe : peByProdNames.values()){
                PricebookEntry tmpPE = new PricebookEntry();
                
                string priceBookEntryCombination = pe.product2Id+'-'+selectedPriceBook;
                string pricebookId;
                
                if(peForprodAndPriceBook.get(priceBookEntryCombination) != null){
                    system.debug('*****pricebookId******');
                    pricebookId = peForprodAndPriceBook.get(priceBookEntryCombination);
                }
                
                if(pricebookId != null && priceBookEntries.get(pricebookId) != null){
                    tmpPE = priceBookEntries.get(pricebookId);
                    tmpPE.UnitPrice = pe.UnitPrice;
                    tmpPE.IsActive = pe.isActive;
                    priceBookEntries.put(tmpPE.id, tmpPE);
                    system.debug('****tmpPE'+tmpPE);
                }else{
                    tmpPE.Pricebook2Id = selectedPriceBook;
                    tmpPE.UnitPrice = pe.UnitPrice;
                    tmpPE.IsActive = pe.isActive;
                    peList.add(tmpPE);
                }
            }
            
            
            if(priceBookEntries.size() > 0){
                peList.addAll(priceBookEntries.values());
                upsert peList;
                peList = [select id,Name, Pricebook2Id,IsActive,Product2Id, UnitPrice from PricebookEntry where id=:peList];
                
            }
        }Catch(Exception ex){
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. '+ex.getMessage());
            ApexPages.addMessage(errormsg);
            return null;
        }
        return null;
    }
    

}