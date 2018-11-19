public class testforbox{
public static void callout(){
String jwtHeader = '{"typ":"JWT","alg":"RS256","alg":"RS256","kid":"shzbsxe7"}';
string iss='mjilqaw1lotpaqavp73i7kvcfjpo1h61';//Client ID
string sec='OusdHzrusvosXgApwbmj1DuIo8EwWa1r';//Client Secret
string sub='6069167843';//user id
string aud='https://api.box.com/oauth2/token';
string box_sub_type='user';
long exp = 1539177460;//DateTime.now().addMinutes(1).getTime();
//String key = 'MIIFDjBABgkqhkiG9w0BBQ0wMzAbBgkqhkiG9w0BBQwwDgQIEB16YEFnejoCAggA\nMBQGCCqGSIb3DQMHBAh9RvrBN9vbmwSCBMhkYPGcHYMlwPL2hVSOZTwNv6QxhABH\nFPn5sminaPj6VLlpkuJQj65pZrYI+5rXoOaWAROwuhz1qoyK3pFd1BfZv2EO0olM\nlbHXvnMDlKVB673uFE55t9+FsrMKD2BELBf1YWChUywGNM/UXHKBVWofQBbQ7tDd\na9G/loOsBomWb02TnW5yKy1onDMZwWviFyF3SVzxeYONR9oAPH4zPBYRe2fONrLN\nKihoraCcF7d8zZI5C7egVVSv7E+2C9asB+3MQqQHqp8Q6crhBZbAY/AZV3vKZVRl\nMVvsuUGFWTouni41X2TWHB7pjt3rJwdri0/o5V94fL3D1ItqoksN42euVny0JQoR\n7jC2LlAdLJ4f8puwKGU7Cf4qvXw9TqVGphnfRQSrzJjO1jCPAEX3q6Tb6xtbkWI1\nkPbmOlgOyZXQzgIzVifrKHTGLHaf+W18bimMozQtY2rAadPuUYZx8elaWkUYokZt\nSv8I2dJClNLKDc3OODYzuDx5wm7sTT3kMCyYDBC0vpclA+r3ahq/vAaDLyw4sZq6\nUwdJnu24Gku4RpC+gsTO7jsjN0D8IEkXJLizAN/Cri5sJDq2zpNbilCzZbpHwl1l\nmxg8pXXm9uUrB/pBkRzi0fuwO9r0T1nKuj7XLWl1xTSZ0/HwmwBErFL2+QvlaAD0\n668QPsPiV7uI1+oIDxNXliIaoKSe64ivGXJt9E7xtuA+k4qcp7NxPMjerORzDqry\nEKLgQg6LhQUpmu1SaLVmpawGFIn4ZKeFYx/ZBAhn22ruDG69NNt+45TebD9RHZ2T\nvl/Ib5oASd4gQrhHTweKqR2WKfnalBrkIkkY8bWN6c6CUfYZjtOoeNRs4J6ssZgw\nAmTE2laSvxvuotCc2mO19VnljfVBe2AAUCpUBwvbv3JAGw8N8wg3vC7yU/Ys7eXi\nIuBSxWRnk9qJ/i2P7tvgu5lHkzZrwrHztZ2/FZq+7Wb79cxCI7qOxRc0G6DAThxA\ntojvt+u/UNY0ss9ptT69oGrGkQu4MAl1YssRaN8eOUMYZkFq89i255Ey2xo8fCoz\neA8QivSbwBAHUr7I3E+gsA8n5ZZAt60RV8cBkt1bavccLh0IdsXwjWJNDBMOiy1s\npcdcL5PdnvfJeFQLgh2B4NAkZf2wkfxMrO9DoNGiEMDrkpGaBNOxhLqzmZk7vTtA\ngQMpuRAVr9pCzRIBHwM1pT0XMFGTtSc+Gq3flDKusrYBaERsuiX07cLMu8lqsSOD\nA1EzDzxCAkN12ArK4Fv/eBQx1WwC1EDWfPNd0Dc8UwYlWQh2YfCDcziPnGx+Ilg+\nHPhDfb7pBt2/lk5gzw/6U0XiPb/oU/vj94cIixG0Y3a/7FiIioQvfE11KZU1cICz\ndErTrN5WyXmYKJVG5Ro8B4JqaOQbUgWB8CN4bp3KwiYqLJmG1+ScTFGCOMZ6V7/P\nDEazNuWkvRmy8Jz1qtEmFEczE1UVAULzGdMpsT+HR4kjmlP7hW4SalVbhSimUR7J\nHHBHV3h1TswSPssqCmhH98BKNgReKnhq2e7D1yUWR9JCKtJzX3D1FTw/45j0ZZAE\ntGgUpHCdxU5E6nCjRuAxm0iVOGBNYQMwvBzRkxiQnZ2eYa9elbY1QFmp1a8z6dB+\nDV4=\n';
String key =label.key;
blob pk=System.encodingUtil.base64Decode(key);
String jwtClaims = '{"iss":"' + iss + '","sub":"' + sub + '","aud":"' + aud + '","exp":' + exp + ',"jti":"' + sec +'","box_sub_type":"' + box_sub_type +'"}';
String jwtRequest = System.encodingUtil.base64Encode(Blob.valueOf(jwtHeader)).replace('+', '-').replace('/', '_') + '.' + System.encodingUtil.base64Encode(Blob.valueOf(jwtClaims)).replace('+', '-').replace('/', '_');
system.debug('jwtClaims::'+jwtClaims);
Blob signature = Crypto.sign('RSA-SHA256', Blob.valueOf(jwtRequest), Blob.valueOf(key));
//Blob signature = Crypto.generateMac('HmacSHA256', Blob.valueOf(jwtRequest), Blob.valueOf(key));

String signedJwtRequest = jwtRequest+'.'+System.encodingUtil.base64Encode(signature);
system.debug('signedJwtRequest::'+signedJwtRequest);
String payload = 'grant_type=' + System.EncodingUtil.urlEncode('urn:ietf:params:oauth:grant-type:jwt-bearer', 'UTF-8');
payload += '&assertion=' + signedJwtRequest+'&client_id='+iss+'&client_secret='+sec;

Http httpObj = new Http();
HttpRequest req = new HttpRequest();
HttpResponse res;

req.setEndpoint('https://api.box.com/oauth2/token');
req.setMethod('POST');
req.setheader('Content-Type', 'application/json');
req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
req.setBody(payload);

res = httpObj.send(req);
system.debug('Res'+res.getbody());


}

}