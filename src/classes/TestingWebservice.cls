@RestResource(urlMapping='/TestingWebservice/*')
global class TestingWebservice{
      @HttpPost
      global static String accountCreated(String str) {
      insert new Log__c(Description__c=str);
         
        System.debug(LoggingLevel.DEBUG, 'Hello coming in Webservice - TestingWebservice' + str);
        return str;
        
       }

}