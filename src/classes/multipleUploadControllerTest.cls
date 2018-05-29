/*
    Class name   : multipleUploadControllerTest
    Description  : It is the test class for the controller of the component 'MultipleUpload'. 
*/
@isTest
private class multipleUploadControllerTest{
    
    private static testmethod void uploadAttachmentsTest(){
        MultipleUploadController contr = new MultipleUploadController();
        contr.maxFiles = 2000;
        contr.FileCount = '4';
        System.assertEquals(contr.filesCountList.size() , contr.maxFiles);
        contr.parentId = createAccount();
        contr.ChangeCount();
        addAttachments(contr);
        contr.saveAttachments();
        
        List<Attachment> lstAttachments = [Select name from Attachment where parentId = : contr.parentId];
        System.assert(lstAttachments.size()>0, 'Attachments not uploaded');
    }
    
    private static testmethod void uploadAttachmentsWithoutParentId(){
        MultipleUploadController contr = new MultipleUploadController();
        contr.maxFiles = 2000;
        contr.FileCount = '4';
        System.assertEquals(contr.filesCountList.size() , contr.maxFiles);
        // not providing the parent Id
        Id parentAccId = createAccount();
        contr.ChangeCount();
        addAttachments(contr);
        contr.saveAttachments();
        
        List<Attachment> lstAttachments = [Select name from Attachment where parentId = : parentAccId];
        System.assertEquals(lstAttachments.size(),0);
    }
    
    private static testmethod void uploadAttachmentsWithoutFileCount(){
        MultipleUploadController contr = new MultipleUploadController();
        contr.maxFiles = 2000;
        // Not providing the file count (It defaults to zero)
        contr.FileCount = '0';
        System.assertEquals(contr.filesCountList.size() , contr.maxFiles);
        contr.parentId = createAccount();
        contr.ChangeCount();
        addAttachments(contr);
        contr.saveAttachments();
        
        List<Attachment> lstAttachments = [Select name from Attachment where parentId = : contr.parentId];
        System.assertEquals(lstAttachments.size(),0);
    }
    
    private static testmethod void uploadAttachmentsWithoutAnyFiles(){
        MultipleUploadController contr = new MultipleUploadController();
        contr.maxFiles = 2000;
        contr.FileCount = '4';
        System.assertEquals(contr.filesCountList.size() , contr.maxFiles);
        contr.parentId = createAccount();
        contr.ChangeCount();
        // not adding any files
        //addAttachments(contr);
        contr.saveAttachments();
        
        List<Attachment> lstAttachments = [Select name from Attachment where parentId = : contr.parentId];
        System.assertEquals(lstAttachments.size(),0);
    }
    
    private static void addAttachments(MultipleUploadController contrObj){
        for(integer i = 0; i<Integer.valueOf(contrObj.FileCount); i++){
            contrObj.allFileList [i].name = 'test ' + i;
            contrObj.allFileList [i].body = Blob.valueOf('test ' + i);
        }
    }
    
    private static id createAccount(){
        Account acc = new Account(name = 'testAccount');
        insert acc;
        return acc.id;
    }
}