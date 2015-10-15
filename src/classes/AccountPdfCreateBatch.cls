public with sharing class AccountPdfCreateBatch implements Database.Batchable<sObject>, Database.Stateful {
    
    private AccountPdfCreateBatchHelper helper = new AccountPdfCreateBatchHelper();
    
    public AccountPdfCreateBatch() {
        
    }
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query = ' SELECT Id FROM Account ';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<Account> accounts) {
        List<Attachment> attachments = new List<Attachment>();
        for (Account account : accounts) {
            PageReference pageRef = this.helper.getAccountPDF(account.Id);
            Attachment attachment = this.helper.getAttachment(pageRef, account.Id);
            attachments.add(attachment);
        }
        
        insert attachments;
    }
    
    public void finish(Database.BatchableContext BC) {
        
    }
}