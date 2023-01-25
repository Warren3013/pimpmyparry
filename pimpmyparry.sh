#!/bin/bash
#Author : Warren Mc Pherson
#version 1.0
jp2a images.jpeg


distro_check () {
	distro=$(uname -a | grep -i -c 'parrot') #check if the linux distribution is Parrot OS
    if [ "$distro" -ne 1 ] 
     then echo -e " Parrot OS Linux Not Detected "
     exit
    fi
  	}

check_for_root () {
    if [ "$EUID" -ne 0 ]
      then echo -e "\n\n Script must be run with sudo ./pimpmyparry.sh or as root \n"
      exit
    fi
    }

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
	


check_for_root
distro_check
inst_searchsploit 
inst_evilwinrm
inst_ffuf
inst_httpx
