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
read -p "Ingrese nombre de usuario a consultar: " NOM
if  egrep "^.+:.+:.+:.+:$NOM:" faltas.txt
then

clear
echo "El usuario: $NOM registro entre el mes $MES y el $MESF del anio  $ANIO los sig. registros"
echo "-----------------------------------------------------------------------------------------"
echo "Documento:Fecha desde:Fecha hasta:Usuario" > temp

I=$MES
MESF=$(($MESF+1))
while [ $I -ne $MESF ] 
do

if [ $I -lt 10  ]
then 
D=0$I
fi


if egrep -xq "^.+:.+:$ANIO$D[0-9]{02}:.+:$NOM:.+:.+:.+$" faltas.txt
then
echo  $(egrep -x "^.+:.+:$ANIO$D[0-9]{02}:.+:$NOM:.+:.+:.+$" faltas.txt | cut -d ":" -f2-5  >> temp)
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
echo "Se consulto inasistencias del mes: $MES al $MESF anio: $ANIO  de el usuario $NOM por usuario: $USER Fecha: $TS" >> registro.log
break
else
echo "Ingrese una cedula correcta" 
fi
done

