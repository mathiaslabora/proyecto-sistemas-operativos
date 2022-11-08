#! /bin/bash
while true
do
read -p "
Seleccione que desea hacer:

1 - Modificar un registro

0 - Volver al menu principal

Ingrese opcion: " Op
clear
case $Op in
1)
while true
do

read -p "Ingrese codigo del registro a modificar: " Codigo

if grep -q "^$Codigo:" faltas.txt
then
clear

CI=$(grep "^$Codigo:" faltas.txt | cut -d ":" -f2)
FINI=$(grep "^$Codigo:" faltas.txt | cut -d ":" -f3)
FFIN=$(grep "^$Codigo:" faltas.txt | cut -d ":" -f4)
USUARIO=$(grep "^$Codigo:" faltas.txt | cut -d ":" -f5)
TS=$(grep "^$Codigo:" faltas.txt | cut -d ":" -f6-8)

echo "Codigo valido"
echo "Datos del registro que va a modificar:"
echo "Cedula: $CI"
echo "Fecha de inicio: $FINI"
echo "Fecha de fin: $FFIN"
echo "Usuario: $USUARIO"
echo "Fecha registrado: $TS"


VARECHO="Codigo valido \nDatos del registro que va a modificar: \nCedula: $CI \nFecha de inicio: $FINI \nFecha de fin: $FFIN \nUsuario: $USUARIO \nFecha registrado: $TS"


#valido cedula
while true
do 
read -p "Ingrese cedula nueva: " Cedula
if grep -q "^$Cedula:" lista-profesores.txt
then CI=$Cedula
break
else 
clear
echo -e $VARECHO
echo "Ingrese una cedula valida"
fi
done

while true
do
#valido fecha inicio

while true
do
read -p "Ingrese dia de Inicio inasistencia: " DIni
if echo $DIni | egrep -xq "0[1-9]|[12][0-9]|3[01]"
then
clear
echo -e $VARECHO

echo "Dia ingresado correctamente"
break
else
clear
echo -e $VARECHO
echo "Ingrese un dia de 1 a 31"
fi
done

while true
do
read -p "Ingrese mes de Inicio inasistencia: " MIni
if echo $MIni | egrep -xq "0[1-9]|1[0-2]"
then
clear
echo -e $VARECHO
echo "Mes ingresado correctamente"
break
else
clear
echo -e $VARECHO
echo "Ingrese un mes de 1 a 12"
fi
done



while true
do

read -p "Ingrese anio de Inicio inasistencia formato 2020: " AIni
if echo $AIni | egrep -xq "19[5-9][0-9]|20[0-1][0-9]|202[0-3]"
then
clear
echo -e $VARECHO
echo "Anio ingresado correctamente"
break
else
clear
echo -e $VARECHO
echo "Ingrese un anio correcto"
fi
done

FINI=$AIni$MIni$DIni


#valido fecha fin

while true
do
read -p "Ingrese dia de Fin inasistencia: " DFin
if echo $DFin | egrep -xq "0[1-9]|[12][0-9]|3[01]"
then
clear
echo -e $VARECHO

echo "Dia ingresado correctamente"
break
else
clear
echo -e $VARECHO

echo "Ingrese un dia de 1 a 31"
fi
done

while true
do
read -p "Ingrese mes de Fin de inasistencia: " MFin
if echo $MFin | egrep -xq "0[1-9]|1[0-2]"
then
clear
echo -e $VARECHO

echo "Mes ingresado correctamente"
break
else
clear
echo -e $VARECHO

echo "Ingrese un mes de 1 a 12"
fi
done



while true
do
read -p "Ingrese anio de Fin inasistencia formato 2020: " AFin
if echo $AFin | egrep -xq "19[5-9][0-9]|20[0-1][0-9]|202[0-3]"
then
clear
echo -e $VARECHO

echo "Anio ingresado correctamente"
break
else
clear
echo -e $VARECHO

echo "Ingrese un anio correcto"
fi
done

FFIN=$AFin$MFin$DFin

if [ $FFIN -gt $FINI ]
then
grep -v "^$Codigo:" faltas.txt > temp.txt
mv temp.txt faltas.txt
echo $Codigo:$CI:$FINI:$FFIN:$USUARIO:$TS >>faltas.txt

TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Se modifico inasistencia codigo: "$Codigo "por el usuario "$USER "Fecha: "$TS"." >> registro.log
clear
echo "Se modifico correctamente la inasistencia"
break

else
clear
echo "La fecha de fin tiene que ser posterior a la de inicio"
fi
done



break


else
clear
echo "Ingrese un codigo valido"
fi
done;;
0) break;;
*) echo Ingrese una opcion valida

esac
done
