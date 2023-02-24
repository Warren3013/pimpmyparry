#!/bin/bash
#Author : Warren Mc Pherson
#version 1.0
jp2a images.jpeg


#check if the correct distro is parrot os
	distrobution=$(uname -a | grep -i -c 'parrot') 
    if [ "$distrobution" -ne 1 ] 
     then echo -e " Parrot OS Linux Not Detected "
     exit
    fi


#check if the script is run as root
    if [ "$EUID" -ne 0 ]
      then echo -e "Script must be run with sudo"
      exit
    fi


inst_searchsploit () {
	git clone https://gitlab.com/exploit-database/exploitdb.git /opt/exploit-database
	echo '$PATH' /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
	ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit
	cp -n /opt/exploit-database/.searchsploit_rc ~/
	}

inst_evilwinrm () {
	gem install evil-winrm
	}

inst_ffuf () {
	apt install ffuf
	}

inst_httpx () {
	pip install 'httpx[cli]'
	}
	



inst_searchsploit 
inst_evilwinrm
inst_ffuf
inst_httpx
