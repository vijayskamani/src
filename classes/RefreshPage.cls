public class RefreshPage {
    public ApexPages.StandardController stdCtrl { get; set; }

    public RefreshPage(ApexPages.standardController std) {
        stdCtrl     = std;
    }

    // Overloading standard Opportunity save behaviour
    public PageReference save() {
        stdCtrl.save();
        System.Debug('#### RefreshPage : in save()');
        return Apexpages.currentPage();
    }
}