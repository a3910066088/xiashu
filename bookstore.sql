PRAGMA foreign_keys = TRUE;



CREATE TABLE book  
(
    book_id CHAR(5),  
    title VARCHAR(50) NOT NULL, 
    author VARCHAR(30) NOT NULL,
    publisher VARCHAR(32),
    PRIMARY KEY (book_id)
);  
INSERT INTO book 
VALUES  ("45797", "Titan's Tears","Bob", "Lucas'company"),
("45796", "Sea and the Ode","Jone", "Ken'company"),
("45795", " Grey Oracle", "Adams","Ultimate Books"),
("45794", " Dark Warrior","Jennie", "Ann'company"),
("45793", " Hidden Bone","Robert", "Ultimate Books"),
("45792", "To Catch a Dream","Joy", "Ultimate Books"),
("45791", "A God Named Sin","Adamson", "Lucas'company"),
("45790", "Spare Parts","Jane", "Ken'company"),
("44797", "Texan Born","Adson", "Ultimate Books"),
("43797", "Electric SKull","Diogo", "Ultimate Books");


CREATE TABLE book_genre  
(
    book_id CHAR(5),  
    genre VARCHAR(10) NOT NULL, 
    PRIMARY KEY (book_id),
    FOREIGN KEY (book_id) REFERENCES book
); 
INSERT INTO book_genre 
VALUES  ("45797","Science and Technology" ),
("45796", "Science and Technology"),
("45795","Science and Technology" ),
("45794", "Science and Technology"),
("45793","Science Fiction" ),
("45792","Science Fiction"  ),
("45791","Science and Technology" ),
("45790","Science and Technology" ),
("44797","Science Fiction" ),
("43797","Science Fiction" );

CREATE TABLE edition  
(
    book_id CHAR(5) ,  
    edition INT CHECK(edition >0),
    edition_type VARCHAR(10) CHECK(edition_type in("audiobook","hardcover","paperback")),
    price NUMERIC(8,2) CHECK(price>0),
    quantity_in_stock INT NOT NULL CHECK(quantity_in_stock >=0),
    PRIMARY KEY (book_id,edition,edition_type),
    FOREIGN KEY (book_id) REFERENCES book
);  

 INSERT INTO edition 
  VALUES  ("45797", 2,"audiobook", 150.00,10),
("45796", 1,"audiobook", 212.00,4),
("45795", 1, "paperback",333.00,3),
("45794", 3,"hardcover", 250.00,15),
("45793", 4,"paperback", 747.00,45),
("45792", 2,"paperback", 123.00,24),
("45791", 1,"audiobook", 1123.30,18),
("45790", 4,"hardcover", 324.00,54),
("44797", 2,"hardcover", 45.66,78),
("43797", 6,"audiobook", 666.60,3);

CREATE TABLE customer 
(
    customer_id CHAR(9) ,  
    name VARCHAR(30) NOT NULL,
    email VARCHAR(50),
    street VARCHAR(40),
    city VARCHAR(50),
    postcode VARCHAR(15),
    country VARCHAR(30),
    PRIMARY KEY (customer_id)
); 
 INSERT INTO customer 
 VALUES
 ("201323963","Alfie Vilma","Alfie123@gmail.com","Princes Street", "Edinburgh","EH2 2AN","Scotland"),
 ("211426974","Tarvis Hulda","Tarvis@gmail.com","Dean Village Street", "Edinburgh","EH4 3AY","Scotland"),
 ("223478902","Jimmy Randolph","Jimmy@gmail.com","Circus Lane Street", "Edinburgh","EH3 6SU","Scotland"),
 ("612345289","Adil Aili","Adil@gmail.com","Oldham Street","Liverpool","L1 2SU","England"),
 ("985631723","Verity Tess","Verity@gmail.com","London Road Street","Liverpool","L3 8JD","England"),
 ("238193725","Edwin Andro","Edwin@gmail.com","Skelhorne Street","Liverpool","L3 5GA","England"),
 ("714575321","Mark Hrafnildr","Mark@gmail.com","Abbotsford Street","Dundee","DD2 1DA","Scotland"),
 ("527183615","Joel Keeqan","Joel@gmail.com","Adam Crescent Street","Dundee","DD3 0SL","Scotland"),
 ("318675273","Loan Rishi","Loan@gmail.com","Glasgow Street","Glasgow","G12 8JR","Scotland"),
 ("417829373","Layton Gunnar","Laton@gmail.com","Royal Mile Street","Edinburgh","EH1 2SG","Scotland");
 





CREATE TABLE customer_phone
(
    customer_id CHAR(9) ,  
    phone_type VARCHAR(10),
    phone_number VARCHAR(15),
    PRIMARY KEY (customer_id,phone_number),
    FOREIGN KEY (customer_id) REFERENCES customer
); 

 INSERT INTO customer_phone 
 VALUES ("201323963","work","+44 7455 995229"),
 ("211426974","work","+44 7459 926227"),
 ("223478902","work","+44 7457 863539"),
 ("612345289","work","+44 7911 001165"),
 ("985631723","mobile","+44 7746 965089"),
 ("238193725","mobile","+44 7457 004927"),
 ("714575321","mobile","+44 7281 978864"),
 ("527183615","home","+44 7793 626018"),
 ("318675273","home","+44 7700 095352"),
 ("417829373","home","+44 7457 438600"),
 ("985631723","home","+44 7453 087440"),
 ("238193725","work","+44 7346 788559"),
 ("318675273","mobile","+44 7911 891428"),
 ("417829373","work","+44 7700 070878");



CREATE TABLE  book_order 
(
    customer_id CHAR(9) NOT NULL,  
    order_id CHAR(10),
    street VARCHAR(40) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postcode VARCHAR(15) NOT NULL,
    country VARCHAR(30) NOT NULL,
    date_ordered VARCHAR(15) NOT NULL,
    date_delivered VARCHAR(15) NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer
); 
 INSERT INTO book_order  
 VALUES  ("201323963","3124569873","Princes Street", "Edinburgh","EH2 2AN","Scotland","2019-01-25","2019-02-15"),
 ("211426974","6152348264","Dean Village Street", "Edinburgh","EH4 3AY","Scotland","2020-04-15","2020-05-01"),
 ("223478902","1562738294","Circus Lane Street", "Edinburgh","EH3 6SU","Scotland","2021-02-13","2021-03-08"),
 ("612345289","5447182961","Oldham Street","Liverpool","L1 2SU","United Kingdom","2020-05-15","2020-07-09"),
 ("985631723","2345124572","London Road Street","Liverpool","L3 8JD","United Kingdom","2017-01-01","2017-01-12"),
 ("238193725","4192047561","Skelhorne Street","Liverpool","L3 5GA","United Kingdom","2022-03-05","2022-04-01"),
 ("714575321","7189040127","Abbotsford Street","Dundee","DD2 1DA","Scotland","2021-06-01","2021-06-13"),
 ("527183615","9184674910","Adam Crescent Street","Dundee","DD3 0SL","Scotland","2016-07-11","2016-07-25"),
 ("318675273","3789210028","Glasgow Street","Glasgow","G12 8JR","Scotland","2018-01-09","2018-03-18"),
 ("417829373","8310204817","Royal Mile Street","Edinburgh","EH1 2SG","Scotland","2020-12-15","2020-12-30");


CREATE TABLE supplier
(
    supplier_id CHAR(6) ,  
    supplier_name VARCHAR(30) NOT NULL,
    account_no VARCHAR(15) NOT NULL UNIQUE,
    PRIMARY KEY (supplier_id)
); 

INSERT INTO supplier 
VALUES ("310962","Fabian Ross ","84312145"),
("167829","Russell Albert","87618265"),
("916386","Flectcher Rishi","18619276"),
("512839","Amir Gunnar","72182976"),
("728103","Julia Barry","67829162"),
("618203","Faith  Yima","24617291"),
("416283","Zakariya Khumbo ","87261930"),
("312932","Lee Loki","51728916"),
("719012","Yasin kannan","98176211"),
("291028","Kira Amadeo","41782192");


CREATE TABLE supplier_phone
(
    supplier_id CHAR(6) ,  
    phone_type VARCHAR(10),
    phone_number VARCHAR(15),
    PRIMARY KEY (supplier_id,phone_number),
    FOREIGN KEY (supplier_id) REFERENCES supplier
); 

INSERT INTO supplier_phone 
VALUES ("310962","work ","+44 7700 185215"),
("167829","mobile","+44 1632 960455"),
("167829","home","+44 1519 4960299"),
("916386","work","+44 1319 4960078"),
("916386","work","+44 1319 4960441"),
("512839","mobile","+44 1519 4960977"),
("728103","work","+44 1214 960871"),
("728103","home","+44 1214 960220"),
("618203","mobile","+44 1159 4960676"),
("416283","work ","+44 1139 4960383"),
("312932","work","+44 2079 460642"),
("719012","home","+44 1619 4960672"),
("291028","mobile","+44 1147 4960388");

CREATE TABLE reviews
(
    book_id CHAR(5) , 
    customer_id CHAR(9) , 
    rating  INT(1) CHECK(rating IN(1,2,3,4,5)),
    PRIMARY KEY (book_id,customer_id),
    FOREIGN KEY (book_id) REFERENCES book,
    FOREIGN KEY (customer_id) REFERENCES customer
    
);  
INSERT INTO reviews 
VALUES  ("45797","201323963",4 ),
("45796", "201323963",2),
("45795","201323963",4 ),
("45794", "211426974",5),
("45793","211426974" ,2),
("45792","211426974" ,2 ),
("45791","223478902",5 ),
("45790","612345289" ,4),
("44797","985631723",4 ),
("43797","238193725",4 ),
("45797","714575321" ,4),
("45796", "527183615",2),
("45795","318675273" ,2),
("45794", "985631723",5),
("45793","417829373" ,2),
("45792","985631723" ,2),
("45791","417829373" ,5),
("45790","714575321",2 ),
("44797","527183615",2),
("43797","417829373" ,4);


 
CREATE TABLE cotains
(
    book_id CHAR(5) , 
    order_id CHAR(10) , 
    edition INT CHECK(edition>0),
    edition_type VARCHAR(10),
    amount INT NOT NULL CHECK(amount >0),
    PRIMARY KEY (book_id,edition,edition_type,order_id),
    FOREIGN KEY (order_id) REFERENCES book_order,
    FOREIGN KEY (book_id) REFERENCES book
);  
INSERT INTO cotains 
VALUES  ("45797","3124569873",2,"audiobook",4 ),
("45796", "3124569873",1,"audiobook",1),
("45795","3124569873",1, "paperback",1 ),
("45794", "6152348264",3,"hardcover",2),
("45793","6152348264" ,4,"paperback", 3),
("45792","6152348264" ,2,"paperback",2),
("45791","1562738294",1,"audiobook",2),
("45790","5447182961" ,4,"hardcover",2),
("44797","2345124572",2,"hardcover", 2),
("43797","4192047561",6,"audiobook",1 ),
("45797","7189040127" ,2,"audiobook",3),
("45796", "9184674910",1,"audiobook",1),
("45795","3789210028" ,1, "paperback",1),
("45794", "2345124572",3,"hardcover",3),
("45793","8310204817" ,4,"paperback",2),
("45792","2345124572" ,2,"paperback",6),
("45791","8310204817" ,1,"audiobook",7),
("45790","7189040127",4,"hardcover", 12),
("44797","9184674910",2,"hardcover",8),
("43797","8310204817" ,6,"audiobook",1);


CREATE TABLE supplise
(
    book_id CHAR(5) , 
    supplier_id CHAR(6) , 
    edition INT CHECK (edition>0),
    edition_type VARCHAR(10),
    supplier_price NUMERIC(8,2) NOT NULL CHECK (supplier_price>0),
    PRIMARY KEY (book_id,edition,edition_type,supplier_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier,
    FOREIGN KEY (book_id) REFERENCES book
);  

 INSERT INTO supplise 
  VALUES ("45797","310962", 2,"audiobook", 121.4),
("45796","310962", 1,"audiobook", 182.00),
("45795","167829", 1, "paperback",303.00),
("45794","167829", 3,"hardcover", 210.00),
("45793", "916386",4,"paperback", 680.00),
("45792","916386", 2,"paperback", 111.11),
("45791","512839", 1,"audiobook", 999.99),
("45790", "512839",4,"hardcover", 285.00),
("44797","728103", 2,"hardcover", 35.56),
("43797","728103", 6,"audiobook", 600.00),
("45797","618203", 2,"audiobook", 120.00),
("45796", "618203",1,"audiobook", 172.00),
("45795", "416283",1, "paperback",293.00),
("45794","416283", 3,"hardcover", 250.00),
("45793","312932", 4,"paperback", 674.00),
("45792","312932", 2,"paperback", 96.00),
("45791","719012", 1,"audiobook", 888.30),
("45790", "719012",4,"hardcover", 274.00),
("44797", "291028",2,"hardcover", 40.66),
("43797","291028", 6,"audiobook", 588.88);



/*
--1. List all books published by “Ultimate Books” which are in the “Science Fiction” genre;
*/
SELECT *
 FROM  book b  
 WHERE b.publisher ="Ultimate Books" 
  AND b.book_id  
  IN(SELECT bg.book_id  
      FROM book_genre bg 
     WHERE bg.genre="Science Fiction");
/*
--2. List titles and ratings of all books in the “Science and Technology” genre, ordered first by rating (top rated first), and then by the title;
*/
SELECT title,rating 
 FROM
  (SELECT book_id,AVG(rating) AS rating FROM reviews r GROUP BY r.book_id) t1
 JOIN 
  (SELECT * 
    FROM book b 
    JOIN book_genre bg 
     ON b.book_id= bg.book_id 
    WHERE bg.genre="Science and Technology")t2 
   ON t1.book_id=t2.book_id 
  ORDER  BY rating DESC,title DESC;
 

/*
--3. List all orders placed by customers with customer address in the city of Edinburgh, since 2020, in chronological order, latest first;
*/
SELECT bo.* 
 FROM book_order bo  
 JOIN customer c 
  ON bo.customer_id =c.customer_id  
 WHERE  c.city ="Edinburgh"  
  AND date_ordered >"2020" 
 ORDER BY date_ordered  DESC ;
/*
--4. List all book editions which have less than 5 items in stock, together with the name, account number and supply price of the minimum priced supplier for that edition.
*/
SELECT e.book_id , e.edition,e.edition_type,s2.supplier_name,s2.account_no,t.min_supplier_price  
 FROM edition e 
 JOIN 
  (SELECT book_id ,edition,edition_type,supplier_id,MIN(supplier_price) AS min_supplier_price
    FROM supplise s  
   GROUP BY book_id ,edition ,edition_type)t 
    ON e.book_id = t.book_id 
     AND  e.edition  = t.edition
     AND e.edition_type = t.edition_type 
  JOIN  supplier s2  
    ON t.supplier_id = s2.supplier_id 
 WHERE  quantity_in_stock <5;

/*
--5. Calculate the total value of all audiobook sales since 2020 for each publisher;
*/
SELECT  publisher ,SUM(c.amount * e.price) AS sale 
 FROM book_order bo 
 JOIN cotains c  
  ON c.order_id =bo.order_id  
 JOIN  edition e  
  ON c.book_id =e.book_id 
   AND c.edition =e.edition 
   AND c.edition_type  = e.edition_type  
 JOIN  book b  
  ON e.book_id =b.book_id 
WHERE  bo.date_ordered  >"2020" 
 AND e.edition_type ="audiobook" 
GROUP BY publisher;
/*
--6. List all authors's rating(The authors' rating depends on the average of the customer's rating of the book.) ordered first by rating.
*/
SELECT b.author,AVG(rating) AS avg_rating  
 FROM  reviews r 
 JOIN book b 
  ON r.book_id = b.book_id 
 GROUP  BY b.author  
 ORDER  BY avg_rating DESC  ;
 
 /*
--7. List the number of orders for each city ordered first by amount of orders.
*/
SELECT  c.city , COUNT(bo.order_id) AS amount_orders 
 FROM customer c 
 JOIN book_order bo 
  ON c.customer_id  = bo.customer_id 
 GROUP  BY  c.city  
 ORDER  BY  amount_orders DESC  ;
 
 /*
--8.list the number of suppliers for each book edition.
*/
SELECT e.book_id ,e.edition ,e.edition_type ,COUNT(s.supplier_id) AS amount_suppliers  
 FROM  edition e 
 JOIN supplise s  
   ON e.book_id  = s.book_id  
    AND e.edition  = s.edition 
    AND e.edition_type  = s.edition_type 
 GROUP BY e.book_id ,e.edition ,e.edition_type ;
 
 /*
--appropriate views
--1.List the total number of books contains in orders for each city.ordered first by amount of books.
*/
CREATE VIEW amount_of_books_dilvering_city AS
 SELECT bo.city  ,SUM(c.amount) AS amount_of_book  
  FROM  book_order bo 
  JOIN cotains c 
   ON bo.order_id  = c.order_id  
  GROUP  BY  bo.city  
  ORDER  BY amount_of_book DESC ;
/*
 -- OUTPUT this appropriate view 
 */
 SELECT *FROM amount_of_books_dilvering_city aobdc ;

/*
--2.List the sales of all suppliers(contain all years)ordered first by of sale.
*/
CREATE  VIEW  sale_amount_of_publisher AS
 SELECT b.publisher ,SUM(e.price*c.amount) AS sale 
 FROM  cotains c  
 JOIN edition e 
  ON  c.book_id = e.book_id  
   AND  c.edition  = e.edition 
   AND c.edition_type = e.edition_type 
 JOIN book b 
  ON e.book_id  = b.book_id 
 GROUP BY b.publisher  
 ORDER BY sale DESC ; 
/*
--OUTPUT this appropriate view 
*/
SELECT  * FROM  Sale_amount_of_publisher saop ;



