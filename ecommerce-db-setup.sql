drop database ecommerce;

create database if not exists ecommerce;

use ecommerce;

CREATE TABLE if not exists `ProductOwner` (
  `ProductOwnerID` INT NOT NULL,
  `ProductOwnerName` VARCHAR(255) NULL,
  `ProductOwnerType` VARCHAR(255) NULL,
  PRIMARY KEY (`ProductOwnerID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Partner` (
  `PartnerID` INT NOT NULL,
  `PartnerName` VARCHAR(255) NULL,
  `PartnerType` VARCHAR(255) NULL,
  `Pasword` VARCHAR(45) NULL,
  `Username` VARCHAR(45) NULL,
  `ProductOwner_ProductOwnerID` INT NOT NULL,
  PRIMARY KEY (`PartnerID`),
  INDEX `fk_Partner_ProductOwner1_idx` (`ProductOwner_ProductOwnerID` ASC),
  CONSTRAINT `fk_Partner_ProductOwner1`
    FOREIGN KEY (`ProductOwner_ProductOwnerID`)
    REFERENCES `ecommerce`.`ProductOwner` (`ProductOwnerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Product` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(255) NULL,
  `ProductPrice` DECIMAL(10,2) NULL,
  `ProductDescription` TEXT NULL,
  `ProductOwner_ProductOwnerID` INT NOT NULL,
  `ProductQuantity` INT NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `fk_Product_ProductOwner1_idx` (`ProductOwner_ProductOwnerID` ASC),
  CONSTRAINT `fk_Product_ProductOwner1`
    FOREIGN KEY (`ProductOwner_ProductOwnerID`)
    REFERENCES `ecommerce`.`ProductOwner` (`ProductOwnerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Customer` (
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NULL,
  `Firstname` VARCHAR(45) NULL,
  `Lastname` VARCHAR(45) NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`Username`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`OrderStatus` (
  `StatusName` VARCHAR(45) NOT NULL,
  `StatusID` INT NOT NULL,
  PRIMARY KEY (`StatusID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Cart` (
  `CartID` INT NOT NULL,
  `CartPrice` DECIMAL(10,2) NULL,
  `Tax` DECIMAL(10,2) NULL,
  PRIMARY KEY (`CartID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`CartLineItem` (
  `Cart_CartID` INT NOT NULL,
  `Product_ProductID` INT NOT NULL,
  `CartLineItemQuantity` INT NULL,
  `CartLineItemPrice` DECIMAL(10,2) NULL,
  INDEX `fk_CartLineItem_Cart1_idx` (`Cart_CartID` ASC),
  PRIMARY KEY (`Cart_CartID`, `Product_ProductID`),
  INDEX `fk_CartLineItem_Product1_idx` (`Product_ProductID` ASC),
  CONSTRAINT `fk_CartLineItem_Cart1`
    FOREIGN KEY (`Cart_CartID`)
    REFERENCES `ecommerce`.`Cart` (`CartID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CartLineItem_Product1`
    FOREIGN KEY (`Product_ProductID`)
    REFERENCES `ecommerce`.`Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Order` (
  `OrderID` INT NOT NULL,
  `OrderPrice` DECIMAL(10,2) NULL,
  `Customer_Username` VARCHAR(45) NOT NULL,
  `OrderDate` DATETIME NULL,
  `OrderStatus_StatusID` INT NOT NULL,
  `Cart_CartID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Order_Customer1_idx` (`Customer_Username` ASC),
  INDEX `fk_Order_OrderStatus1_idx` (`OrderStatus_StatusID` ASC),
  INDEX `fk_Order_Cart1_idx` (`Cart_CartID` ASC),
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`Customer_Username`)
    REFERENCES `ecommerce`.`Customer` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_OrderStatus1`
    FOREIGN KEY (`OrderStatus_StatusID`)
    REFERENCES `ecommerce`.`OrderStatus` (`StatusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Cart1`
    FOREIGN KEY (`Cart_CartID`)
    REFERENCES `ecommerce`.`Cart` (`CartID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`ProductReview` (
  `ProductReviewID` INT NOT NULL,
  `ProductReviewContent` VARCHAR(255) NULL,
  `Rating` INT NULL,
  `ProductReviewDate` DATETIME NULL,
  `Product_ProductID` INT NOT NULL,
  `Customer_Username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ProductReviewID`),
  INDEX `fk_ProductReview_Product1_idx` (`Product_ProductID` ASC),
  INDEX `fk_ProductReview_Customer1_idx` (`Customer_Username` ASC),
  CONSTRAINT `fk_ProductReview_Product1`
    FOREIGN KEY (`Product_ProductID`)
    REFERENCES `ecommerce`.`Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductReview_Customer1`
    FOREIGN KEY (`Customer_Username`)
    REFERENCES `ecommerce`.`Customer` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Payment` (
  `CardType` VARCHAR(45) NULL,
  `CardNumber` VARCHAR(45) NULL,
  `ExpirationDate` DATETIME NULL,
  `SecurityCode` INT NULL,
  `BillingName` VARCHAR(255) NULL,
  `Order_OrderID` INT NOT NULL,
  PRIMARY KEY (`Order_OrderID`),
  CONSTRAINT `fk_Payment_Order1`
    FOREIGN KEY (`Order_OrderID`)
    REFERENCES `ecommerce`.`Order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Address` (
  `AddressID` INT NOT NULL,
  `StreetAddressLine1` VARCHAR(45) NULL,
  `StreetAddressLine2` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zipcode` VARCHAR(45) NULL,
  `Partner_PartnerID` INT NULL,
  `Customer_Username` VARCHAR(45) NULL,
  `Order_OrderID` INT NULL,
  `Payment_Order_OrderID` INT NULL,
  PRIMARY KEY (`AddressID`),
  INDEX `fk_Address_Partner1_idx` (`Partner_PartnerID` ASC),
  INDEX `fk_Address_Customer1_idx` (`Customer_Username` ASC),
  INDEX `fk_Address_Order1_idx` (`Order_OrderID` ASC),
  INDEX `fk_Address_Payment1_idx` (`Payment_Order_OrderID` ASC),
  CONSTRAINT `fk_Address_Partner1`
    FOREIGN KEY (`Partner_PartnerID`)
    REFERENCES `ecommerce`.`Partner` (`PartnerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Address_Customer1`
    FOREIGN KEY (`Customer_Username`)
    REFERENCES `ecommerce`.`Customer` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Address_Order1`
    FOREIGN KEY (`Order_OrderID`)
    REFERENCES `ecommerce`.`Order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Address_Payment1`
    FOREIGN KEY (`Payment_Order_OrderID`)
    REFERENCES `ecommerce`.`Payment` (`Order_OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`PhoneNumber` (
  `PhoneNumberID` INT NOT NULL,
  `AreaCode` VARCHAR(45) NULL,
  `Number` VARCHAR(45) NULL,
  `Partner_PartnerID` INT NULL,
  `Customer_Username` VARCHAR(45) NULL,
  PRIMARY KEY (`PhoneNumberID`),
  INDEX `fk_PhoneNumber_Partner1_idx` (`Partner_PartnerID` ASC),
  INDEX `fk_PhoneNumber_Customer1_idx` (`Customer_Username` ASC),
  CONSTRAINT `fk_PhoneNumber_Partner1`
    FOREIGN KEY (`Partner_PartnerID`)
    REFERENCES `ecommerce`.`Partner` (`PartnerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PhoneNumber_Customer1`
    FOREIGN KEY (`Customer_Username`)
    REFERENCES `ecommerce`.`Customer` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;