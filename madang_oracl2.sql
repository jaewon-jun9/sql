SELECT SUM(saleprice) from orders;
SELECT SUM(saleprice) AS 총매출 from orders;
SELECT SUM(saleprice) AS 총매출 from orders WHERE custid=2;
SELECT SUM(saleprice) AS total,AVG(saleprice) AS Average,min(saleprice) AS min,max(saleprice) as max from orders ;
SELECT COUNT(*) from orders;
SELECT custid, COUNT(*) AS 도서수량, SUM(saleprice) AS 총액 FROM orders GROUP BY custid;
SELECT custid, COUNT(*) AS 도서수량, SUM(saleprice) AS 총액
FROM Orders
GROUP BY custid;
SELECT custid, COUNT(*) AS 도서수량
FROM Orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(*) >= 2;

SELECT custid, COUNT(*) AS 도서수량
FROM Orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(*) > 0;



SELECT bookid,bookname from book where bookid=1;
SELECT bookname,price from book where price >=20000;
SELECT SUM(saleprice) from orders where custid=1;
SELECT SUM(saleprice)

             FROM Customer, Orders

             WHERE Customer.custid=Orders.custid

                           AND Customer.name LIKE '박지성';
SELECT COUNT(*) from orders where custid=1;
SELECT COUNT(*) FROM Customer, Orders

             WHERE Customer.custid=Orders.custid

             AND Customer.name LIKE '박지성';
SELECT COUNT(*) from book;
SELECT COUNT(DISTINCT publsher) from book ;
SELECT name,address from customer;
SELECT orderid,orderdate from orders WHERE orderdate>='2014/07/04' AND orderdate<='2014/07/07';
SELECT orderid,orderdate from orders WHERE not orderdate>='2014/07/04' AND orderdate<='2014/07/07';

SELECT name,address from customer where name LIKE '김%';
SELECT name,address from customer where name LIKE '김_아';

SELECT *
FROM Customer, Orders
WHERE Customer.custid =Orders.custid;

SELECT name, saleprice
FROM Customer, Orders
WHERE Customer.custid =Orders.custid;

SELECT name, SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid =Orders.custid
GROUP BY Customer.name
ORDER BY Customer.name;

SELECT Customer.name, Book.bookname
FROM Customer, Orders, Book
WHERE Customer.custid =Orders.custid
AND Orders.bookid =Book.bookid;

SELECT Customer.name, Book.bookname
FROM Customer, Orders, Book
WHERE Customer.custid =Orders.custid AND Orders.bookid =Book.bookid
AND Book.price =20000;

SELECT Customer.name, saleprice
FROM Customer LEFT OUTER JOIN
Orders ON Customer.custid =Orders.custid;
SELECT Customer.name, saleprice
FROM Customer, Orders
WHERE Customer.custid =Orders.custid(+);

SELECT bookname
FROM Book
WHERE price = ( SELECT MAX(price)
FROM Book);

SELECT name
FROM Customer
WHERE custid IN (SELECT custid
FROM Orders);

SELECT name
FROM Customer
WHERE custid IN (SELECT custid
FROM Orders
WHERE bookid IN (SELECT bookid
FROM Book
WHERE publsher='대한미디어'));


1 마당서점의고객이 요구하는 다음 질문에 대해 SQL 문을작성하시오.;
(5) 박지성이구매한 도서의 출판사 수;
SELECT count(publisher)
FROM book
WHERE bookid IN (SELECT bookid
FROM Orders
WHERE custid IN (SELECT custid
FROM customer
WHERE name='박지성'));
(6)박지성이 구매한 도서의 이름, 가격, 정가와판매가격의 차이;
SELECT book.bookname,book.price,orders.saleprice,book.price-orders.saleprice
FROM book,orders
WHERE book.bookid=orders.bookid AND book.bookid IN (SELECT bookid
FROM Orders
WHERE custid IN (SELECT custid
FROM customer
WHERE name='박지성'));
(7) 박지성이구매하지 않은 도서의 이름;
SELECT bookname
FROM book
WHERE bookid not IN (SELECT bookid
FROM Orders
WHERE custid IN (SELECT custid
FROM customer
WHERE name='박지성'));
2 마당서점의운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을작성하시오.;
(8) 주문하지않은 고객의 이름(부속질의사용);
SELECT name
FROM customer
WHERE custid not IN (SELECT custid
FROM orders);
(9)주문 금액의 총액과 주문의 평균 금액;
SELECT SUM(saleprice),AVG(saleprice) from orders;
(10) 고객의 이름과 고객별 구매액;
SELECT name, SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid =Orders.custid
GROUP BY Customer.name;
(11) 고객의이름과 고객이 구매한 도서 목록;
SELECT customer.name,book.bookname from customer,book,orders where customer.custid=orders.custid AND book.bookid=orders.bookid;
(12) 도서의가격(Book 테이블)과판매가격(Orders 테이블)의 차이가가장 많은 주문;
SELECT * from book,orders where book.bookid=orders.bookid AND book.price-orders.saleprice=(SELECT MAX(book.price-orders.saleprice)
FROM book,orders
WHERE book.bookid=orders.bookid AND book.bookid IN (SELECT bookid
FROM Orders
WHERE custid IN (SELECT custid
FROM customer)));
(13) 도서의판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름;
SELECT name FROM customer WHERE custid IN (SELECT custid FROM orders GROUP BY custid HAVING AVG(saleprice) > (SELECT AVG(saleprice) FROM orders));


select custid,(select address FROM customer cs where cs.custid=od.custid) "address",
SUM(saleprice) "total" FROM orders od GROUP BY od.custid;
--(1)고객 별 아이디, 주소(address)와 총 구매액(total)

select cs.name, s
FROM (select custid, AVG(saleprice) s
from orders GROUP BY custid) od, customer cs
where cs.custid=od.custid;
--(2)고객 별 이름과 평균 구매액(s)

select SUM(saleprice) "total"
FROM orders od
where EXISTS (select * from customer cs
where custid <= 3 AND cs.custid=od.custid);
--(3)고객 id 가 3 이하인 고객들의 총 도서구매액(total)
