/************************************LocaleBasedFormatterController ***********************************
This custom controller gets the data i.e. String Formats for Date & DateTime from the 
Custom Metadata type based on the locale of the User.
-----------------------------------------------------------
Created: Prateek Saxena (Deloitte)
Version: 1.0
-----------------------------------------------------------
Change Log:
-----------------------------------------------------------
v1.0    05.05.2016    Created by Prateek

******************************************************************************/
public Class LocaleBasedFormatterController {

public String strUserLocale {get; set;}

/*******************************************************************************************************************************************
*Constructor
**********************************************************************************************************************************/
public LocaleBasedFormatterController (){
    strUserLocale = UserInfo.getLocale();
}

/*******************************************************************************************************************************************
* Method Name: getconstructDateFormat
* Description: Gets the date String format based on the locale of the User from the Custom Setting.
* Return Type: String (date format).
****************************************************************************************************************************************/
public String getconstructDateFormat(){
    System.debug('****************** In Method getconstructDateFormat()');
    if (String.isNotEmpty(strUserLocale)){
        Date_Time_Locale_Formats__c dttimelocaleFormats = Date_Time_Locale_Formats__c.getValues(strUserLocale); 
        System.debug('****************** In Method getconstructDateFormat()');
        if (null != dttimelocaleFormats)
            return dttimelocaleFormats.Date_Format__c;
    }
    return null;
}

/*******************************************************************************************************************************************
* Method Name: getconstructDateTimeFormat
* Description: Gets the DateTime String format based on the locale of the User from the Custom Setting.
* Return Type: String (dateTime format).
****************************************************************************************************************************************/
public String getconstructDateTimeFormat(){
    System.debug('****************** In Method getconstructDateTimeFormat()');
    if (String.isNotEmpty(strUserLocale)){
        Date_Time_Locale_Formats__c dttimelocaleFormats = Date_Time_Locale_Formats__c.getValues(strUserLocale); 
        System.debug('****************** In Method getconstructDateTimeFormat()');
        if (null != dttimelocaleFormats)
            return dttimelocaleFormats.Date_Time_Format__c;
    }
    return null;
}

}