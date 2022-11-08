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
7 - Buscar Docente por nombre

0 - Volver al menu

Ingrese opcion: " Op

case  $Op in
1) bash cons-inasistencias-x-ci.sh;;
2) bash cons-ina-x-mes.sh;;
3) bash cant-falta.sh;;
4) bash cons-ina-x-usuario-mes.sh;;

#TODOS REGISTROS:
5) clear 
echo "Cod Cedula    F.Desde   F.Hasta   Usuario  FechaReg Hora Min Seg "
echo "---------------------------------------------------------------------"
column -t -s: faltas.txt
TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Se consultan todas el registro de inasistencias por el usuario "$USER "Fecha: "$TS"." >> registro.log
;;

#LISTADO DOCENTES:
6)clear 
echo "Cedula -- Nombre  "
echo "-----------------"
cut -d ":" -f1-2 lista-profesores.txt | column -t -s:
TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Se consulto lista profesores por el usuario "$USER "Fecha: "$TS"." >> registro.log
;;


7) bash busc-nombre.sh;;

0) break;;
*) echo Ingrese una opcion valida

esac
done
