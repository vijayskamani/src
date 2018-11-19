public with sharing class CustomPBListController {

public String getPageNumber() {
    return null;
}

Public PricebookEntry pbe {get;set;}
Public Pricebook2 pb2 {get;set;}
public ApexPages.StandardSetController ssc {get; private set;}
public List<SelectOption> sizeOptions {get; set;}
public List<Pricebook2> pbId {get;set;}
public List<PricebookEntry> standard {get;set;}
public List<PricebookEntry> pb3 {get;set;}
public List<PricebookEntry> pb4 {get;set;}
public String chosenSize {get; set;}
public Integer size {get;set;}
public Integer noOfRecords {get;set;}

public CustomPBListController() {
    ssc = new ApexPages.StandardSetController([select Id, Product2.Name, Productcode, Pricebook2.Name, Pricebook2.Id, UnitPrice from PricebookEntry Where Pricebook2.Name = 'Standard Price Book' Order By Product2.Name ASC limit 500]);
    pb2 = [select id, name from Pricebook2 limit 1];
    standard = [select Id, Product2.Name, Productcode, Pricebook2.Name, Pricebook2.Id, UnitPrice from PricebookEntry Where Pricebook2.Id =:pb2.Id Order By Product2.Name ASC];
    pb3 = [select Id, Product2.Name, Productcode, Pricebook2.Name, Pricebook2.Id, UnitPrice from PricebookEntry Where Pricebook2.Name = 'Test Pricebook' Order By Product2.Name ASC];
    pb4 = [select Id, Product2.Name, Productcode, Pricebook2.Name, Pricebook2.Id, UnitPrice from PricebookEntry Where Pricebook2.Name = 'Novation - Tier 1' Order By Product2.Name ASC];
    sizeOptions = new List<SelectOption> {
    new SelectOption('Standard Price Book', 'Standard Price Book'),
    new SelectOption('Test Pricebook', 'Test Pricebook'),
    new SelectOption('Novation - Tier 1', 'Novation - Tier 1'),
    new SelectOption('Acme Inc, Price Book', 'Acme Inc, Price Book'),
    new SelectOption('MedAssets', 'MedAssets')

};
chosenSize = 'Standard Price Book';

}
public PageReference ApplyFilter() {
    String query = 'select Id, Product2.Name, ProductCode, Pricebook2.Name, Pricebook2.Id, UnitPrice, Minimum_Price__c from PricebookEntry where ';
    if(chosenSize == 'Test Pricebook') {
        query += ' Pricebook2.Name Like \'Test Pricebook\' ';
        }
    else if(chosenSize == 'Novation - Tier 1') {
        query += ' Pricebook2.Name Like \'Novation - Tier 1\' ';
        }
    else if(chosenSize == 'Acme Inc, Price Book') {
        query += ' Pricebook2.Name Like \'Acme Inc, Price Book\' ';
        }
     else if(chosenSize == 'MedAssets') {
        query += ' Pricebook2.Name Like \'MedAssets\' ';
        }
     else if(chosenSize == 'Standard Price Book') {
        query += ' Pricebook2.Name Like \'Standard Price Book\' ';
        }      
    query += ' Order By Product2.Name Asc limit 500 ';
ssc = new ApexPages.StandardSetController(Database.Query(query));
return null;
}

public List<PricebookEntry> GetPBE() {
     return (List<PricebookEntry>)ssc.GetRecords();
}


public pageReference refresh() {
    ssc = null;
    getPBE();
    ssc.setPageNumber(1);
    return null;
 } 

 public PageReference export() {
     return page.updatingpricebook;
     }
 public String xlsHeader {
    get {
        String strHeader = '';
        strHeader += '<?xml version="1.0"?>';
        strHeader += '<?mso-application progid="Excel.Sheet"?>';
        return strHeader;
    }
}

     public PageReference exportall() {
     return page.updatingpricebook;
     }  

  }