public with sharing class AccountRecordTypeInfoWrapper {
    
    public String recordTypeName {get; set;}
    public Id recordTypeId {get; set;}
    public Boolean isAvailable {get; set;}
    public Boolean isDefaultRecordTypeMapping {get; set;}
    public Boolean isMaster {get; set;}
    
    public AccountRecordTypeInfoWrapper() {
        this.recordTypeName = '';
        this.recordTypeId = null;
        this.isAvailable = false;
        this.isDefaultRecordTypeMapping = false;
        this.isMaster = false;
    }
    
    public AccountRecordTypeInfoWrapper(Schema.RecordTypeInfo info) {
        this.recordTypeName = info.getName();
        this.recordTypeId = info.getRecordTypeId ();
        this.isAvailable = info.isAvailable();
        this.isDefaultRecordTypeMapping = info.isDefaultRecordTypeMapping();
        this.isMaster = info.isMaster();
    }
}