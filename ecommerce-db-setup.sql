create database if not exists ecommerce;

use ecommerce;

CREATE TABLE if not exists `ProductOwner` (
  `ProductOwnerID` INT NOT NULL,
  `ProductOwnerName` VARCHAR(255) NULL,
  `ProductOwnerType` VARCHAR(255) NULL,
  PRIMARY KEY (`ProductOwnerID`))
ENGINE = InnoDB;

INSERT INTO `ProductOwner` (`ProductOwnerID`, `ProductOwnerName`, `ProductOwnerType`) 
VALUES (1, 'Amazon', 'Platform');

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

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductOwner_ProductOwnerID`, `ProductQuantity`) 
VALUES (1, 'Kindle Paperwhite E-reader - Black, 6\" High-Resolution Display (300 ppi) with Built-in Light, Wi-Fi - Includes Special Offers', 
119.99, 'Page Flip makes it easy to find pictures, charts, maps and even your notes and highlights from different parts of a book. While you swipe to other pages or zoom out to see page thumbnails, Page Flip automatically saves the page you’re reading, pinning it to the side of your screen so you’ll never lose your place.', 
1, 10);

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductOwner_ProductOwnerID`, `ProductQuantity`) 
VALUES (2, 'Kindle Voyage E-reader, 6" High-Resolution Display (300 ppi) with Adaptive Built-in Light, PagePress Sensors, Wi-Fi - Includes Special Offers', 
199.99, 'Kindle Voyage features a high-resolution 300 ppi display for crisp, laser quality text. The micro-etched glass screen is crafted to eliminate glare and feel like paper to the touch.', 
1, 5);

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductOwner_ProductOwnerID`, `ProductQuantity`) 
VALUES (3, 'Fire Tablet, 7" Display, Wi-Fi, 8 GB - Includes Special Offers, Black', 
49.99, 'The fast quad-core processor consists of four high-performance 1.3 GHz cores for quick app launches, smooth games and videos, and great overall performance.', 
1, 20);

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductOwner_ProductOwnerID`, `ProductQuantity`) 
VALUES (4, 'Fire HD 6 Tablet, 6" HD Display, Wi-Fi, 8 GB - Includes Special Offers, Black', 
69.99, 'Amazon engineers Fire HD tablets to hold up against everyday life. When tested against iPad mini 4 in tumble tests, Fire HD 6 proved 2x more durable.
Real scenarios, real tablets. The scenarios in our latest commercial were shot in real time using our real tablets. The drop test happens so fast that we had to slow it down using a high speed camera to show the more than 3,300 Newtons of force at the moment of impact.', 
1, 15);

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductOwner_ProductOwnerID`, `ProductQuantity`) 
VALUES (5, 'Fire HD 10 Tablet, 10.1" HD Display, Wi-Fi, 16 GB - Includes Special Offers, Silver Aluminum', 
229.99, 'Fast and responsive. The fast quad-core processor consists of two high-performance 1.5 GHz cores and two 1.2 GHz cores running simultaneously for quick app launches, smooth games and videos, and great overall performance.', 
1, 8);

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductOwner_ProductOwnerID`, `ProductQuantity`) 
VALUES (6, 'All-New Fire HD 8 Tablet, 8" HD Display, Wi-Fi, 16 GB - Includes Special Offers, Black', 
89.99, 'Fast and responsive. Enjoy your entertainment with a fast 1.3 GHz quad-core processor. Fire HD 8 now delivers faster performance thanks to a 50% increase in RAM over the previous model.', 
1, 12);

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductOwner_ProductOwnerID`, `ProductQuantity`) 
VALUES (7, 'Fire Kids Edition Tablet, 7" Display, Wi-Fi, 16 GB, Blue Kid-Proof Case', 
99.99, 'Latest generation Fire Tablet. A full-featured 7" Fire tablet with a 1024 x 600 IPS display that\'s perfect for watching movies like Frozen, plus a fast quad-core processor that ensures quick app launch times and smooth games and video. The Fire Kids Edition tablet comes in black (with a blue, pink, or green Kid-Proof Case), 8 GB or 16 GB of internal storage, and up to 128 GB of expandable storage with microSD.', 
1, 20);

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductOwner_ProductOwnerID`, `ProductQuantity`) 
VALUES (8, 'All-New Fire TV Stick with Alexa Voice Remote | Streaming Media Player', 
39.99, 'Just plug Fire TV Stick into your HDTV and start streaming in minutes. Use the included Alexa Voice Remote to find the best way to watch across more than 90 channels and apps with universal search. With the fastest Wi-Fi and most accurate voice search of any streaming media stick, shows and movies start faster and stream smoother than ever.', 
1, 20);

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductOwner_ProductOwnerID`, `ProductQuantity`) 
VALUES (9, 'Amazon Fire TV | Streaming Media Player', 
99.99, 'Now with 4K Ultra HD
Amazon Fire TV now brings you 4K Ultra HD streaming capability, giving you a best-in-class television experience with true-to-life picture quality when used with compatible 4K Ultra HD TVs—something Apple TV and Chromecast don’t support. Your 4K TV must support minimum HDCP requirements for protected content playback.', 
1, 5);

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductOwner_ProductOwnerID`, `ProductQuantity`) 
VALUES (10, 'Amazon Fire TV | Streaming Media Player', 
109.99, 'The Amazon Fire TV + HD Antenna Bundle comes with three separate products: Amazon Fire TV, an AmazonBasics Ultra Thin Indoor HDTV Antenna, and an AmazonBasics HDMI Cable (6 feet). When you use these devices together, you can access great television shows and movies without cable. Fire TV lets you stream TV shows and movies from Amazon Video, Netflix, HBO NOW, and more, while the AmazonBasics HD Antenna receives free over-the-air HD local broadcast content from stations like ABC, CBS, NBC, and FOX.', 
1, 8);

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