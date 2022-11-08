#! /bin/bash


while true
do
clear
read -p "Ingrese documento a consultar: " Doc
if  grep -q "^$Doc:" lista-profesores.txt
then
CantRegist=$(grep $Doc faltas.txt | wc -l) 
CantRegist=$(($CantRegist + 1))
Fdesde=$(grep $Doc faltas.txt | cut -d ":" -f3)
Nombre=$(grep $Doc lista-profesores.txt | cut -d ":" -f2)
Apellido=$(grep $Doc lista-profesores.txt | cut -d ":" -f3)
clear #aqui limpio consola
echo "El docente: $Nombre $Apellido CI: $Doc,"
echo "Tiene el siguiente registro de inasistencias:"
echo "----------------------------------------------------------------------------"
echo "Fecha desde:Fecha hasta:Usuario:Fecha Registro" > temp
echo  $(grep $Doc faltas.txt | cut -d ":" -f3-6  >> temp)
cat temp | column -t -s:
rm temp
TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Se consulto inasistencias de $Nombre por el usuario $USER Fecha: $TS" >> registro.log
break
else
echo "Ingrese una cedula correcta" 
fi
done
TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Se consulto lista profesores por el usuario "$USER "Fecha: "$TS"." >> registro.log
