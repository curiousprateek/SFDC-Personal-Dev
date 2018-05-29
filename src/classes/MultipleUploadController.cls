/*
    Class name   : MultipleUploadController
    Description  : It is the controller of the component 'MultipleUpload'. 
*/

public class MultipleUploadController
{   
    // the parent id
    public id parentId{set;get;}
    // the max attachments to be allowed
    public Integer maxFiles{get;set;}
    
    // list of attachments
    public List<Attachment> allFileList {get; set;}
    
    public MultipleUploadController()
    {
        allFileList = new List<Attachment>() ;
        allFileList.add(new Attachment());
    }
    
    /*
        method name : SaveAttachments
        parameters  : No parameters
        return type : pageReference
        description : uploads the multiple attachments to the parent record.
    */
    public Pagereference SaveAttachments()
    {
        // if parent id is not present, add error message to the page
        if(parentId == null){
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,Label.Multiple_Upload_NoRecordsAssociated_Error));
            return null;
        }

        List<Attachment> listToInsert = new List<Attachment>() ;
        
        //Attachment a = new Attachment(parentId = parentId, name=myfile.name, body = myfile.body);
        for(Attachment a: allFileList)
        {
            if(a.name != '' && a.name != '' && a.body != null)
                listToInsert.add(new Attachment(parentId = parentId, name = a.name, body = a.body)) ;
        }
        
        //Inserting attachments
        if(listToInsert.size() > 0)
        {
            insert listToInsert ;
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.INFO, listToInsert.size() + ' ' + Label.Multiple_Upload_Success_Message));
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.ERROR,Label.Multiple_Upload_SelectAtleastOneFile_Error));
        }
            
        // clearing the viewstate before returning
        allFileList.clear() ;
        allFileList.add(new Attachment());
        return null;
    }
    
}