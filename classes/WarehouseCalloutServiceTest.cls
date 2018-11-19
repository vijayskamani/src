@isTest
private class WarehouseCalloutServiceTest {
  // implement your mock callout test here
  @isTest
    static void WarehouseEquipmentSync(){
        Test.startTest();
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock()); 
        // This causes a fake response to be sent from the class that implements HttpCalloutMock. 
        WarehouseSyncSchedule syncMe = new WarehouseSyncSchedule();
        Datetime dt = Datetime.now().addMinutes(3);
        String CRON_EXP = '0 '+ dt.minute() + ' * ' + dt.day() + ' ' + dt.month() + ' ? ' + dt.year();
        String jobID = System.schedule('Test the Queue Status', CRON_EXP, syncMe);
        CronTrigger cTId = [SELECT State FROM CronTrigger WHERE Id = :jobID];
        System.assertEquals('WAITING', String.valueOf(cTId.State), 'jobID Doesnt Match');
        Test.stopTest();             
        
    }
    
}