public with sharing class AccountLockWrapper {

    public Boolean isChecked {get; set;}
    public Account account {get; set;}

    public AccountLockWrapper() {
        this.isChecked = false;
        this.account = new Account();
    }

    public AccountLockWrapper(Account account) {
        this.isChecked = false;
        this.account = account;
    }
}