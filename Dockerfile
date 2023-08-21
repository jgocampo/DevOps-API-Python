# Usa la imagen base de Python adecuada
FROM python:3.11.3

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . .

# Instala las dependencias
RUN pip install -r requirements.txt

# Ejecuta las migraciones de la base de datos
RUN python manage.py makemigrations
RUN python manage.py migrate

# Expone el puerto en el que se ejecutará tu aplicación
EXPOSE 8000

# Comando para ejecutar tu aplicación
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

