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

# Expone el puerto en el que se ejecutará la aplicación
EXPOSE 8000

# Healthcheck: Verifica la salud de la aplicación
HEALTHCHECK --interval=30s --timeout=10s \
  CMD curl --fail http://localhost:8000/ || exit 1

# Ejecutar aplicación
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


