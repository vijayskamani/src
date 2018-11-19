public class ParkLocator {
    public static string[] country(String country) {
        ParkService.parksImplPort park = new ParkService.ParksImplPort();
        return park.byCountry(country);
    }
}