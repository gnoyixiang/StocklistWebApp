
CREATE SCHEMA `stockistteam8db` ;  

   

   

USE stockistteam8db;  

   

CREATE TABLE `stockistteam8db`.`user` (  

  `username` VARCHAR(15) NOT NULL,  

  `password` VARCHAR(45) NOT NULL,  

  `role` VARCHAR(50) NOT NULL,  

`status` varchar(10) DEFAULT 'active', 

  PRIMARY KEY (`username`));  

   

   

CREATE TABLE `stockistteam8db`.`customer` (  

  `customerid` INT(15) NOT NULL AUTO_INCREMENT,  

  `customername` VARCHAR(45) NOT NULL,  

  `address` VARCHAR(255) NOT NULL,  

  `country` VARCHAR(50) NOT NULL,  

  `contactnumber` INT(15) NOT NULL,  

  PRIMARY KEY (`customerid`));  

   

   

CREATE TABLE `stockistteam8db`.`supplier` (  

  `supplierid` INT(15) NOT NULL AUTO_INCREMENT,  

  `suppliername` VARCHAR(45) NOT NULL,  

  `address` VARCHAR(255) NOT NULL,  

  `country` VARCHAR(45) NOT NULL,  

  `contactnumber` VARCHAR(45) NOT NULL,  

  `contactname` VARCHAR(45) NOT NULL,  

  `website` VARCHAR(255) NULL,  

`status` varchar(10) DEFAULT 'active', 

  PRIMARY KEY (`supplierid`));  

   

   

CREATE TABLE `stockistteam8db`.`product` (  

  `partnumber` INT(15) NOT NULL AUTO_INCREMENT,  

  `unitprice` DECIMAL(15) NOT NULL,  

  `description` VARCHAR(255) NULL,  

  `colour` VARCHAR(15) NOT NULL,  

  `dimension` VARCHAR(50) NOT NULL,  

  `manufacturer` VARCHAR(50) NOT NULL,  

  `supplierid` INT(15) NOT NULL,  

  `reorderlevel` INT(15) NOT NULL,  

  `minimumreorderquantity` INT(15) NOT NULL,  

  `shelflocation` VARCHAR(50) NOT NULL,  

  `stock` INT(15) NOT NULL,  

`status` varchar(10) DEFAULT 'active', 

  PRIMARY KEY (`partnumber`), 

  CONSTRAINT `supplier_fk`   

  FOREIGN KEY (`supplierid`)  

  REFERENCES `supplier` (`supplierid`)   

  ON DELETE NO ACTION  

  ON UPDATE NO ACTION 

);  

   

   

   

CREATE TABLE `stockistteam8db`.`transaction` (  

  `transactionid` int NOT NULL,  

  `customerid` int(15) NOT NULL,  

    `consumedate` DATETIME NOT NULL,  

  `username` VARCHAR(15) NOT NULL,  

  PRIMARY KEY (`transactionid`),   

  CONSTRAINT `username_fk`   

  FOREIGN KEY (`username`)  

  REFERENCES `user` (`username`)   

  ON DELETE NO ACTION  

  ON UPDATE NO ACTION,  

  CONSTRAINT `customerid_fk`   

  FOREIGN KEY (`customerid`)  

  REFERENCES `customer` (`customerid`)   

  ON DELETE NO ACTION  

  ON UPDATE NO ACTION);  

   

   

CREATE TABLE `stockistteam8db`.`transactiondetails` (  

  `transactionid` int NOT NULL,  

  `partnumber` int(15) NOT NULL,  

  `quantity` int NOT NULL,  

PRIMARY KEY (`transactionid`, `partnumber`),  

CONSTRAINT `transactiondetails_transaction_fk`  

    FOREIGN KEY (`transactionid`)  

    REFERENCES `stockistteam8db`.`transaction` (`transactionid`)  

    ON DELETE NO ACTION  

    ON UPDATE NO ACTION,  

  CONSTRAINT `transactiondetails_product_fk`  

    FOREIGN KEY (`partnumber`)  

    REFERENCES `stockistteam8db`.`product` (`partnumber`)  

    ON DELETE NO ACTION  

    ON UPDATE NO ACTION);  

   

CREATE TABLE `stockistteam8db`.`order` (  

  `orderid` int NOT NULL AUTO_INCREMENT,  

  `supplierid` int NOT NULL,  

    `orderdate` DATETIME NOT NULL,  

  `username` VARCHAR(15) NOT NULL,  

  PRIMARY KEY (`orderid`),  

CONSTRAINT `order_supplier_fk`  

FOREIGN KEY (`supplierid`) REFERENCES `stockistteam8db`.`supplier`(`supplierid`)  

ON DELETE NO ACTION  

ON UPDATE NO ACTION) ; 

  

CREATE TABLE `stockistteam8db`.`orderdetails` (  

  `orderid` int NOT NULL,  

  `partnumber` int(15) NOT NULL,  

  `orderquantity` DATE NOT NULL,  

PRIMARY KEY (`orderid`, `partnumber`),  

CONSTRAINT `orderdetails_order_fk`  

    FOREIGN KEY (`orderid`)  

    REFERENCES `stockistteam8db`.`order` (`orderid`)  

    ON DELETE NO ACTION  

    ON UPDATE NO ACTION,   

   CONSTRAINT `orderdetails_product_fk`  

    FOREIGN KEY (`partnumber`)  

    REFERENCES `stockistteam8db`.`product` (`partnumber`)  

    ON DELETE NO ACTION  

    ON UPDATE NO ACTION);  

  

CREATE TABLE `stockistteam8db`.`damage` (  

  `damageid` int NOT NULL auto_increment, 

  `partnumber` int NOT NULL, 

  `quantity` INT(15) NOT NULL,  

  `senddate` DATETIME NULL,  

  `receivedate` DATETIME NULL,  

  `status` VARCHAR(50) NULL,  

  PRIMARY KEY (`damageid`),  

CONSTRAINT `damage_product_fk`  

    FOREIGN KEY (`partnumber`)  

    REFERENCES `stockistteam8db`.`product` (`partnumber`)  

    ON DELETE NO ACTION  

    ON UPDATE NO ACTION);  

   

 

 

    

  

INSERT INTO `stockistteam8db`.`user` 

(`username`, 

`password`, 

`role`) 

VALUES 

('dongcheng', 

'password', 

'mechanic'); 

  

  

  

INSERT INTO `stockistteam8db`.`user` 

(`username`, 

`password`, 

`role`) 

VALUES 

('mengkiak', 

'password', 

'admin'); 

   

  

INSERT INTO `stockistteam8db`.`user` 

(`username`, 

`password`, 

`role`) 

VALUES 

('junye', 

'password', 

'mechanic'); 

 

INSERT INTO `stockistteam8db`.`user` 

(`username`, 

`password`, 

`role`) 

VALUES 

('amit', 

'password', 

'admin'); 

  

 INSERT INTO `stockistteam8db`.`user` 

(`username`, 

`password`, 

`role`) 

VALUES 

('yixiang', 

'password', 

'mechanic'); 

 

INSERT INTO `stockistteam8db`.`user` 

(`username`, 

`password`, 

`role`) 

VALUES 

('nathalie', 

'password', 

'admin'); 

 

INSERT INTO `stockistteam8db`.`user` 

(`username`, 

`password`, 

`role`) 

VALUES 

('yufei', 

'password', 

'admin'); 

 

INSERT INTO `stockistteam8db`.`user` 

(`username`, 

`password`, 

`role`) 

VALUES 

('anni', 

'password', 

'admin'); 

 

INSERT INTO `stockistteam8db`.`user` 

(`username`, 

`password`, 

`role`) 

VALUES 

('khaing', 

'password', 

'admin'); 

 

INSERT INTO `stockistteam8db`.`user` 

(`username`, 

`password`, 

`role`) 

VALUES 

('suria', 

'password', 

'admin'); 

 

 

INSERT INTO `stockistteam8db`.`customer`  

( `customername`,  

  `address`,  

  `country`,  

  `contactnumber` )  

VALUES  

('Toyota',  

'123 Toyota Rd',  

'Japan' , 

'91234567');  

  

INSERT INTO `stockistteam8db`.`customer`  

( `customername`,  

  `address`,  

  `country`,  

  `contactnumber` )  

VALUES  

('Honda',  

'123 Honda Rd',  

'Japan' , 

'92345678');  

  

INSERT INTO `stockistteam8db`.`customer`  

( `customername`,  

  `address`,  

  `country`,  

  `contactnumber` )  

VALUES  

('Hyundai',  

'123 Hyundai Rd',  

'South Korea' , 

'93456789');  

  

INSERT INTO `stockistteam8db`.`customer`  

( `customername`,  

  `address`,  

  `country`,  

  `contactnumber` )  

VALUES  

('BMW',  

'123 BMW Rd',  

'Germany' , 

'94567891');  

  

INSERT INTO `stockistteam8db`.`customer`  

( `customername`,  

  `address`,  

  `country`,  

  `contactnumber` )  

VALUES  

('Audi',  

'123 Audi Rd',  

'Germany' , 

'95678912');  

  

  

INSERT INTO `stockistteam8db`.`customer`  

( `customername`,  

  `address`,  

  `country`,  

  `contactnumber` )  

VALUES  

('Mercedes-Benz',  

'123 Mercedes Rd',  

'Germany' , 

'96789123');  

  

INSERT INTO `stockistteam8db`.`customer`  

( `customername`,  

  `address`,  

  `country`,  

  `contactnumber` )  

VALUES  

('Proton',  

'123 Proton Rd',  

'Malaysia' , 

'97891234');  

  

  

INSERT INTO `stockistteam8db`.`customer`  

( `customername`,  

  `address`,  

  `country`,  

  `contactnumber` )  

VALUES  

('Cherry QQ',  

'123 Cherry QQ Rd',  

'China' , 

'98912345');  

 

INSERT INTO `stockistteam8db`.`supplier` 

( 

  `suppliername` , 

  `address` , 

  `country` , 

  `contactnumber` , 

  `contactname` , 

  `website`  

) 

VALUES 

( 

'JAE AUTO PTE LTD', 

'Blk 3018 Ubi Rd 1, #01-121 Singapore 408710', 

'Singapore', 

'64179796', 

'Tan Ah Kow', 

'http://www.jaeauto.com.sg' 

); 

INSERT INTO `stockistteam8db`.`supplier` 

( 

  `suppliername` , 

  `address` , 

  `country` , 

  `contactnumber` , 

  `contactname` , 

  `website`  

) 

VALUES 

( 

'minghee auto pte ltd', 

'8, Jalan Lembah Kallang, #01-01 Min Ghee Building, Singapore 339564', 

'Singapore', 

' 62983888', 

'Xiao xiao niao', 

'http://www.minghee.com' 

); 

INSERT INTO `stockistteam8db`.`supplier` 

( 

  `suppliername` , 

  `address` , 

  `country` , 

  `contactnumber` , 

  `contactname` , 

  `website`  

) 

VALUES 

( 

'ccb pte ltd', 

'25 Heng Mui Keng Terrace',  

'Singapore', 

'6500000', 

'Ji Bai Ren', 

'http://www.ccb.com' 

); 

INSERT INTO `stockistteam8db`.`supplier` 

( 

  `suppliername` , 

  `address` , 

  `country` , 

  `contactnumber` , 

  `contactname` , 

  `website`  

) 

VALUES 

( 

'Spare-parts zone pte ltd', 

'14 ANG MO KIO STREET 63 

SINGAPORE - 569116 ',  

'Singapore', 

'63837545', 

'Lim Xiao Gao', 

'www.spz.sg' 

); 

INSERT INTO `stockistteam8db`.`supplier` 

( 

  `suppliername` , 

  `address` , 

  `country` , 

  `contactnumber` , 

  `contactname` , 

  `website`  

) 

VALUES 

( 

'Mercteil', 

'14 ANG MO KIO STREET 63 

SINGAPORE - 569116 ',  

'Singapore', 

'63837545', 

'Lim Xiao Gao', 

'www.spz.sg' 

); 

 

INSERT INTO `stockistteam8db`.`product` 

(`partnumber`, 

`unitprice`, 

`description`, 

`colour`, 

`dimension`, 

`manufacturer`, 

`supplierid`, 

 `reorderlevel`, 

  `minimumreorderquantity`, 

  `shelflocation`, 

  `stock` 

) 

VALUES 

('3652', 

'50', 

'wheel hub', 

'grey', 

'25cm', 

'Bridgestone', 

'1', 

'250', 

'70', 

'A', 

'400' 

); 

INSERT INTO `stockistteam8db`.`product` 

(`partnumber`, 

`unitprice`, 

`description`, 

`colour`, 

`dimension`, 

`manufacturer`, 

`supplierid`, 

 `reorderlevel`, 

  `minimumreorderquantity`, 

  `shelflocation`, 

  `stock` 

) 

VALUES 

('3653', 

'70', 

'tyre', 

'black', 

'40cm', 

'Bridgestone', 

'1', 

'700', 

'80', 

'B', 

'800' 

); 

INSERT INTO `stockistteam8db`.`product` 

(`partnumber`, 

`unitprice`, 

`description`, 

`colour`, 

`dimension`, 

`manufacturer`, 

`supplierid`, 

 `reorderlevel`, 

  `minimumreorderquantity`, 

  `shelflocation`, 

  `stock` 

) 

VALUES 

('3654', 

'150', 

'Brake pad', 

'black', 

'20cm', 

'Bridgestone', 

'1', 

'500', 

'40', 

'C', 

'480' 

); 

 

 

INSERT INTO `stockistteam8db`.`product` 

(`partnumber`, 

`unitprice`, 

`description`, 

`colour`, 

`dimension`, 

`manufacturer`, 

`supplierid`, 

 `reorderlevel`, 

  `minimumreorderquantity`, 

  `shelflocation`, 

  `stock` 

) 

VALUES 

('3655', 

'20', 

'front lights', 

'transparent', 

'15cm', 

'Tai Teng Electric', 

'2', 

'700', 

'50', 

'D', 

'1000' 

); 

 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`, `status`) VALUES ('3656', '32', 'rear lights', 'luminous pink', '20cm', 'Ferra', '3', '400', '50', 'E', '350', 'active'); 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`, `status`) VALUES ('3657', '21', 'wheel hub', 'dark green', '50cm', 'Casumina', '4', '500', '40', 'F', '400', 'active'); 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`, `status`) VALUES ('3658', '100', 'seat cover', 'leather brown', '100cm', 'Toyota', '2', '100', '20', 'G', '120', 'active'); 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`, `status`) VALUES ('3659', '60', 'paint', 'dark green', '20cm', 'TOA', '2', '100', '40', 'H', '96', 'active'); 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`, `status`) VALUES ('3660', '700', 'tyre', 'transparent', '50cm', 'Tesla', '3', '50', '10', 'I', '35', 'active'); 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`, `status`) VALUES ('3661', '1000', 'wheel hub', 'transparent', '25cm', 'Tesla', '4', '50', '10', 'K', '42', 'active'); 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`, `status`) VALUES ('3662', '800', 'front lights', 'transparent', '15cm', 'Ferra', '3', '50', '10', 'L', '13', 'active'); 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`, `status`) VALUES ('3663', '900', 'rear lights', 'transparent', '15cm', 'Ferra', '3', '50', '10', 'M', '24', 'active'); 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`, `status`) VALUES ('3664', '300', 'paint', 'black matte', '20cm', 'Dulux', '2', '50', '10', 'N', '45', 'active'); 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`, `status`) VALUES ('3665', '400', 'seat cover', 'leather green', '100cm', 'Toyota', '3', '40', '10', 'O', '50', 'active'); 

INSERT INTO `stockistteam8db`.`supplier` (`supplierid`, `suppliername`, `address`, `country`, `contactnumber`, `contactname`, `website`) VALUES ('6', 'zuppermann autospares pte ltd', '65 Ubi Road 1 #01-86 Oxley Bizhub S(408729)', 'Singapore', '64437708', 'Batman Bin Suparman', 'zupermann.com'); 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`) VALUES ('470133843', '101', 'Air Filter Element for Lamborghini Aventador LP700', 'clear', '50cm', 'Lamborghini', '6', '50', '10', 'D', '100'); 

 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`) VALUES ('196868', '314', ' Gearbox Mounting for Ferrari F599 / F612 ', 'black', '100cm', 'Lamborghini', '6', '50', '10', 'D', '100'); 

 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`) VALUES ('205743', '326', 'Genuine Ferrari Gearbox Pressure Sensor', 'white', '100cm', 'Ferrari', '6', '20', '5', 'D', '50'); 

 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`) VALUES ('670001545', '56', 'Maserati Genuine Parts Air Filter ', 'white', '50cm', 'Maserati', '6', '100', '20', 'A', '110'); 

 

INSERT INTO `stockistteam8db`.`product` (`partnumber`, `unitprice`, `description`, `colour`, `dimension`, `manufacturer`, `supplierid`, `reorderlevel`, `minimumreorderquantity`, `shelflocation`, `stock`) VALUES ('197654', '47.6', 'Purflux Oil Filter for Ferrari F360, F355, F348, F50 & Mondial', 'black', '10cm', 'Ferrari', '6', '50', '5', 'C', '100'); 

 

  

INSERT INTO `stockistteam8db`.`damage` (`damageid`, `partnumber`, `quantity`, `senddate`, `status`) VALUES ('1', '3652', '2', '2017-12-12 00:00:00', 'sent'); 

  


 