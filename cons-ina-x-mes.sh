#! /bin/bash


clear
while true
do
read -p "Ingrese mes a consultar 01 al 12: " MES
if echo $MES | egrep -xq "0[1-9]|1[0-2]"
then
if egrep -x "^.+:.+:[0-9]{4}$MES[0-9]{02}:.+:.+:.+:.+:.+$" faltas.txt
then break
else echo "No hay registro de inasistencias en ese mes"
fi
else
echo "Ingrese un mes de 01 a 12"
fi
done

while true
do
clear
read -p "Ingrese documento a consultar: " Doc
if  grep -q "^$Doc:" lista-profesores.txt
then
#variables para
Nombre=$(grep $Doc lista-profesores.txt | cut -d ":" -f2)
Apellido=$(grep $Doc lista-profesores.txt | cut -d ":" -f3)
clear
echo "El docente: $Nombre $Apellido CI: $Doc,"
echo "Tiene el siguiente registro de inasistencias en el mes $MES:"
echo "-----------------------------------------------------------------------"
echo "Fecha desde:Fecha hasta:Usuario:Fecha Registro" > temp
echo  $(egrep -x "^.+:.+:[0-9]{4}02[0-9]{02}:.+:.+:.+:.+:.+$" faltas.txt | cut -d ":" -f3-6  >> temp)
cat temp | column -t -s:
rm temp
TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Se consulto inasistencias del mes: $MES de $Nombre CI: $Doc por usuario: $USER Fecha: $TS" >> registro.log
while true
do
read -p "
1 - Para volver a consultar 

0 - Para volver al menu: " ING
case $ING in

1) bash cons-ina-x-mes.sh;;
0) bash menu-principal.sh;;

*)echo "Ingrese una opcion valida"
esac
done


break
else
echo "Ingrese una cedula correcta" 
fi
done
