#!/bin/bash
#Script de génération des rapports fail2ban
#Auteur : Matteo D'Addamio
#Thx to http://www.the-art-of-web.com/system/fail2ban-log/

case "$1" in
jour)
        echo "Affichage du nombre d'attaques par jours"
        zgrep -h "Ban " /var/log/fail2ban.log* | awk '{print $5,$1}' | sort | uniq -c
;;
today)
        echo "Affichage des attaques du jour"
       grep "Ban " /var/log/fail2ban.log | grep `date +%Y-%m-%d` | awk '{print $NF}' | sort | awk '{print $1,"("$1")"}' | logresolve |$
;;
service)
        echo "Affichage des attaques par IP/Services (du dernier fichier de log)"
       grep "Ban " /var/log/fail2ban.log | awk -F[\ \:] '{print $10,$8}' | sort | uniq -c | sort -n
;;
resolve)
        echo "Affichage du nombres d'attaques par IP (avec reverse DNS) (du dernier fichier de log)"
        awk '($(NF-1) = /Ban/){print $NF,"("$NF")"}' /var/log/fail2ban.log | sort | logresolve | uniq -c | sort -n
;;
subnet)
        echo "Affichage des subnets problematiques"
        zgrep -h "Ban " /var/log/fail2ban.log* | awk '{print $NF}' | awk -F\. '{print $1"."$2"."}' | sort | uniq -c | sort -n | tail
;;
ip)
        echo "Affichage du nombres d'attaques par IP"
        zgrep -h "Ban " /var/log/fail2ban.log* | awk '{print $NF}' | sort | uniq -c | sort -n
;;
*)
        echo "Usage: $0 {jour|today|service|resolve|subnet|ip}"
        exit 1
esac
