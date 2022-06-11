SQL> CREATE TABLE PERSONA(
  2  NOMBRE VARCHAR(20),
  3  EDAD NUMBER(2)
  4  );

Tabla creada.

SQL> CREATE TABLE TRABAJADOR(
  2  ID VARCHAR(5),
  3  PUESTO CHAR(1),
  4  FECHAINGRESO DATE
  5  );

Tabla creada.

SQL> -- SIN ENCABEZADO
SQL> INSERT INTO PERSONA VALUES('Juan', 25);

1 fila creada.

SQL> INSERT INTO PERSONA VALUES('Emiliano', 31);

1 fila creada.

SQL> INSERT INTO PERSONA VALUES (45, 'Jose');
INSERT INTO PERSONA VALUES (45, 'Jose')
                                *
ERROR en l�nea 1:
ORA-01722: n�mero no v�lido 


SQL> INSERT INTO PERSONA VALUES ('Miriam', 123);
INSERT INTO PERSONA VALUES ('Miriam', 123)
                                      *
ERROR en l�nea 1:
ORA-01438: valor mayor que el que permite la precisi�n especificada para esta 
columna 


SQL> INSERT INTO PERSONA VALUES('Karen');
INSERT INTO PERSONA VALUES('Karen')
            *
ERROR en l�nea 1:
ORA-00947: no hay suficientes valores 


SQL> INSERT INTO PERSONA VALUES(23);
INSERT INTO PERSONA VALUES(23)
            *
ERROR en l�nea 1:
ORA-00947: no hay suficientes valores 


SQL> -- CON ENCABEZADO
SQL> INSERT INTO TRABAJADOR(ID, PUESTO) VALUES ('1', 'A');

1 fila creada.

SQL> INSERT INTO TRABAJADOR(PUESTO, ID) VALUES ('B', '2');

1 fila creada.

SQL> INSERT INTO TRABAJADOR(FECHAINGRESO, ID) VALUES ('22/09/2000', 'A');

1 fila creada.

SQL> INSERT INTO TRABAJADOR(ID) VALUES ('1', 'A', '23/11/2005');
INSERT INTO TRABAJADOR(ID) VALUES ('1', 'A', '23/11/2005')
            *
ERROR en l�nea 1:
ORA-00913: demasiados valores 


SQL> SELECT * FROM PERSONA;

NOMBRE                     EDAD                                                 
-------------------- ----------                                                 
Juan                         25                                                 
Emiliano                     31                                                 

SQL> SELECT ID, FECHAINGRESO FROM TRABAJADOR;

ID    FECHAING                                                                  
----- --------                                                                  
1                                                                               
2                                                                               
A     22/09/00                                                                  

SQL> DROP TABLE PERSONA;

Tabla borrada.

SQL> DROP TABLE TRABAJADOR;

Tabla borrada.