public class testpdf {
 Public account a{get; set;}
    public testpdf(){
    a = [select id,add_info__c from account where id='0013600001Z60Wu'];
    }

}