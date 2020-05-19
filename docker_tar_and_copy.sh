#!/bin/bash

LIST_OPTIONS="\n  list) list options.\n start) start packaging.\n remove) remove packaging.\n e) exit.\n"


if [ -z "$1" ]; then
    echo -e "\nWelcome to Packaging Ansible Course"
    echo -e  $LIST_OPTIONS
    exit 1
fi

function start_packaging() {

    echo -e "\nStarting Packaging."

    mkdir only_files

    tar -cvzf inventories.tar.gz inventories/*
    tar -cvzf ansible.tar.gz /etc/ansible/*

    mv inventories.tar.gz only_files
    mv ansible.tar.gz only_files   

    cp gce.pem only_files/
    cp gce.py only_files/
    cp gce.ini only_files/
    cp copiar_hosts.yml only_files

    tar -cvzf files.tar.gz only_files/*

    echo -e "Finished Packaging."

}

function remove_packaging() {
    
    #INVENTORY_FILE_PATH=/root/inventories.tar.gz
    #ANSIBLE_FILE_PATH=/root/ansible.tar.gz
    ONLY_FILES_PATH=/root/only_files
    FILES_FILE_PATH=/root/files.tar.gz

    echo -e "Are you sure ? yes or no: "
    read ANSWER

    if [[ "${ANSWER^^}" == "YES" ]]; then
    
        if [ -f "$FILES_FILE_PATH" ]; then
            echo -e "$FILES_FILE_PATH removing..."
            rm "$FILES_FILE_PATH"
            echo -e "Done." 
        fi
    
        if [ -d "$ONLY_FILES_PATH" ]; then
            echo "$ONLY_FILES_PATH removing..."
            rm -R -f "$ONLY_FILES_PATH"
            echo -e "Done."
        fi
    fi
}


OPTION="$1"
OK=true

while true; do
    if "$OK"; then
	    case "$OPTION" in
		    list)
                echo -e $LIST_OPTIONS
                OK=false
                shift
            ;;
            start)
                start_packaging
                OK=false
                shift
            ;;
		    remove)
                remove_packaging
                OK=false
                shift
            ;;
		    e)
                echo "Bye !!!"
                exit
            ;;
		    *)
                echo "Option $1 not recognized. Write and valid option."
           	    echo -e $LIST_OPTIONS
             	read  OPTION
            ;;
	    esac
   else
       echo -e "Whould you want to do now ?"
       echo -e $LIST_OPTIONS
       read  OPTION
       OK=true
   fi
done
