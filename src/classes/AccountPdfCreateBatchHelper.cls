public with sharing class AccountPdfCreateBatchHelper {
    
    public AccountPdfCreateBatchHelper() {
        
    }
    
    public PageReference getAccountPDF(String accountId) {
        PageReference pageRef = Page.AccountPdf;
        pageRef.getParameters().put('id', accountId);

        return pageRef;
    }

    public Attachment getAttachment(PageReference pageRef, String accountId) {

        if (pageRef == null || String.isEmpty(accountId)) {
            return new Attachment();
        }

        Attachment attachment = new Attachment(
             Name = ' ACCOUNT PDF' + '_' + DateTime.now().format('yyyyMMddHHmm') + '.pdf'
            ,Body = !Test.isRunningTest() ? pageRef.getContent() : Blob.valueOf('TEST')
            ,ParentId = accountId
        );

        return attachment;
    }
}