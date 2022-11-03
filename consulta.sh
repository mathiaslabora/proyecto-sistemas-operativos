#! /bin/bash
clear
while true
do
read -p "
------------------- CONSULTAS -------------------

1 - Consultar cantidad ausencias docente
2 - Consultar ausencias por docente en un mes
3 - Consultar total de faltas de un docente
4 - Consultar registros de ausencias de usuario en un mes
5 - Ver todos los registros
6 - Ver listado docentes

0 - Volver al menu

Ingrese opcion: " Op

case  $Op in
1)
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
break
else
echo "Ingrese una cedula correcta" 
fi
done;;

3) bash cant-falta.sh;;



6) cut -d ":" -f1-2 lista-profesores.txt
TS=$(date +%d/%m/%y%H:%M:%S)
echo "Se consulto lista profesores por el usuario "$USER "Fecha: "$TS"." >> registro.log
;;
0) break;;
*) echo Ingrese una opcion valida

esac
done
