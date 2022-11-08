#! /bin/bash
clear
while true
do

read -p "Ingrese documento a consultar: " Doc
if  grep -q "^$Doc:" lista-profesores.txt
then
CantRegist=$(grep $Doc faltas.txt | wc -l) 

echo "Se tienen registrados "$CantRegist " faltas del documento: "$Doc
echo ""
TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Se consulto cant registros por el usuario "$USER "Fecha: "$TS"." >> registro.log

break
else 
echo "Ingrese un documento valido"
fi
done
