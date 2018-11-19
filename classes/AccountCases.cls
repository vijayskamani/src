public class AccountCases 
{
  private List<Case> Cas;
  private Contact cntact;
  public AccountCases(ApexPages.StandardController controller)
  {
    this.cntact= (Contact)controller.getRecord();
  }
  public List<Case> getCas()
  {
    Contact con = [Select id, Account.id FROM Contact where id = :cntact.id];
    if (con.Account == null) return null;
    Cas= [Select id, CaseNumber, Contact.Name, Subject, Status, Priority, CreatedDate, ClosedDate from Case where Account.id = :con.Account.id];
    return Cas;
  }
}