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
--Üstteki önce CategoryID olarak dizer sonra o categoryID içerisinde ProductName'e göre sýralar

SELECT * FROM Products ORDER BY UnitPrice ASC --ascending default artan

SELECT * FROM Products ORDER BY UnitPrice DESC --descending azalan, düþen

SELECT * FROM Products WHERE CategoryID=1 ORDER BY UnitPrice DESC

SELECT * FROM Products WHERE CategoryID=1 AND SupplierID=18 AND UnitPrice>=100 ORDER BY UnitPrice DESC

SELECT COUNT(*) FROM Products --Bütün product tablosunda kaç data var çekiyor

SELECT COUNT(*) FROM Products WHERE CategoryID=2

SELECT COUNT(*) Adet FROM Products WHERE CategoryID=2 --Adet yazan yer column adý oluyor

--Hangi kategoride kaç farklý ürünümüz var. CategoryId ye göre grupla
SELECT CategoryID,COUNT(*) FROM Products GROUP BY CategoryID

--Ürün sayýsý 10'dan küçük olan kategorileri listele
SELECT CategoryID,COUNT(*) FROM Products GROUP BY CategoryID HAVING COUNT(*) < 10

--Birim fiyatý 20'den fazla ürünleri categoryýd ye göre grupla sayýsý 10dan kucuk olanlarý goster
SELECT CategoryID,COUNT(*) FROM Products WHERE UnitPrice>20 GROUP BY CategoryID HAVING COUNT(*) < 10

--Birleþtirme koþulu ON ile saðlanýr
SELECT * FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID

SELECT Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName
FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID

--DTO Data Transformation Object

--Fiyatý 10dan büyük olanlarý categories ile join et category ismi ile getir
SELECT Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName
FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Products.UnitPrice>10

--Inner Join iki tabloda da eþleþenleri getirir, eþleþmeyen datayý getirmez

--Solda olup saðda olmayanlarý da getir, Ürünler tablosunda var hiç satýþý yok
--Ürünlerde olup satýþý olmayan yok
SELECT * FROM Products p LEFT JOIN [Order Details] od --Tablo isminde boþluk olduðu için köþeli paranteze aldýk
ON p.ProductID = od.ProductID

SELECT * FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID -- Eþleþenler

--Müþterilerde olup sipariþte olmayanlarý da getir
--Sisteme kayýt olmuþ ama sipariþ vermemiþ olanlarý getiriyor
--Ana tablo genelde öne yazýlýr bu sebeple left daha cok kullanýlýr
SELECT * FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID 
WHERE o.CustomerID is null --null o data yok demek bunu PK'ya uygularýz

SELECT * FROM Orders o RIGHT JOIN Customers c ON c.CustomerID = o.CustomerID 
WHERE o.CustomerID is null 

--Ýki tabloyu birleþtirme
SELECT * FROM Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
INNER JOIN Orders o ON o.OrderID = od.OrderID