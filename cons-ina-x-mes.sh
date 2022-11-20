#! /bin/bash

clear

while true
do
read -p "Ingrese mes desde el que desea consultar (1 al 12): " MES
if echo $MES | egrep -xq "[1-9]|1[0-2]"
then break
else
clear
echo "Ingrese un mes de 1 a 12"
fi
done

while true
do
read -p "Ingrese mes hasta el que desea consultar (1 al 12): " MESF
if echo $MESF | egrep -xq "[1-9]|1[0-2]"
then break
else
clear
echo "Ingrese un mes de 1 a 12"
fi
done

while true
do
read -p "Ingrese anio por el cual consulta: " ANIO
if echo $ANIO | egrep -xq "19[5-9][0-9]|20[0-1][0-9]|202[0-2]"
then break
else
clear
echo "Ingrese un anio correcto"
fi
done


while true
do
clear
read -p "Ingrese documento a consultar: " Doc
if  grep -q "^$Doc:" lista-profesores.txt
then

Nombre=$(grep $Doc lista-profesores.txt | cut -d ":" -f2)
Apellido=$(grep $Doc lista-profesores.txt | cut -d ":" -f3)
clear
echo "El docente: $Nombre $Apellido CI: $Doc"
echo "Tiene los siguientes registros de ausencias desde el mes $MES al $MESF: "
echo "------------------------------------------------------------------"
echo "Fecha desde:Fecha hasta:Usuario:Fecha Registro" > temp
I=$MES
MESF=$(($MESF+1))
while [ $I -ne $MESF ] 
do

if [ $I -lt 10  ]
then 
D=0$I
fi

if egrep -xq "^.+:$Doc:$ANIO$D[0-9]{02}:.+:.+:.+:.+:.+$" faltas.txt
then
echo $(egrep -x "^.+:$Doc:$ANIO$D[0-9]{02}:.+:.+:.+:.+:.+$" faltas.txt | cut -d ":" -f3-6  >> temp)
fi
I=$(($I+1))
done


X=$(cat temp | wc -l)
if [ $X -le 1 ] 
then
echo "No se encontraron registros en los meses seleccionados..." > temp
fi

cat temp | column -t -s:
rm temp
TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Se consulto inasist. del mes: $MES hasta $MESF y anio $ANIO de docente $Nombre CI: $Doc por usuario: $USER Fecha: $TS" >> registro.log
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
