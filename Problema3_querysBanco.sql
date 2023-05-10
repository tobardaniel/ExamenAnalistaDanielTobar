-- 1: Se obtienen los números de cuenta con la información del cliente.

SELECT b.nombre, b.direccion, b.telefono, a.id_cuenta, a.saldo 
FROM cuentas AS a
INNER JOIN clientes AS b ON a.id_cliente = b.id_cliente
ORDER BY b.nombre

-- 2: Se calcula el saldo total del banco.

SELECT SUM(saldo) as 'Saldo del Banco'
FROM cuentas

-- 3: Se hallan los clientes y las cuentas con los 5 mayores saldos

SELECT TOP 5 b.nombre, a.id_cuenta, a.saldo 
FROM cuentas AS a
INNER JOIN clientes AS b ON a.id_cliente = b.id_cliente
ORDER BY a.saldo DESC

-- 4: Se obtienen los cheques del último mes

SELECT a.id_cheque, c.nombre, a.monto, a.fecha_emision, a.beneficiario
FROM cheques AS a
INNER JOIN cuentas AS b ON a.id_cuenta = b.id_cuenta
INNER JOIN clientes AS c ON b.id_cliente = c.id_cliente

WHERE MONTH(a.fecha_emision) = MONTH(NOW()) AND YEAR(a.fecha_emision) = YEAR(NOW())
ORDER BY a.fecha_emision DESC 

-- 5: Monto de cheques emitidos por cliente

SELECT J.nombre, I.monto_total_cheques
FROM 
(
SELECT b.id_cliente, SUM(a.monto) as 'monto_total_cheques'
FROM 
cheques a
INNER JOIN cuentas b ON a.id_cuenta = b.id_cuenta
GROUP BY b.id_cliente
) I 
INNER JOIN clientes J ON I.id_cliente = J.id_cliente
ORDER BY J.nombre

-- 6: Monto total de préstamos

SELECT SUM(monto) as 'monto_total_prestamos'
FROM prestamos 
WHERE YEAR(fecha_otorgamiento) = YEAR(NOW()) 

-- 7: 10 clientes con mayores montos de préstamos en el primer cuatrimestre

SELECT TOP 10 J.id_cliente, J.nombre, I.monto_total_prestamos
FROM 
(
SELECT id_cliente, SUM(monto) as 'monto_total_prestamos'
FROM 
prestamos
WHERE YEAR(fecha_otorgamiento) = YEAR(NOW()) AND MONTH(fecha_otorgamiento) <= 4
GROUP BY b.id_cliente
) I 
INNER JOIN clientes J ON I.id_cliente = J.id_cliente
ORDER BY I.monto_total_prestamos
