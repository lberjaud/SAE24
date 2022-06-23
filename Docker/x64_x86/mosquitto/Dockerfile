#Building of the custom msoquitto broker image with the metric generator included.

#Take the eclipse-mosquitto docker image for base
FROM eclipse-mosquitto:latest

#Install the required packages to connect to the MYSQL database and run the script (bash).
RUN apk add mysql-client bash php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl 

#Create the 'sae23' directory
RUN mkdir /sae24

#Copy the config file for the mosquitto broker inside the path made for this purpose.
COPY mosquitto.conf /mosquitto/config/

#Add the metric generator script inside the 'sae23' directory
COPY recover_position_final.php /sae24/
COPY gen_position.php /sae24/
COPY mysql.php /sae24/

#Add the wrapper script inside the 'sae23' directory
COPY wrapper_script.sh /sae24/wrapper_script.sh

#Run the wrapper script on the container starting
CMD /sae24/wrapper_script.sh