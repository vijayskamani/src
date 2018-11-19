public class JWT {
    
    public String alg='RS256' ;//{get;set;}
    public String iss ='mjilqaw1lotpaqavp73i7kvcfjpo1h61';// {get;set;}
    public String sub ='6069167843';//{get;set;}
    public String aud = 'https://api.box.com/oauth2/token';//{get;set;}
    public String exp {get;set;}
    public String iat {get;set;}
    public Map<String,String> claims {get;set;}
    public Integer validFor {get;set;}
    public String cert {get;set;}
    public String pkcs8 {get;set;}
    public String privateKey ='MIIFDjBABgkqhkiG9w0BBQ0wMzAbBgkqhkiG9w0BBQwwDgQIml+PH0uSdwoCAggA\nMBQGCCqGSIb3DQMHBAhkKnRy1c1kCwSCBMgaML4VyF87RoamEmfCvw5nXi3bJhUy\n/mVxYl+w3/w3w8JceuejlguaNWYwSO/gmBh4NVrz3DBxvwUK6sMptx734g3kY1s7\nkMMbczij+IqFq/m0zGZIajFwGGy11fedSPwzcqN/+PLJdaHou2HiBIvwAMoeWzY+\nbMp8Xn3kwm8rMGH5djpMTRuVvQmBnMEdd73mWPPMAHv7yJlNoaJ7/Cx51PoCtX5w\ndarEfFwg449GYc6dPr8+oH0csZuEJVMmkHDp3bkB25RRNXbtHuR9VrN5hmENclX3\nXC7Og6mseM4UM6x3bH3OrwVUEEVBkorkV4LUDg21dAa6Odr/z5cZ7moMsoS8ODlQ\ndQeQK1V2n42snyyULT2PRGyEdvVp+Tr34c08ly6BcIIYjMkOYQp4qCYmpwy1YQxd\nAz62pScvNVGSm3WriPNmuWC+xPUzCGj+z7UGErmNokldkdpQreCn+jIK9B3b0dDe\nDRL2k9QCT+kDBOZIU043tCkxKe6UyL6VnIF92iiKNLcs5913HDslm16KT3eHG8yr\naxAXdEORIUA1dwCJoWlv6ecakTIVnBiFO+7E0MsAZ5ZqaQbyy+gESj1kiQpCnGGl\nZgbXR2qfbU7jA8uIPgURokzjkvI2hvWs4TH5PzVdPBy8JOryhMLrjJsI826sZPK+\nvZKbdUig6FS4IhBUdT0ASdRsHPe0yKOrqF4d/nObuu7teEcbOnSc4kS0WtDmmOCr\nnM37DpAU94toeYm2j0JHRckseoXi/IZWk8yMoKdB00JMswj1l/cgQJBFJNPzZZxr\n2Dl0Z9mVDqFj8nSyKOUXKZxjBV/zDuNGi3r2+eXg9Hms0y54VGqSy5JfZpjUNyJ6\n0JDQK8Nz/YrKWOjpke4QN+B8f8yxN/fukGfiZGB3EsFaGnNpkmxiA37zCz5RoBIj\nCkAPsWjpvSxvwkPtoRqM4zFVQ1fJZgZWWo1k/iC3pVufhwqvB/DIaqTWSfCy8hHl\ntuGLggOXTp0k/SBKE4YSJsBafs3CRwMFoSjxgeWtZU+DZ8SGSMB6SGK+EzykO2pY\nxyMgqqv2w00qypBwsY4oKbbk1cI+uE9LosMNc1YhD1z6UcQSKwBgB8/uDPiH8SAB\nHW6x+jutHHUHs1Duk6LuxWbrvBS6UhV94EfAJiRR2VX5r9S37NbAyE69JoHAwo2O\nBcE+lVwxWuLFqYF0HBlwO3mj3Rw55VmrzlCUZbBoAShWVT0f85DJFjpTDMenpoZX\nREJ7eJqgdFaZxJm0v9qP9cjeWFMHvtL57K65qUZzx0sJdtbghbOu1m6T1Dx4plkW\nVPiIX3xAihFbI3hPH7tfB1RF3vAPID0kMUKCfgGfzI9R1VVJJMMkmCynKJcgo/LJ\nBgXuS7AvZ4E4jYop7+pQ3qZrGtDNPDi39IxhzP3mNZEu/eug1fmP2nH8FBghshWA\nP/6NpLfBDoJvv86YDm8a3HGznsRen6NvNMVAYVGICKKO3sD9SNp3FOn7cEo8CoNu\nS4h1XMB07XnVxGyXk6LWMPTM1TygObV3gKNaw89o+ep9WRejemMvx2RbKmw1XY30\nXc+jIjPFKykfdo6DkxvLUaoWiYwCMOeGC4VxUvZpAgsoMBIOoMUDUu+sGwAgiVMf\nY6M=';//{get;set;}
    
    
    public static final String HS256 = 'HS256';
    public static final String RS256 = 'RS256';
    public static final String NONE = 'none';

    
    public JWT(String alg) {
        this.alg = alg;
        this.validFor = 300;
    }
    
    
    public String issue() {
    
        String jwt = '';
    
        JSONGenerator header = JSON.createGenerator(false);
        header.writeStartObject();
        header.writeStringField('alg', this.alg);
        header.writeEndObject();
        String encodedHeader = base64URLencode(Blob.valueOf(header.getAsString()));
            
        JSONGenerator body = JSON.createGenerator(false);
        body.writeStartObject();
        body.writeStringField('iss', this.iss);
        body.writeStringField('sub', this.sub);
        body.writeStringField('aud', this.aud);
        Long rightNow = (dateTime.now().getTime()/1000)+1;
        body.writeNumberField('iat', rightNow);
        body.writeNumberField('exp', (rightNow + validFor));
        if (claims != null) {
            for (String claim : claims.keySet()) {
                body.writeStringField(claim, claims.get(claim));
            }
        }
        body.writeEndObject();
        
        jwt = encodedHeader + '.' + base64URLencode(Blob.valueOf(body.getAsString()));
        
        if ( this.alg == HS256 ) {
            Blob key = EncodingUtil.base64Decode(privateKey);
            Blob signature = Crypto.generateMac('hmacSHA256',Blob.valueof(jwt),key);
            jwt += '.' + base64URLencode(signature);  
        } else if ( this.alg == RS256 ) {
            Blob signature = null;
            
            if (cert != null ) {
                signature = Crypto.signWithCertificate('rsa-sha256', Blob.valueOf(jwt), cert);
            } else {
                Blob privateKey = EncodingUtil.base64Decode(pkcs8);
                signature = Crypto.sign('rsa-sha256', Blob.valueOf(jwt), privateKey);
            }
            jwt += '.' + base64URLencode(signature);  
        } else if ( this.alg == NONE ) {
            jwt += '.';
        }
        
        return jwt;
    
    }
    

    public String base64URLencode(Blob input){ 
        String output = encodingUtil.base64Encode(input);
        output = output.replace('+', '-');
        output = output.replace('/', '_');
        while ( output.endsWith('=')){
            output = output.subString(0,output.length()-1);
        }
        return output;
    }
    

}