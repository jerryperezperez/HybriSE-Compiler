rem Comando para ocultar la ejecucion de los siguientes comandos en la consola
@echo off

rem Comando para realizar comentarios

rem Paso 1. Se definen las variables por usar
set SRC=src\main\*.java src\system\*.java
set SALIDA=target\classes
set CLASSPATH=lib\flatlaf-intellij-themes-1.2.jar;lib\flatlaf-1.1.2.jar;lib\Compilador_HybriSE.jar
set JAR=target\MiApp.jar
set ARCHIVO_MANIFEST=META-INF/MANIFEST.MF

rem Paso 2. Se limpia el directorio que almacena el archivo jar y las compilaciones de los archivos
echo Limpiando directorio de salida...
rmdir /s /q target
mkdir %SALIDA%

rem Paso 3. Se compilan los archivos y se almacenan en el directorio de salida
echo Compilando los archivos y guardando en directorio de salida...
javac -cp "%CLASSPATH%" -d %SALIDA% %SRC%

rem Paso 4. Se crea el archivo JAR
echo Recuperando archivo MANIFEST y guardando archivo jar en directorio de salida...
jar cfm %JAR% %ARCHIVO_MANIFEST% -C %SALIDA% .

rem Paso 5. Se copian las bibliotecas en el directorio de salida
echo Copiando bibliotecas para el funcionamiento del jar...
mkdir target\lib
copy lib\*.jar target\lib\

echo Empaquetado terminado