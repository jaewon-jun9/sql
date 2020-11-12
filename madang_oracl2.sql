SELECT SUM(saleprice) from orders;
SELECT SUM(saleprice) AS �Ѹ��� from orders;
SELECT SUM(saleprice) AS �Ѹ��� from orders WHERE custid=2;
SELECT SUM(saleprice) AS total,AVG(saleprice) AS Average,min(saleprice) AS min,max(saleprice) as max from orders ;
SELECT COUNT(*) from orders;
SELECT custid, COUNT(*) AS ��������, SUM(saleprice) AS �Ѿ� FROM orders GROUP BY custid;
SELECT custid, COUNT(*) AS ��������, SUM(saleprice) AS �Ѿ�
FROM Orders
GROUP BY custid;
SELECT custid, COUNT(*) AS ��������
FROM Orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(*) >= 2;

SELECT custid, COUNT(*) AS ��������
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

                           AND Customer.name LIKE '������';
SELECT COUNT(*) from orders where custid=1;
SELECT COUNT(*) FROM Customer, Orders

             WHERE Customer.custid=Orders.custid

             AND Customer.name LIKE '������';
SELECT COUNT(*) from book;
SELECT COUNT(DISTINCT publsher) from book ;
SELECT name,address from customer;
SELECT orderid,orderdate from orders WHERE orderdate>='2014/07/04' AND orderdate<='2014/07/07';
SELECT orderid,orderdate from orders WHERE not orderdate>='2014/07/04' AND orderdate<='2014/07/07';

SELECT name,address from customer where name LIKE '��%';
SELECT name,address from customer where name LIKE '��_��';

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
WHERE publsher='���ѹ̵��'));


1 ���缭���ǰ��� �䱸�ϴ� ���� ������ ���� SQL �����ۼ��Ͻÿ�.;
(5) �������̱����� ������ ���ǻ� ��;
SELECT count(publisher)
FROM book
WHERE bookid IN (SELECT bookid
FROM Orders
WHERE custid IN (SELECT custid
FROM customer
WHERE name='������'));
(6)�������� ������ ������ �̸�, ����, �������ǸŰ����� ����;
SELECT book.bookname,book.price,orders.saleprice,book.price-orders.saleprice
FROM book,orders
WHERE book.bookid=orders.bookid AND book.bookid IN (SELECT bookid
FROM Orders
WHERE custid IN (SELECT custid
FROM customer
WHERE name='������'));
(7) �������̱������� ���� ������ �̸�;
SELECT bookname
FROM book
WHERE bookid not IN (SELECT bookid
FROM Orders
WHERE custid IN (SELECT custid
FROM customer
WHERE name='������'));
2 ���缭���ǿ�ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL �����ۼ��Ͻÿ�.;
(8) �ֹ��������� ���� �̸�(�μ����ǻ��);
SELECT name
FROM customer
WHERE custid not IN (SELECT custid
FROM orders);
(9)�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�;
SELECT SUM(saleprice),AVG(saleprice) from orders;
(10) ���� �̸��� ���� ���ž�;
SELECT name, SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid =Orders.custid
GROUP BY Customer.name;
(11) �����̸��� ���� ������ ���� ���;
SELECT customer.name,book.bookname from customer,book,orders where customer.custid=orders.custid AND book.bookid=orders.bookid;
(12) �����ǰ���(Book ���̺�)���ǸŰ���(Orders ���̺�)�� ���̰����� ���� �ֹ�;
SELECT * from book,orders where book.bookid=orders.bookid AND book.price-orders.saleprice=(SELECT MAX(book.price-orders.saleprice)
FROM book,orders
WHERE book.bookid=orders.bookid AND book.bookid IN (SELECT bookid
FROM Orders
WHERE custid IN (SELECT custid
FROM customer)));
(13) �������Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�;
SELECT name FROM customer WHERE custid IN (SELECT custid FROM orders GROUP BY custid HAVING AVG(saleprice) > (SELECT AVG(saleprice) FROM orders));


select custid,(select address FROM customer cs where cs.custid=od.custid) "address",
SUM(saleprice) "total" FROM orders od GROUP BY od.custid;
--(1)�� �� ���̵�, �ּ�(address)�� �� ���ž�(total)

select cs.name, s
FROM (select custid, AVG(saleprice) s
from orders GROUP BY custid) od, customer cs
where cs.custid=od.custid;
--(2)�� �� �̸��� ��� ���ž�(s)

select SUM(saleprice) "total"
FROM orders od
where EXISTS (select * from customer cs
where custid <= 3 AND cs.custid=od.custid);
--(3)�� id �� 3 ������ ������ �� �������ž�(total)
