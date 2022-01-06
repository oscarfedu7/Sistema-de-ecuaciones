# Sistema-de-ecuaciones
Este es un código hecho en fortran que soluciona un sistema de ecuaciones.

En el archivo llamado eG.f90 es el código que resuelve un sistema de ecuaciones. En este caso lo programé para que reolviera el siguiente sistema:
2x+4y+6z=18
4x+5y+6z=24
3x+y-2z=4

El cual nos da como resultado: x=4, y=-2 y z=3 el cual está bien, y el archivo sistema-ecuaciones-resuelto es donde se guarda el resultado. 
 Matriz
   2.0000000000000000        4.0000000000000000        6.0000000000000000        18.000000000000000     
   4.0000000000000000        5.0000000000000000        6.0000000000000000        24.000000000000000     
   3.0000000000000000        1.0000000000000000       -2.0000000000000000        4.0000000000000000     




 MATRIZ DIAGONALIZADA
   2.0000000000000000        4.0000000000000000        6.0000000000000000        18.000000000000000     
   0.0000000000000000       -3.0000000000000000       -6.0000000000000000       -12.000000000000000     
   0.0000000000000000        0.0000000000000000       -1.0000000000000000       -3.0000000000000000     


 resultado
   4.0000000000000000     
  -2.0000000000000000     
   3.0000000000000000     


 COMPROBAR RESULTADO
   0.0000000000000000     
   0.0000000000000000     
   0.0000000000000000     



el archivo Sistemas.f90 es la aplicación del primer código, el cual soluciona un sistema de ecuaciones mucho más grande y el resultado está en el archivo salida.

# Para ejecutar el código
Para ejecutar código de fortran (suponiendo que ya lo tienes intalado) es 
$gfortran eG.f90 -o run (compila el código)
y para correrlo:
$./run
y guardará el resultado en un nuevo archivo llamado "sistema-ecuaciones-resuelto".
