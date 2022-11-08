#! /bin/bash

clear
while true
do

read -p "Ingrese nombre o apellido de docente a buscar: " NOM

if grep -i -q $NOM lista-profesores.txt
then
echo "Se encontraron las siguientes coincidencias: "
echo "Cedula    Nombre   Apellido"
echo "-------------------------"
grep -i $NOM lista-profesores.txt | column -t -s:
TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Se busco documento por nombre, por el usuario "$USER "Fecha: "$TS"." >> registro.log

while true
do
read -p "
1 - Para volver a buscar 

0 - Para volver al menu: " ING
case $ING in

1) bash busc-nombre.sh;;

0) bash menu-principal.sh;;
*)echo "Ingrese una opcion valida"

esac
done

break

else 
echo "El nombre no tuvo coincidencias, reintente"
fi

done
