public class createDynamicTableProcess {

public list<contact> cons{set;get;}
public string contactid {set;get;}
public list<subcontactwrapper> scw{set;get;}
public createDynamicTableProcess ()
{
    cons=new list<contact>();

    list<string> accids=new list<string>();
        for(account a1:[select id from account])
            {
            accids.add(a1.id);
            }

       cons=[select id,name,phone,account.industry from contact where accountid in:accids limit 10];
} //constructor closed

//method for button click for every contact.
public void createRecordForSubContact()
{
scw=new list<subcontactwrapper>();
subcontactwrapper s1=new subcontactwrapper();
scw.add(s1);


}

public class subcontactwrapper
{
public boolean flag {set;get;}
public string name {set;get;}
public string country {Set;get;}
public date  startdate {Set;get;} 
}
}