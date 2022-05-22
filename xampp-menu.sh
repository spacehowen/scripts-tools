#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}*-${number} 1)${menu} Start Apache ${normal}\n"
    printf "${menu}*-${number} 2)${menu} Restart Apache ${normal}\n"
    printf "${menu}*-${number} 3)${menu} Stop Apche ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Ingrese una opción de menú o ingrese ${fgred}x para salir. ${normal}"
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear;
            option_picked "Opción 1 elegida";
            printf "sudo service apache2 start.. \n";
	    sudo /opt/lampp/lampp start
            show_menu;
        ;;
        2) clear;
            option_picked "Opción 2 elegida";
            printf "sudo service apache2 restart.. \n";
	    sudo /opt/lampp/lampp restart
            show_menu;
        ;;
        3) clear;
            option_picked "Opción 3 elegida";
            printf "sudo service apache2 stop.. \n";
	    sudo /opt/lampp/lampp stop
            show_menu;
        ;;
        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Elige una opción del menú";
            show_menu;
        ;;
      esac
    fi
done
