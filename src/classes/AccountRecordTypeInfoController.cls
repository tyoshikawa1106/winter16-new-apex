public class AccountRecordTypeInfoController {
    
    public List<AccountRecordTypeInfoWrapper> recordTypeInfoWrapperList {get; set;}
    
    public AccountRecordTypeInfoController() {
        this.recordTypeInfoWrapperList = this.getAccountRecordTypeInfoWrapper();
    }
    
    private List<AccountRecordTypeInfoWrapper> getAccountRecordTypeInfoWrapper() {
        List<AccountRecordTypeInfoWrapper> recordTypeInfoWrapperList = new List<AccountRecordTypeInfoWrapper>();
        Schema.DescribeSObjectResult R = Account.SObjectType.getDescribe();
        List<Schema.RecordTypeInfo> RT = R.getRecordTypeInfos();
        for (Schema.RecordTypeInfo info : RT) {
            recordTypeInfoWrapperList.add(new AccountRecordTypeInfoWrapper(info));
        }
        
        return recordTypeInfoWrapperList;
    }
}