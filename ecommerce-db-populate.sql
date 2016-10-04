INSERT INTO `ProductOwner` (`ProductOwnerID`, `ProductOwnerName`, `ProductOwnerType`) 
VALUES (1, 'Amazon', 'Platform');

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

INSERT INTO `ProductOwner` (`ProductOwnerID`, `ProductOwnerName`, `ProductOwnerType`) 
VALUES (2, 'Samsung', 'Partner');

INSERT INTO `Partner` (`PartnerID`, `PartnerName`, `PartnerType`, `Pasword`, `Username`, `Address`, `PhoneNumber`, `ProductOwner_ProductOwnerID`) VALUES (1, "Samsung", "Company", "123456", "samsung", "200 S Frontage Rd, Burr Ridge, IL 60527", "(630) 568-3072", 2);

INSERT INTO `Product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductOwner_ProductOwnerID`, `ProductQuantity`) 
VALUES (11, 'Samsung Galaxy J5 SM-J500H/DS GSM Factory Unlocked Smartphone, International Version (Gold)', 
159.49, 'Samsung Galaxy J5 SM-J500H/DS GSM Factory Unlocked Smartphone, International Version (White) no Warranty 2G Bands: GSM 850/900/1800/1900 3G Bands: 850/900/1900/2100 5.0" Super AMOLED Capacitive Multi-Touchscreen w/ Protective Corning Gorilla Glass Android OS, v5.1 (Lollipop), Quad-core 1.2 GHz Adreno 306 Processor, Chipset: Qualcomm MSM8916 13MP Primary Camera autofocus LED flash, 5.0MP Front Camera LED flash 8GB Internal Memory, Dual Sim Card', 
2, 10);

INSERT INTO `Customer` (`Username`, `Password`, `Firstname`, `Lastname`, `Address`, `PhoneNumber`, `Email`) VALUES ('sonialin', '123456', 'Sonia', 'Lin', '1032 W Sheridan Rd, Chicago, IL 60660', '(773) 274-3000', 'jlin@luc.edu');

INSERT INTO `OrderStatus` (`StatusName`, `StatusID`) VALUES ('Paid', 1);
INSERT INTO `OrderStatus` (`StatusName`, `StatusID`) VALUES ('Processed', 2);
INSERT INTO `OrderStatus` (`StatusName`, `StatusID`) VALUES ('Shipped', 3);
INSERT INTO `OrderStatus` (`StatusName`, `StatusID`) VALUES ('Delivered', 4);

INSERT INTO `Cart` (`CartID`, `CartPrice`, `Tax`) VALUES (1, 159.49, 9.97);
INSERT INTO `CartLineItem` (`Cart_CartID`, `Product_ProductID`, `CartLineItemQuantity`, `CartLineItemPrice`) VALUES (1, 11, 1, 159.49);

INSERT INTO `Order` (`OrderID`, `OrderPrice`, `Customer_Username`, `OrderDate`, `Shipping Address`, `OrderStatus_StatusID`, `Cart_CartID`) VALUES (1, 169.46, 'sonialin', 20160930, '1032 W Sheridan Rd, Chicago, IL 60660', 1, 1);

INSERT INTO `Payment` (`CardType`, `CardNumber`, `ExpirationDate`, `SecurityCode`, `BillingName`, `BillingAddress`, `Order_OrderID`) VALUES ('Visa', '1234223432344234', 20170501, 999, 'Sonia Lin', '1032 W Sheridan Rd, Chicago, IL 60660', 1);

INSERT INTO `ProductReview` (`ProductReviewID`, `ProductReviewContent`, `Rating`, `ProductReviewDate`, `Product_ProductID`, `Customer_Username`) VALUES (1, 'Great phone and arrived on time.', 5, 20161001, 11, 'sonialin');
