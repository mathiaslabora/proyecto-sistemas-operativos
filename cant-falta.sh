#! /bin/bash

while true
do

read -p "Ingrese documento a consultar: " Doc
if  grep -q "^$Doc:" lista-profesores.txt
then
CantRegist=$(grep $Doc faltas.txt | wc -l) 

echo "Se tienen registrados "$CantRegist " faltas del documento: "$Doc
echo ""
break
else 
echo "Ingrese un documento valido"
fi
done
