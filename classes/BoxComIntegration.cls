public with sharing class BoxComIntegration {
    //Fetched from URL
    private String code ;
    private string key = 'mjilqaw1lotpaqavp73i7kvcfjpo1h61';
    private string secret = 'OusdHzrusvosXgApwbmj1DuIo8EwWa1r' ;
    private string redirect_uri = 'https://sar-dev-ed--c.na30.visual.force.com/apex/taboverride';
    
    public BoxComIntegration()
    {
        code = ApexPages.currentPage().getParameters().get('code') ;  
        //Get the access token once we have code
        if(code != '' && code != null)
        {
            AccessToken() ;
        }
        
    }
    
    public PageReference BoxAuth()
    {
        //Authenticating
        AccessToken();
        //PageReference pg = new PageReference(BoxAuthUri (key , redirect_uri)) ;
        return null ;
    }
    
    public String BoxAuthUri(String Clientkey,String redirect_uri)
    {
        String key = EncodingUtil.urlEncode(Clientkey,'UTF-8');
        String uri = EncodingUtil.urlEncode(redirect_uri,'UTF-8');
        String authuri = '';
        authuri = 'https://account.box.com/api/oauth2/authorize?'+
        'client_id='+key+
        '&response_type=code'+
        '&redirect_uri='+uri+
        '&state=security_token%3DOusdHzrusvosXgApwbmj1DuIo8EwWa1r';
        
        return authuri;
    }
    
    
    public void AccessToken()
    {
        //Getting access token from google
        String testbody='{"iss": "mjilqaw1lotpaqavp73i7kvcfjpo1h61","sub": "6069167843","box_sub_type": "user","grant_type":"urn:ietf:params:oauth:grant-type:authorization_code","aud": "https://api.box.com/oauth2/token","client_secret": "OusdHzrusvosXgApwbmj1DuIo8EwWa1r","exp": 1428699385}';
        
        
        
        
        
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setheader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
        req.setheader('Content-Type', 'application/json');
        req.setEndpoint('https://api.box.com/oauth2/token');
        String messageBody = 'iss='+key+'&sub= 6069167843&box_sub_type=user'+'&grant_type=authorization_code'+'';
        req.setHeader('Content-length', String.valueOf(testbody.length()));
        req.setBody(testbody);
        req.setTimeout(60*1000);

        Http h = new Http();
        String resp;
        HttpResponse res = h.send(req);
        resp = res.getBody();
         Map<String,object> responseMap =(Map<String,object>)JSON.deserializeUntyped(res.getBody()) ;  
          
         system.debug('***************'+responseMap);
}
}