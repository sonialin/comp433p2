create database if not exists ecommerce;

use ecommerce;

CREATE TABLE if not exists `ProductOwner` (
  `ProductOwnerID` INT NOT NULL,
  `ProductOwnerName` VARCHAR(255) NULL,
  `ProductOwnerType` VARCHAR(255) NULL,
  PRIMARY KEY (`ProductOwnerID`))
ENGINE = InnoDB;

CREATE TABLE if not exists `Partner` (
  `PartnerID` INT NOT NULL,
  `PartnerName` VARCHAR(255) NULL,
  `PartnerType` VARCHAR(255) NULL,
  `Pasword` VARCHAR(45) NULL,
  `Username` VARCHAR(45) NULL,
  `Address` VARCHAR(255) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `ProductOwner_ProductOwnerID` INT NOT NULL,
  PRIMARY KEY (`PartnerID`),
  INDEX `fk_Partner_ProductOwner1_idx` (`ProductOwner_ProductOwnerID` ASC),
  CONSTRAINT `fk_Partner_ProductOwner1`
    FOREIGN KEY (`ProductOwner_ProductOwnerID`)
    REFERENCES `ProductOwner` (`ProductOwnerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE if not exists `Product` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(255) NULL,
  `ProductPrice` DECIMAL(10, 2) NULL,
  `ProductDescription` TEXT NULL,
  `ProductOwner_ProductOwnerID` INT NOT NULL,
  `ProductQuantity` INT NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `fk_Product_ProductOwner1_idx` (`ProductOwner_ProductOwnerID` ASC),
  CONSTRAINT `fk_Product_ProductOwner1`
    FOREIGN KEY (`ProductOwner_ProductOwnerID`)
    REFERENCES `ProductOwner` (`ProductOwnerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE if not exists `Customer` (
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NULL,
  `Firstname` VARCHAR(45) NULL,
  `Lastname` VARCHAR(45) NULL,
  `Address` TEXT NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`Username`))
ENGINE = InnoDB;

CREATE TABLE if not exists `ProductReview` (
  `ProductReviewID` INT NOT NULL,
  `ProductReviewContent` TEXT NULL,
  `Rating` INT NULL,
  `ProductReviewDate` DATETIME NULL,
  `Product_ProductID` INT NOT NULL,
  `Customer_Username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ProductReviewID`),
  INDEX `fk_ProductReview_Product1_idx` (`Product_ProductID` ASC),
  INDEX `fk_ProductReview_Customer1_idx` (`Customer_Username` ASC),
  CONSTRAINT `fk_ProductReview_Product1`
    FOREIGN KEY (`Product_ProductID`)
    REFERENCES `Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductReview_Customer1`
    FOREIGN KEY (`Customer_Username`)
    REFERENCES `Customer` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE if not exists `Order` (
  `OrderID` INT NOT NULL,
  `OrderPrice` DECIMAL(10, 2) NULL,
  `OrderStatus` VARCHAR(45) NULL,
  `Customer_Username` VARCHAR(45) NOT NULL,
  `OrderDate` DATETIME NULL,
  `Shipping Address` TEXT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Order_Customer1_idx` (`Customer_Username` ASC),
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`Customer_Username`)
    REFERENCES `Customer` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE if not exists `Payment` (
  `CardType` VARCHAR(45) NULL,
  `CardNumber` INT NULL,
  `ExpirationDate` DATETIME NULL,
  `SecurityCode` INT NULL,
  `BillingName` VARCHAR(255) NULL,
  `BillingAddress` TEXT NULL,
  `Order_OrderID` INT NOT NULL,
  PRIMARY KEY (`Order_OrderID`),
  CONSTRAINT `fk_Payment_Order1`
    FOREIGN KEY (`Order_OrderID`)
    REFERENCES `Order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE if not exists `OrderStatus` (
  `Order_OrderID` INT NOT NULL,
  `StatusName` VARCHAR(45) NOT NULL,
  `StatusID` INT NOT NULL,
  PRIMARY KEY (`Order_OrderID`, `StatusID`),
  INDEX `fk_OrderStatus_Order1_idx` (`Order_OrderID` ASC),
  CONSTRAINT `fk_OrderStatus_Order1`
    FOREIGN KEY (`Order_OrderID`)
    REFERENCES `Order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE if not exists `Cart` (
  `CartID` INT NOT NULL,
  `CartPrice` DECIMAL(10, 2) NULL,
  `Order_OrderID` INT NOT NULL,
  `Tax` DECIMAL(10, 2) NULL,
  PRIMARY KEY (`CartID`, `Order_OrderID`),
  INDEX `fk_Cart_Order1_idx` (`Order_OrderID` ASC),
  CONSTRAINT `fk_Cart_Order1`
    FOREIGN KEY (`Order_OrderID`)
    REFERENCES `Order` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `CartLineItem` (
  `Cart_CartID` INT NOT NULL,
  `CartLineItemQuantity` INT NULL,
  `CartLineItemPrice` DECIMAL(10, 2) NULL,
  `Product_ProductID` INT NOT NULL,
  INDEX `fk_CartLineItem_Cart1_idx` (`Cart_CartID` ASC),
  PRIMARY KEY (`Cart_CartID`, `Product_ProductID`),
  INDEX `fk_CartLineItem_Product1_idx` (`Product_ProductID` ASC),
  CONSTRAINT `fk_CartLineItem_Cart1`
    FOREIGN KEY (`Cart_CartID`)
    REFERENCES `Cart` (`CartID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CartLineItem_Product1`
    FOREIGN KEY (`Product_ProductID`)
    REFERENCES `Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `OrderStatus` (
  `StatusName` VARCHAR(45) NOT NULL,
  `StatusID` INT NOT NULL,
  PRIMARY KEY (`StatusID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Customer` (
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NULL,
  `Firstname` VARCHAR(45) NULL,
  `Lastname` VARCHAR(45) NULL,
  `Address` TEXT NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`Username`))
ENGINE = InnoDB;
