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
read -p "Ingrese nombre de usuario a consultar: " NOM
if  egrep "^.+:.+:.+:.+:$NOM:" faltas.txt
then
clear
echo "El usuario: $NOM realizo los siguientes registros en el mes $MES"
echo "-----------------------------------------------------------------------"
echo "Documento:Fecha desde:Fecha hasta:Usuario:Fecha Registro" > temp
echo  $(egrep -x "^.+:.+:[0-9]{4}$MES.+:$NOM:.+:.+:.+$" faltas.txt | cut -d ":" -f2-6  >> temp)
cat temp | column -t -s:
rm temp
TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Se consulto inasistencias del mes: $MES de el usuario $NOM por usuario: $USER Fecha: $TS" >> registro.log
break
else
echo "Ingrese una cedula correcta" 
fi
done
