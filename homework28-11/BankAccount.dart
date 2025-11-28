class BankAccount {
    String _accountNumber;
    double _balance;

    BankAccount(this._accountNumber, this._balance);

    // я бы добавил в методы deposit и withdraw возврат true/false, но по условию задачи это не требуется.
    void deposit(double amount){
        if(amount > 0 ){
            this._balance += amount;
        }
        
    }

    void withdraw(double amount){
        if(amount <= this._balance && amount > 0){
            this._balance -= amount;
        }
    }
    
    double getBalance()
    {
        return this._balance;
    }
}