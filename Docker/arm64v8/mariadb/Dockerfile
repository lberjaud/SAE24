#Building of the MariaDB image provisionned with a default database ('sae23')

#Use the last MariaDB docker image for base image
FROM arm64v8/mariadb:latest

#Copy the database creation script which will be launched at the container startup
COPY sae24_final.sql /docker-entrypoint-initdb.d/