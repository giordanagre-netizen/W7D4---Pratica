/*Vista Product 
Obiettivo: creare un’anagrafica prodotto completa con Nome prodotto - Nome sottocategoria - Nome categoria */

CREATE VIEW Prodotto AS
SELECT 
    p.ProductKey,
    p.EnglishProductName AS NomeProdotto,
    sc.EnglishProductSubcategoryName AS NomeSottocategoria,
    c.EnglishProductCategoryName AS NomeCategoria
FROM DimProduct p
LEFT JOIN DimProductSubcategory sc 
    ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
LEFT JOIN DimProductCategory c 
    ON sc.ProductCategoryKey = c.ProductCategoryKey;

/*Vista Reseller
Obiettivo: anagrafica reseller con Nome reseller - Città - Regione*/

CREATE VIEW Reseller AS
SELECT 
    r.ResellerKey,
    r.ResellerName AS NomeReseller,
    g.City AS Città,
    g.StateProvinceName AS Regione
FROM DimReseller r
LEFT JOIN DimGeography g 
    ON r.GeographyKey = g.GeographyKey;

/*Vista Sales 
Obiettivo: restituire Data ordine - Codice documento - Numero riga - Quantità - Importo totale - Profitto*/

CREATE VIEW Vendite AS
SELECT 
    fs.OrderDate AS DataOrdine,
    fs.SalesOrderNumber AS NomeOrdineVendita,
    fs.SalesOrderLineNumber AS LineNumber,
    fs.OrderQuantity AS QuantitàOrdine,
    fs.SalesAmount AS TotaleOrdine,
    fs.SalesAmount - fs.TotalProductCost AS Profitto,
    fs.ProductKey,
    fs.ResellerKey
FROM FactResellerSales fs;
