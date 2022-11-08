#! /bin/bash


while true
do
read -p "
Seleccione que desea hacer:

1 - Eliminar un registro

0 - Volver al menu principal

Ingrese opcion: " Option
clear
case $Option in
1)
read -p "Ingrese codigo de registro para eliminar: " COD
clear
if grep -q "^$COD:" faltas.txt
then grep -v "^$COD:" faltas.txt > temp.txt
mv temp.txt faltas.txt
clear
TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Registro eliminado satisfactoriamente"
echo "El registro codigo: " $COD "se elimino por" $USER "Fecha: "$TS"." >> registro.log
else 
clear
echo "No existe el registro que intenta eliminar"
fi;;

0) break;;
*) echo Ingrese una opcion valida
esac
done
