#!/bin/bash
#Script made to run two process in the same time when the container start (source : docker.com)


# Start the first process
/usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf &
  
# Start the second process
php /sae24/recover_position_final.php &

#Start third process 
php /sae24/gen_position.php &

  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?
