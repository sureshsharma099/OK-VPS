#!/bin/bash -i

#Creating tools directory if not exist
mkdir -p /root/OK-VPS/tools /root/OK-VPS/tools/file /root/wordlist /root/templates;
clear;

ENVIRONMENT () {
	echo -e ${BLUE}"[ENVIRONMENT]" ${RED}"Packages required installation in progress ...";
	
        apt-get update -y > /dev/null 2>&1;
	apt-get install golang -y > /dev/null 2>&1;
        apt-get install python > /dev/null 2>&1;
        apt-get install python2 > /dev/null 2>&1;
        apt-get install python3 -y > /dev/null 2>&1;
        apt-get install pip -y > /dev/null 2>&1;
	apt-get install unzip > /dev/null 2>&1;
	apt install curl -y > /dev/null 2>&1;
	pip3 install colored  > /dev/null 2>&1;
	apt install snap -y > /dev/null 2>&1;
	apt install jq -y > /dev/null 2>&1;
	apt install python-pip -y > /dev/null 2>&1;
	apt install snapd -y > /dev/null 2>&1;
	apt install python3-pip -y > /dev/null 2>&1;
	pip3 install jsbeautifier > /dev/null 2>&1;
	pip3 install lxml > /dev/null 2>&1;
}

DNS_RESOLVER () {
	#MassDNS
	echo -e ${BLUE}"[DNS RESOLVER]" ${RED}"MassDNS installation in progress ...";
	cd /root/OK-VPS/tools && git clone https://github.com/blechschmidt/massdns.git > /dev/null 2>&1 && cd massdns && make && make install > /dev/null 2>&1 && ln -s /root/OK-VPS/tools/massdns/bin/massdns /usr/local/bin/;
	echo -e ${BLUE}"[DNS RESOLVER]" ${GREEN}"MassDNS installation is done !"; echo "";
	#PureDNS
	echo -e ${BLUE}"[DNS RESOLVER]" ${RED}"PureDNS installation in progress ...";
	GO111MODULE=on go install github.com/d3mondev/puredns/v2@latest > /dev/null 2>&1 && ln -s ~/go/bin/puredns /usr/local/bin;
	echo -e ${BLUE}"[DNS RESOLVER]" ${GREEN}"PureDNS installation is done !"; echo "";
}

ENVIRONMENT && DNS_RESOLVER;
