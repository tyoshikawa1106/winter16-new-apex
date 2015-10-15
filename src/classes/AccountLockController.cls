public with sharing class AccountLockController {

    public List<AccountLockWrapper> wrapperList {get; set;}
    public String key {get; set;}

    public AccountLockController() {
        this.wrapperList = new List<AccountLockWrapper>();
        this.key = '';
    }

    public void doSearch() {
        List<Account> accounts = this.getAccounts(this.key);
        this.wrapperList = new List<AccountLockWrapper>();
        for (Account account : accounts) {
            this.wrapperList.add(new AccountLockWrapper(account));
        }
    }
    
    public void doRecordLock() {
        List<Account> lockAccounts = new List<Account>();
        for (AccountLockWrapper w : this.wrapperList) {
            if (w.isChecked) {
                lockAccounts.add(w.Account);
                w.isChecked = false;
            }
        }
        
        if (lockAccounts.isEmpty()) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please Record Check'));
            return;
        }
        
        Approval.LockResult[] results = Approval.lock(lockAccounts, false);

        for(Approval.LockResult result : results) {
            if (result.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Successfully locked Account with ID: ' + result.getId()));
            } else {
                // Operation failed, so get all errors                
                for(Database.Error err : result.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Account fields that affected this error: ' + err.getFields()));
                }
            }
        }
    }
    
    public void doRecordUnLock() {
        List<Account> unLockAccounts = new List<Account>();
        for (AccountLockWrapper w : this.wrapperList) {
            if (w.isChecked) {
                unLockAccounts.add(w.Account);
                w.isChecked = false;
            }
        }
        
        if (unLockAccounts.isEmpty()) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please Record Check'));
            return;
        }
        
        Approval.UnLockResult[] results = Approval.unlock(unLockAccounts, false);

        for(Approval.UnLockResult result : results) {
            if (result.isSuccess()) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Successfully unlocked Account with ID: ' + result.getId()));
            } else {
                // Operation failed, so get all errors                
                for(Database.Error err : result.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Account fields that affected this error: ' + err.getFields()));
                }
            }
        }
    }

    private List<Account> getAccounts(String searchKey) {
        String key = searchKey + '%';
        return [
            SELECT
                 Id
                ,Name
            FROM
                Account
            WHERE
                Name LIKE: key
            ORDER BY Name ASC
            LIMIT 200
        ];
    }
}