# TrabajoGrupal-IS2

Proyecto desarrollado usando Python con el framework Django con la base de datos PostgreSQL.

Para levantar el servidor y visualizar el proyecto debe seguir los siguientes pasos:

En Windows:

1- Instalar Python 3.5 y la libreria Psycopg 2.6.2 usando la siguiente sentencia dentro de la consola de comandos (debe tener agregar a Python como variable de ambiente):

pip install psycopg2

2- Instalar PostgreSQL en su versión 10 o 11 y anotar la contraseña colocada.

3- Instalar Git

4- Clonar el proyecto a su máquina.

5- Ingresar a la consola de pgAdmin y crear una base de datos con el nombre de "SisGesPro"

6- En el archivo settings.py que se encuentra dentro de la carpeta "SisGesPro" del proyecto previamente clonado, buscar la configuración correspondiente a la base de datos (Databases).

7- Cambiar la contraseña que aparece en pantalla por la colocada al momento de configurar su base de datos PostgreSQL.

8- Guardar cambios.

9- En la consola de comandos, ingresar a la carpeta en la cual se encuentra el archivo manage.py

10- Seguidamente, ejecutar el comando python manage.py migrate

11- Si todo salió correctamente, ejecutar el comando python manage.py makemigrations.

12- Si todo salió correctamente, ejecutar el comando python manage.py createsuperuser (usuario para ingresar al sistema)

13- Colocar correo electronico y contraseña del usuario.

14-  Si todo salió correctamente, ejecutar el comando python manage.py runserver

15- Si todo salio correctamente, el siguiente texto debe aparecer en pantalla:
-----------------
Django version 2.1.7, using settings 'SisGesPro.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.
-----------------

16- Ingresar en el navegador el siguiente link: http://127.0.0.1:8000/

17- Finalmente, ingrese usuario y contraseña previamente creados.

Para la prueba fue creado el usuario: josue@gmail.com
con la contraseña: admin123
