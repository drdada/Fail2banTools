#!/bin/bash
path_check=/root/stats.sh

nb=$($path_check today | wc -l)

if [ "$nb" -gt 100 ]
then
        service=$($path_check service)
        subnet=$($path_check subnet)
        service=$(echo $service | sed 's/\./\+/g')
        echo -e "Alerte: Nombre d'attaques importante: $nb \n$service \n$subnet \nMerci de faire quelque chose :)" > /tmp/mail3
        cat /tmp/mail3
        #Or an another MUA...
        mutt -s "Alerte Attaques importantes ($nb)" john.doe@gmail.com < /tmp/mail3
        rm /tmp/mail3
fi
