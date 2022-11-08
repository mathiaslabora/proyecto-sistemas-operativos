#! /bin.bash

while true
do
read -p "
Seleccione lo que desea hacer:

1 - Registrar Falta Docente

0 - Volver al menu principal

Ingrese opcion: " Option

case $Option in
1)
clear
while true
do
#Valido cedula este en registros de profesores
while true
do
read -p "Ingrese CI sin puntos y guiones: " CI
if grep -q "^$CI:" lista-profesores.txt
then 
echo "Cedula correcta"
break
else 
echo "Ingrese una cedula con formato correcto"
fi
done

while true
do
read -p "Ingrese dia de Inicio inasistencia: " DIni
if echo $DIni | egrep -xq "0[1-9]|[12][0-9]|3[01]"
then
echo "Dia ingresado correctamente"
break
else
echo "Ingrese un dia de 1 a 31"
fi
done

while true
do
read -p "Ingrese mes de Inicio inasistencia: " MIni
if echo $MIni | egrep -xq "0[1-9]|1[0-2]"
then
echo "Mes ingresado correctamente"
break
else
echo "Ingrese un mes de 1 a 12"
fi
done



while true
do
read -p "Ingrese anio de Inicio inasistencia formato 2020: " AIni
if echo $AIni | egrep -xq "19[5-9][0-9]|20[0-1][0-9]|202[0-2]"
then
echo "Anio ingresado correctamente"
break
else
echo "Ingrese un anio correcto"
fi
done



while true
do
read -p "Ingrese dia de Fin inasistencia: " DFin
if echo $DFin | egrep -xq "0[1-9]|[12][0-9]|3[01]"
then
echo "Dia ingresado correctamente"
break
else
echo "Ingrese un dia de 1 a 31"
fi
done

while true
do
read -p "Ingrese mes de Fin de inasistencia: " MFin
if echo $MFin | egrep -xq "0[1-9]|1[0-2]"
then
echo "Mes ingresado correctamente"
break
else
echo "Ingrese un mes de 1 a 12"
fi
done



while true
do
read -p "Ingrese anio de Fin inasistencia formato 2020: " AFin
if echo $AFin | egrep -xq "19[5-9][0-9]|20[0-1][0-9]|202[0-2]"
then
echo "Anio ingresado correctamente"
break
else
echo "Ingrese un anio correcto"
fi
done



FINICIO=$AIni$MIni$DIni
FFIN=$AFin$MFin$DFin

if [ $FFIN -gt $FINICIO ]
then

TS=$(date +%d/%m/%y-%H:%M:%S)
NUM=$(cat cont.txt)
let NUM++ #NUM=$(($NUM+1)) alternativa

echo $NUM > cont.txt
echo $NUM:$CI:$FINICIO:$FFIN:$USER:$TS >>faltas.txt
echo "Se registro inasistencia codigo: "$NUM "por el usuario "$USER "Fecha: "$TS"." >> registro.log
clear
echo "Se ingreso correctamente la inasistencia"
break


else
clear
echo "La fecha de fin tiene que ser posterior a la de inicio"
fi

done;;


0) break;;
*) echo Ingrese una opcion valida
esac
done
