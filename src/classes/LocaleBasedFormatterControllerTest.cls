/************************************LocaleBasedFormatterControllerTest ***********************************
This class is the test class for the LocaleBasedFormatterController class.
-----------------------------------------------------------
Created: Prateek Saxena (Deloitte)
Version: 1.0
-----------------------------------------------------------
Change Log:
-----------------------------------------------------------
v1.0    05.05.2016    Created by Prateek

******************************************************************************/
@isTest
private Class LocaleBasedFormatterControllerTest {

@testSetup static void setTestData(){
	Date_Time_Locale_Formats__c dateTimeFormat = new Date_Time_Locale_Formats__c();
	dateTimeFormat.Name = 'en_US';
	dateTimeFormat.Date_Time_Format__c = 'M/d/yyyy h:mm a';
	dateTimeFormat.Date_Format__c = 'MM/DD/YYYY';
	Insert dateTimeFormat;
}

static testMethod void testing(){
	Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
	User u = new User(Alias = 'standt', Email='testingLocale@india.com', 
		EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
		LocaleSidKey='en_US', ProfileId = p.Id, 
		TimeZoneSidKey='America/Los_Angeles', UserName='testingLocale@india.com');
	Insert u;
	System.runAs(u) {
		LocaleBasedFormatterController localeBasedFormatter = new LocaleBasedFormatterController ();
	    String dateFormat = localeBasedFormatter.getconstructDateFormat();
	    String dateTimeFormat = localeBasedFormatter.getconstructDateTimeFormat();
	    System.assertEquals('MM/DD/YYYY',dateFormat);
	}
}
}