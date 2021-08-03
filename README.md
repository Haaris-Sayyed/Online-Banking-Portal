# Online Banking Portal

 Online banking portal, also known as internet banking, web banking is a system that enables customers of a bank or other financial institution to conduct a range of **financial transactions** through the financial institution's website.

---

## Demo
![DEMO](demo.gif)

---
## Contents
- [Getting Started](#getting-started)
- [How to run the project?](#how-to-run-the-project)
- [Usage](#usage)
- [Contributing](#🤝contributing)
---
## Getting Started

### Pre-requisites
You need to have following installed on your computer:

1. Eclipse IDE
2. Tomcat Server 
3. Mysql Workbench  


### Creating database

In order to successfully run this project on your system you need to create a  database schema **bankdb** having following two tables (using mysql workbench).

 **1.tbl_users** 
 ```
tbl_users(
    
    name varchar(40) NOT NULL,
    email varchar(40) NOT NULL,
    address varchar(45) DEFAULT NULL,
    dob varchar(10) DEFAULT NULL,
    username varchar(6) NOT NULL,
    transpin varchar(4) NOT NULL,
    mno varchar(10) DEFAULT NULL,
    brname varchar(15) DEFAULT NULL,
    password varchar(10) NOT NULL,
    accno varchar(6) NOT NULL,
    bal int(10) NOT NULL,
    PRIMARY KEY (username,accno)

 ) 
 ```

 **2.tbl_transactions**
 ```
 tbl_transactions(

    Transaction Type varchar(15) NOTNULL,
    Amount int(11) NOT NULL,  
    Date-Time varchar(45) NOT NULL,
    Status varchar(15) NOT NULL,  
    Available Balance int(11) NOT NULL,
    accno varchar(10) NOT NULL 

  ) 
 ```
***
 
 ## How to run the project?
 import project from local directory into Eclipse IDE and run the project on server.

---
 
 ## Usage
 ### 1.Login
The user can login to his/her account by entering correct username and password.
 ### 2.Register user
 The customer can register his/her info into the bank database in order to open a
new account to store money follow further transactions.
 ### 3.Dashboard
 The customer can see his/her personal information (that they entered while
registering) on this window.
 ### 4.Deposit
 The customer uses this tab in order to add specific amount to his or her bank account.
  ### 5.Withdraw
 The customer uses this tab in order to withdraw a specific amount from his or her bank
account.
### 6.Transafer
 The customer uses this tab in order to transfer a specific amount from his or her bank
account to another existing bank account.
 ### 7.Close A/C
 The customer uses this tab in order to delete his or her account
permanently from database of bank, this option shows customer the account
deletion completion message if account is deleted successfully.
### 8.Transaction History
 The customer uses this tab in order to retrieve his or her bank account’s transaction
history, which shows the customer all the details about transactions he/she did.
### 9.Balance
 The customer uses this tab in order to see his/her available balance in bank account.
 
***

## 🤝Contributing
contributions and feature requests are welcome.

1. **Fork** the repo on GitHub.
2. **Clone** the project to your own machine.
3. **Commit** changes to **development** branch.
4. **Push** your work back up to your fork.
5. Submit a **Pull request** so that I can review your changes.



---
## Show your support

Give a ⭐ if you found this project useful.

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)

---