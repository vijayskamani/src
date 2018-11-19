public class Nanostuffs_clsConvertLead
{
public PageReference convert()
{
try
{
String id = ApexPages.currentpage().getParameters().get('id');
string cmid;
 if(ApexPages.currentPage().getParameters().get('cmid') != null){
          cmid= ApexPages.currentPage().getParameters().get('cmid');
          system.debug('*****'+cmid); 
          
        
        }
        campaignmember cm=[select id,   contact_id__c from campaignmember where id=:cmid];   
Database.LeadConvert lc = new Database.LeadConvert();
lc.setLeadId(id);
lc.setDoNotCreateOpportunity(true);

LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
lc.setConvertedStatus(convertStatus.MasterLabel);

Database.LeadConvertResult lcr = Database.convertLead(lc);
if(lcr.isSuccess())
{
String cId = lcr.getContactId();
cm.contact_id__c =cid;
update cm;
PageReference redirect = new PageReference('/' + cId);
redirect.setRedirect(true);
return redirect;
}
}
catch(Exception e)
{
ApexPages.addMessages(e);
}
return null;
}

}