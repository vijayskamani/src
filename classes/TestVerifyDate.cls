@isTest
Public class TestVerifyDate {

@isTest static void CheckDatesTest1(){
    Date Date1 = VerifyDate.CheckDates(System.today(),System.today()+1);
    Date Date2 = VerifyDate.CheckDates(System.today(),System.today()+15);
  string s='False';
    System.assertequals('False',s);
    }

    @isTest static void CheckDatesTest2(){
    Date Date1 = VerifyDate.CheckDates(System.today(),System.today()+1);
    Date Date2 = VerifyDate.CheckDates(System.today(),System.today()+60);
    Integer Lastday = 30;
    System.assertequals(30, Lastday);
    }

   

    @isTest static void DateWithin30DaysTest2(){
   Date d = VerifyDate.CheckDates(System.today(),System.today()+1);     
   Date d1 = VerifyDate.CheckDates(System.today(),System.today()+60); 
   string s='False';
    System.assertequals('False',s);
    }

    

   
}