CREATE TABLE Customer (
	cust_jumin		VARCHAR(20) PRIMARY KEY,
	cust_name		VARCHAR(20) NOT NULL,
	cust_addr		VARCHAR(100) NOT NULL,
	cust_birth		DATE,
	cust_email		VARCHAR(50) UNIQUE,
	cust_phnum		VARCHAR(25) NOT NULL,
	cust_job			VARCHAR(30)
);

CREATE TABLE Card (
    card_no            CHAR(14) PRIMARY KEY NOT NULL,
    cust_jumin         VARCHAR(20),
    acc_id             CHAR(14),
    card_register_date DATE,
    card_limit_money   INT(10),
    card_approve_date  DATE,
    card_type          VARCHAR(10) NOT NULL,
    FOREIGN KEY (cust_jumin) REFERENCES Customer(cust_jumin),
    FOREIGN KEY (acc_id) REFERENCES ACCOUNT(acc_id)
);

CREATE TABLE ACCOUNT (
    acc_id            CHAR(14) PRIMARY KEY,
    acc_type          VARCHAR(20) NOT NULL,
    acc_balance       INT NOT NULL,
    acc_card          CHAR(1) NOT NULL,
    acc_register_date DATETIME,
    cust_jumin        VARCHAR(20),
    FOREIGN KEY (cust_jumin) REFERENCES Customer(cust_jumin)
);

CREATE TABLE TRANSACTION (
    trans_id        INT PRIMARY KEY AUTO_INCREMENT,
    trans_acc_id    CHAR(14),
    trans_type      VARCHAR(20),
    trans_message   VARCHAR(20),
    trans_money     INT,
    trans_date      DATETIME
    );
