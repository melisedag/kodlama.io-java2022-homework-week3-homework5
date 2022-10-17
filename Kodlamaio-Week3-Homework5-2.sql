--SELECT 
--ANSII
--Case insensitive

SELECT*FROM Customers
SELECT ContactName,CompanyName,City FROM Customers
SELECT ContactName Adi,CompanyName Sirketadi,City Sehir FROM Customers

SELECT * FROM Customers WHERE City = 'London'
SELECT * FROM Customers WHERE City = 'Berlin'

SELECT * FROM Products WHERE CategoryID=1 OR CategoryID=3

SELECT * FROM Products WHERE CategoryID=1 AND UnitPrice>=10

SELECT * FROM Products ORDER BY ProductName

SELECT * FROM Products ORDER BY CategoryID,ProductName
--�stteki �nce CategoryID olarak dizer sonra o categoryID i�erisinde ProductName'e g�re s�ralar

SELECT * FROM Products ORDER BY UnitPrice ASC --ascending default artan

SELECT * FROM Products ORDER BY UnitPrice DESC --descending azalan, d��en

SELECT * FROM Products WHERE CategoryID=1 ORDER BY UnitPrice DESC

SELECT * FROM Products WHERE CategoryID=1 AND SupplierID=18 AND UnitPrice>=100 ORDER BY UnitPrice DESC

SELECT COUNT(*) FROM Products --B�t�n product tablosunda ka� data var �ekiyor

SELECT COUNT(*) FROM Products WHERE CategoryID=2

SELECT COUNT(*) Adet FROM Products WHERE CategoryID=2 --Adet yazan yer column ad� oluyor

--Hangi kategoride ka� farkl� �r�n�m�z var. CategoryId ye g�re grupla
SELECT CategoryID,COUNT(*) FROM Products GROUP BY CategoryID

--�r�n say�s� 10'dan k���k olan kategorileri listele
SELECT CategoryID,COUNT(*) FROM Products GROUP BY CategoryID HAVING COUNT(*) < 10

--Birim fiyat� 20'den fazla �r�nleri category�d ye g�re grupla say�s� 10dan kucuk olanlar� goster
SELECT CategoryID,COUNT(*) FROM Products WHERE UnitPrice>20 GROUP BY CategoryID HAVING COUNT(*) < 10

--Birle�tirme ko�ulu ON ile sa�lan�r
SELECT * FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID

SELECT Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName
FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID

--DTO Data Transformation Object

--Fiyat� 10dan b�y�k olanlar� categories ile join et category ismi ile getir
SELECT Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName
FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Products.UnitPrice>10

--Inner Join iki tabloda da e�le�enleri getirir, e�le�meyen datay� getirmez

--Solda olup sa�da olmayanlar� da getir, �r�nler tablosunda var hi� sat��� yok
--�r�nlerde olup sat��� olmayan yok
SELECT * FROM Products p LEFT JOIN [Order Details] od --Tablo isminde bo�luk oldu�u i�in k��eli paranteze ald�k
ON p.ProductID = od.ProductID

SELECT * FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID -- E�le�enler

--M��terilerde olup sipari�te olmayanlar� da getir
--Sisteme kay�t olmu� ama sipari� vermemi� olanlar� getiriyor
--Ana tablo genelde �ne yaz�l�r bu sebeple left daha cok kullan�l�r
SELECT * FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID 
WHERE o.CustomerID is null --null o data yok demek bunu PK'ya uygular�z

SELECT * FROM Orders o RIGHT JOIN Customers c ON c.CustomerID = o.CustomerID 
WHERE o.CustomerID is null 

--�ki tabloyu birle�tirme
SELECT * FROM Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
INNER JOIN Orders o ON o.OrderID = od.OrderID