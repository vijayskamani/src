public class LineItem_Controller {
   
    //*****Declare GLOBAL variables
    private List <Opportunity> oppList = new List <Opportunity>();
    private List <OpportunityLineItem> prodList = new List <OpportunityLineItem>();
    private List <OpportunityLineItem> addRowList = [SELECT PricebookEntry.Product2.Name, quantity, unitprice, totalprice
                                                    FROM OpportunityLineItem
                                                    WHERE OpportunityID = :ApexPages.currentPage().getParameters().get('id')];
    //********
   
     public LineItem_Controller(ApexPages.StandardController controller)
        {
        }
   
    //Get the Opportunity Detail Inforamation from the Opportunity Detail Page and return a list of that information.
    public List <Opportunity> getOpportunityInfo()
    {
        List <Opportunity> opp_InfoList = [SELECT name, ownerID, createddate, stagename, amount
                               FROM Opportunity
                               WHERE id = :ApexPages.currentPage().getParameters().get('id')];
        oppList = opp_InfoList;
   
    return opp_infoList;
    }
   
    //Get the Product Detail Information associated with the Opportunity. The WHERE queries whatever Opportunity ID is currently in context.
    public List <OpportunityLineItem> getProductInfo()
    {
        List <OpportunityLineItem> prod_InfoList = [SELECT PricebookEntry.Product2.Name, quantity, unitprice, totalprice
                                                    FROM OpportunityLineItem
                                                    WHERE OpportunityID = :ApexPages.currentPage().getParameters().get('id')];
        prodList = prod_InfoList;
       
        return prod_InfoList;
    }
  
   
    //****SAVE AND CANCEL METHODS
    OpportunityLineItem opportunity = new OpportunityLineItem();
    public List <OpportunityLineItem> productID = [SELECT PricebookEntry.Pricebook2ID
                                                   FROM OpportunityLineItem
                                                   WHERE OpportunityID = :ApexPages.currentPage().getParameters().get('id')];

   
//***GET OPPORTUNITY ID
    String opportunityID = ApexPages.currentPage().getParameters().get('id');
   
   
  
      
  
       
       
   
    public PageReference cancel() {
       PageReference cancelReference = new ApexPages.StandardController(opportunity).view();
        cancelReference.setRedirect(true);
        return cancelReference;
    }

    public PageReference save() {
        update prodList;
        update oppList;
        PageReference reference = new ApexPages.StandardController(opportunity).view();
        reference.setRedirect(true);
        return reference;
    }
   
   
   //***Navigate to the appropriate Product Selection Screen based on the OpportunityID. 
    public PageReference addProduct()
    {
      update prodList;
        update oppList;
        PageReference reference = new PageReference('https://na15.salesforce.com/p/opp/SelectSearch?addTo='+opportunityID+'&retURL=%2F'+opportunityID);
        reference.setRedirect(true);
        return reference;
       
       
    }
   
    //******
   
   
  

}