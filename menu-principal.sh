#! /bin/bash
if [ "$1" = "--help" ]
then cat help.txt
else
TS=$(date +%d/%m/%y-%H:%M:%S)
echo "Se ejecuto el script principal por el usuario "$USER "Fecha: "$TS"." >> registro.log

while true
do
clear
read -p "
////////////////////////////////////////////////////////////////////
//                                                                //
// Bienvenido al sistema de registro de inasistencias docentes.   //
// Seleccione la opcion deseada.                                  //
//                                                                //
// 1 - Alta de ausencia                                           //
// 2 - Baja de ausencia                                           //
// 3 - Modificacion                                               //
// 4 - Consultas                                                  //
//                                                                //
// 0 - Salir                                                      //
//                                                                //
////////////////////////////////////////////////////////////////////

Ingrese opcion: " Opcion

case $Opcion in
1) bash alta.sh;;
2) bash baja.sh;;
3) bash modificacion.sh;;
4) bash consulta.sh;;
0) break;;
*) echo Ingrese una opcion valida
esac
done
fi
