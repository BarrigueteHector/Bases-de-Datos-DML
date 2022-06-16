SQL> CREATE TABLE PERSONA(
  2  NOMBRE VARCHAR(20),
  3  APPAT VARCHAR(20),
  4  APMAT VARCHAR(20),
  5  SANGRE VARCHAR(3),
  6  FECHA_NACI DATE
  7  );

Tabla creada.

SQL> 
SQL> -- ************ Insercion sin encabezado ************
SQL> INSERT INTO PERSONA VALUES('Ramses', 'Carrera', 'Dominguez', 'A+', '12/02/2000');

1 fila creada.

SQL> INSERT INTO PERSONA VALUES('Jesus', 'Rodriguez', 'Esquivel', 'B+', '30/09/1997');

1 fila creada.

SQL> SELECT * FROM PERSONA;

NOMBRE               APPAT                APMAT                SAN FECHA_NA     
-------------------- -------------------- -------------------- --- --------     
Ramses               Carrera              Dominguez            A+  12/02/00     
Jesus                Rodriguez            Esquivel             B+  30/09/97     

SQL> 
SQL> -- Generar� error si falta informaci�n para alg�n campo:
SQL> INSERT INTO PERSONA VALUES('Gabriela', 'Dominguez', '01/12/2002');
INSERT INTO PERSONA VALUES('Gabriela', 'Dominguez', '01/12/2002')
            *
ERROR en l�nea 1:
ORA-00947: no hay suficientes valores 

SQL> INSERT INTO PERSONA VALUES('Gabriela', 'Dominguez', 'Aguilar');
INSERT INTO PERSONA VALUES('Gabriela', 'Dominguez', 'Aguilar')
            *
ERROR en l�nea 1:
ORA-00947: no hay suficientes valores 

SQL> INSERT INTO PERSONA VALUES('Dominguez', '01/12/2002');
INSERT INTO PERSONA VALUES('Dominguez', '01/12/2002')
            *
ERROR en l�nea 1:
ORA-00947: no hay suficientes valores 

SQL> -- si la informaci�n a insertar est� en desorden y el tipo de dato no corresponde con el de la columna
SQL> INSERT INTO PERSONA VALUES('01/12/2002', 'Gabriela', 'Dominguez', 'AB+', 'Aguilar');
INSERT INTO PERSONA VALUES('01/12/2002', 'Gabriela', 'Dominguez', 'AB+', 'Aguilar')
                                                                         *
ERROR en l�nea 1:
ORA-01858: se ha encontrado un car�cter no num�rico donde se esperaba uno 
num�rico 

SQL> -- o si lo que vamos a insertar es demasiado grande para la columna
SQL> INSERT INTO PERSONA VALUES('01/12/2002', 'AB+', 'Gabriela', 'Dominguez', 'Aguilar');
INSERT INTO PERSONA VALUES('01/12/2002', 'AB+', 'Gabriela', 'Dominguez', 'Aguilar')
                                                            *
ERROR en l�nea 1:
ORA-12899: el valor es demasiado grande para la columna 
"REPO"."PERSONA"."SANGRE" (real: 9, m�ximo: 3) 

SQL> -- ************ Insercion con encabezado ************
SQL> -- Los datos se pueden ingresar en desornen
SQL> INSERT INTO PERSONA(APPAT, APMAT, FECHA_NACI, NOMBRE, SANGRE) VALUES('Dominguez', 'Aguilar', '01/12/2002', 'Gabriela', 'A-');

1 fila creada.

SQL> -- Puede faltar informaci�n para cualquier campo (siempre que no sea obligatorio, en la tabla creada ningun cmapo es obligatorio)
SQL> INSERT INTO PERSONA(NOMBRE, APPAT, FECHA_NACI) VALUES('Diego', 'Gomez', '15/04/2002');

1 fila creada.

SQL> INSERT INTO PERSONA(NOMBRE, FECHA_NACI) VALUES('Vianney', '18/11/2018');

1 fila creada.

SQL> -- Al realizar una consulta, aquellos registros que no llenen todos los campos de la tabla, se ver� un espacio en blanco en dicho campo.
SQL> SELECT * FROM PERSONA;

NOMBRE               APPAT                APMAT                SAN FECHA_NA     
-------------------- -------------------- -------------------- --- --------     
Ramses               Carrera              Dominguez            A+  12/02/00     
Jesus                Rodriguez            Esquivel             B+  30/09/97     
Gabriela             Dominguez            Aguilar              A-  01/12/02     
Diego                Gomez                                         15/04/02     
Vianney                                                            18/11/18     

SQL> -- ************ UPDATE ************
SQL> -- Agregamos otros registros:
SQL> INSERT INTO PERSONA VALUES('Rafael', 'Campos', 'Lopez', 'A+', '21/12/2011');

1 fila creada.

SQL> INSERT INTO PERSONA VALUES('Karla', 'Benitez', 'Sanchez', 'B+', '19/06/2009');

1 fila creada.

SQL> INSERT INTO PERSONA VALUES('Jimena', 'Leal', 'Duarte', 'AB-', '03/04/2010');

1 fila creada.

SQL> INSERT INTO PERSONA VALUES('Enrique', 'Plata', 'Nieto', 'AB-', '20/07/1999');

1 fila creada.

SQL> SELECT * FROM PERSONA;

NOMBRE               APPAT                APMAT                SAN FECHA_NA     
-------------------- -------------------- -------------------- --- --------     
Ramses               Carrera              Dominguez            A+  12/02/00     
Jesus                Rodriguez            Esquivel             B+  30/09/97     
Gabriela             Dominguez            Aguilar              A-  01/12/02     
Diego                Gomez                                         15/04/02     
Vianney                                                            18/11/18     
Rafael               Campos               Lopez                A+  21/12/11     
Karla                Benitez              Sanchez              B+  19/06/09     
Jimena               Leal                 Duarte               AB- 03/04/10     
Enrique              Plata                Nieto                AB- 20/07/99     

9 filas seleccionadas.

SQL> -- Vamos a hacer un UPDATE a todas las personas que sean A+ y las dejaremos como A
SQL> UPDATE PERSONA SET SANGRE = 'A'
  2  WHERE SANGRE = 'A+';

2 filas actualizadas.

SQL> -- Lo mismo con los que son B+, las pasaremos a B
SQL> UPDATE PERSONA SET SANGRE = 'B'
  2  WHERE SANGRE = 'B+';

2 filas actualizadas.

SQL> -- Cabe mencionar que para estas actualizaciones, se nos indica el numero de filas que fueron modificadas
SQL> SELECT NOMBRE, SANGRE, FECHA_NACI FROM PERSONA;

NOMBRE               SAN FECHA_NA                                               
-------------------- --- --------                                               
Ramses               A   12/02/00                                               
Jesus                B   30/09/97                                               
Gabriela             A-  01/12/02                                               
Diego                    15/04/02                                               
Vianney                  18/11/18                                               
Rafael               A   21/12/11                                               
Karla                B   19/06/09                                               
Jimena               AB- 03/04/10                                               
Enrique              AB- 20/07/99                                               

9 filas seleccionadas.

SQL> -- Para el UPDATE anterior se utilizO el operador de comparaci�n igual (=). Podemos usar otro, como IS NULL.
SQL> 
SQL> -- A todos los que no tengan un tipo de sangre les pondremos un asterisco
SQL> UPDATE PERSONA SET SANGRE = '*'
  2  WHERE SANGRE IS NULL;

2 filas actualizadas.

SQL> SELECT NOMBRE, SANGRE, FECHA_NACI FROM PERSONA;

NOMBRE               SAN FECHA_NA                                               
-------------------- --- --------                                               
Ramses               A   12/02/00                                               
Jesus                B   30/09/97                                               
Gabriela             A-  01/12/02                                               
Diego                *   15/04/02                                               
Vianney              *   18/11/18                                               
Rafael               A   21/12/11                                               
Karla                B   19/06/09                                               
Jimena               AB- 03/04/10                                               
Enrique              AB- 20/07/99                                               

9 filas seleccionadas.

SQL> -- Incluso podemos realizar una resta en la conidicon para saber la edad de las personas.
SQL> -- Solo como ejemplo (para aprender a realizar restas con la fecha), todos los que tengan m�s de 10 a�os les cambiaremos la fecha de nacimiento a 01/01/2020
SQL> UPDATE PERSONA SET FECHA_NACI = '01/01/2020'
  2  WHERE (TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NACI)/12)) > 10;

7 filas actualizadas.

SQL> SELECT NOMBRE, SANGRE, FECHA_NACI FROM PERSONA;

NOMBRE               SAN FECHA_NA                                               
-------------------- --- --------                                               
Ramses               A   01/01/20                                               
Jesus                B   01/01/20                                               
Gabriela             A-  01/01/20                                               
Diego                *   01/01/20                                               
Vianney              *   18/11/18                                               
Rafael               A   21/12/11                                               
Karla                B   01/01/20                                               
Jimena               AB- 01/01/20                                               
Enrique              AB- 01/01/20                                               

9 filas seleccionadas.

SQL> -- Se va a explicar como se hizo la resta
SQL> -- TRUNC: nos permite truncar el resultado decimal a uno entero.
SQL> -- MONTHS_BETWEEN: nos da los meses que hay entre la primer fecha (SYSDATE) y la segunda (FECHA_NACI)
SQL> -- SYSDATE: es la fecha actual
SQL> -- Se hace la division para obtener los a�os
SQL> 
SQL> -- Para que se haga la actualizacion, la persona debe tener por lo menos 11 a�os. Si tiene 10 a�os y X cantidad de meses, no se hace la actualizacion.
SQL> 
SQL> -- Por Ultimo, si no utilizamos el WHERE, se actualizaran todos los registros.
SQL> -- En este caso, a todos les pondremos un tipo de sangre A+
SQL> UPDATE PERSONA SET SANGRE = 'A+';

9 filas actualizadas.

SQL> SELECT NOMBRE, SANGRE, FECHA_NACI FROM PERSONA;

NOMBRE               SAN FECHA_NA                                               
-------------------- --- --------                                               
Ramses               A+  01/01/20                                               
Jesus                A+  01/01/20                                               
Gabriela             A+  01/01/20                                               
Diego                A+  01/01/20                                               
Vianney              A+  18/11/18                                               
Rafael               A+  21/12/11                                               
Karla                A+  01/01/20                                               
Jimena               A+  01/01/20                                               
Enrique              A+  01/01/20                                               

9 filas seleccionadas.

SQL> -- Lo podemos cambiar para que todos sean O+
SQL> UPDATE PERSONA SET SANGRE = 'O+';

9 filas actualizadas.

SQL> SELECT NOMBRE, SANGRE, FECHA_NACI FROM PERSONA;

NOMBRE               SAN FECHA_NA                                               
-------------------- --- --------                                               
Ramses               O+  01/01/20                                               
Jesus                O+  01/01/20                                               
Gabriela             O+  01/01/20                                               
Diego                O+  01/01/20                                               
Vianney              O+  18/11/18                                               
Rafael               O+  21/12/11                                               
Karla                O+  01/01/20                                               
Jimena               O+  01/01/20                                               
Enrique              O+  01/01/20                                               

9 filas seleccionadas.

SQL> -- ************ DELETE ************
SQL> -- Al igual que en el UPDATE podemos eliminar solo ciertos registros, por ejemplo, todos los que hayan nacido antes del 2020
SQL> DELETE FROM PERSONA
  2  WHERE (TRUNC(MONTHS_BETWEEN(FECHA_NACI, '01/01/2020')/12)) < 0;

2 filas suprimidas.

SQL> SELECT NOMBRE, FECHA_NACI FROM PERSONA;

NOMBRE               FECHA_NA                                                   
-------------------- --------                                                   
Ramses               01/01/20                                                   
Jesus                01/01/20                                                   
Gabriela             01/01/20                                                   
Diego                01/01/20                                                   
Karla                01/01/20                                                   
Jimena               01/01/20                                                   
Enrique              01/01/20                                                   

7 filas seleccionadas.

SQL> -- Y tambien podemos eliminar todos los registros si no colocamos condicion.
SQL> DELETE FROM PERSONA;

7 filas suprimidas.

SQL> -- Lo anterior solo elimina los registros, no la tabla;
SQL> SELECT * FROM PERSONA;

ninguna fila seleccionada

SQL> DESCRIBE PERSONA;
 Nombre                                    �Nulo?   Tipo
 ----------------------------------------- -------- ----------------------------
 NOMBRE                                             VARCHAR2(20)
 APPAT                                              VARCHAR2(20)
 APMAT                                              VARCHAR2(20)
 SANGRE                                             VARCHAR2(3)
 FECHA_NACI                                         DATE