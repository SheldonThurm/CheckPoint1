#!/bin/bash 



#if y a pas d'arguments = vrai
    if [ $# = 0 ]
    then
        echo "Il manque les noms d'utilisateurs en argument"
        echo "Fin du script" 
        exit 1
#Si y a des arguments
    #argument existe deja = vrai donc utilisateur existe dans fichier passwd
    else
        if  grep $@ /etc/passwd 
        then 
            echo "L'utilisateur $@ existe déja"
    #argument existe pas dans passwd donc utilisateur existe pas 
        else 
#boucle for pour créer les utilisateurs par rapports aux arguments 
            for user in $@
            do 
                adduser $user
#un peu de couleur c'est plus sympa ! 
                echo -e "\E[32m L'utilisateur $user a été créer \E[0m"
            done
        fi
    fi
