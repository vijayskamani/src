public class BoxController2 {
    @TestVisible private static String SETTING_NAME = 'CredentialsBox';
    @TestVisible private static String ACCESS_TOKEN_URL = 'https://api.box.com/oauth2/token';
    @TestVisible private static String AUTHORIZE_URL = 'https://api.box.com/oauth2/authorize';
    @TestVisible private static String FOLDER_URL = 'https://api.box.com/2.0/folders';

    @TestVisible private String access_token;
    @TestVisible private Boolean isCallback;
    
    /** The JSON result from a successful oauth call */
    public class OAuthResult {
        /** The access token */
        public String access_token {get; set;}
        
        /** The refresh token */
        public String refresh_token {get; set;}
    }
    
    /**
    * Validates the oauth code
    *
    * @param code The code to validate
    * @param redirect_uri The URL to redirect to after successful validation
    * @return The oauth result
    */
    public static OAuthResult validateCode(String code, String redirect_uri) {
        String client_id = BoxCCredentials__c.getValues(SETTING_NAME).Client_Id__c;
        String client_secret = BoxCCredentials__c.getValues(SETTING_NAME).Client_Secret__c;

        List<String> urlParams = new List<String> {
            'grant_type=authorization_code',
            'code=' + EncodingUtil.urlEncode(code, 'UTF-8'),
            'client_id=' + EncodingUtil.urlEncode(client_id, 'UTF-8'),
            'client_secret=' + EncodingUtil.urlEncode(client_secret, 'UTF-8'),
            'redirect_uri=' + EncodingUtil.urlEncode(redirect_uri, 'UTF-8')
        };

        Http h = new Http();

        HttpRequest req = new HttpRequest();
        req.setEndpoint(ACCESS_TOKEN_URL);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setHeader('Accept', 'application/json');
        String body = String.join(urlParams, '&');
        req.setBody(body);

        HttpResponse res = h.send(req);
        return (OAuthResult)(JSON.deserialize(res.getBody(), OAuthResult.class));
    }

    /**
    * Generic constructor
    */
    public BoxController2() {
       this.isCallback = ApexPages.currentPage().getParameters().containsKey('code');

        if (BoxCCredentials__c.getValues(SETTING_NAME) != null) {
            this.access_token = BoxCCredentials__c.getValues(SETTING_NAME).Access_Token__c;
        }
    }

    /**
    * Gets the authroization URL
    *
    * @return The authorization url
    */
    public String getAuthUrl() {
        Map<String, String> urlParams = new Map<String, String> {
            'client_id' => BoxCCredentials__c.getValues(SETTING_NAME).Client_Id__c,
            'redirect_uri' => getPageUrl(),
            'response_type' => 'code'
        };

        PageReference ref = new PageReference(AUTHORIZE_URL);
        ref.getParameters().putAll(urlParams);

        return ref.getUrl();
    }
    
    /**
    * Gets the page url
    * 
    * @return The page url
    */
    @testVisible
    private String getPageUrl() {
        String host = ApexPages.currentPage().getHeaders().get('Host');
        String path = ApexPages.currentPage().getUrl().split('\\?').get(0);
        
        return 'https://' + host + path;
    }
    
    /**
    * If the access token is set
    * 
    * @return If the access token is set
    */
    public Boolean getHasToken() {
        return (this.access_token != null);
    }
    
    /**
    * Validates the callback code and generates the access and refresh tokens
    * 
    * @return null to refresh the page
    */
    public PageReference redirectOnCallback() {
        if (this.isCallback) {
            String code = ApexPages.currentPage().getParameters().get('code');
            OAuthResult result = validateCode(code, this.getPageUrl());
            System.debug(result);
            
            BoxCCredentials__c creds = BoxCCredentials__c.getValues(SETTING_NAME);
            creds.Access_Token__c = result.access_token;
            creds.Refresh_Token__c = result.refresh_token;
            update creds;
        }
        
        return null;
    }
    
    private class ParentFolder {
        public String id;
        
        public ParentFolder(String id) {
            this.id = id;
        }
    }
    
    private class Folder {
        public String name;
        ParentFolder parent;
        
        public Folder(String name, String parentId) {
            this.name = name;
            this.parent = new ParentFolder(parentId);
        }
    }
    
    /**
    * Static method to create the folder inside of the box account
    * 
    * @param accountId The account id to create the folder for
    */
    @Future(callout = true)
    public static void createFolder(Id accountId) {
        if (BoxCCredentials__c.getValues(SETTING_NAME) == null) {
            return;
        }

        String access_token = BoxCCredentials__c.getValues(SETTING_NAME).Access_Token__c;
        Folder folder_info = new Folder(accountId, '0');
        
        HttpRequest request=new HttpRequest();
        request.setEndpoint(FOLDER_URL); 
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer ' + access_token);
        String body = JSON.serialize(folder_info);
        System.debug(body);
        request.setBody(body);
        
        Http p = new Http();
        HttpResponse response = p.send(request);
    }
}