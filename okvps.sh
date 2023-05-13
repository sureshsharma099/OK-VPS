#!/bin/bash -i

#Creating tools directory if not exist
mkdir -p /root/OK-VPS/tools /root/OK-VPS/tools/file /root/wordlist /root/templates;
clear;

ENVIRONMENT () {
	echo -e ${BLUE}"[ENVIRONMENT]" ${RED}"Packages required installation in progress ...";
	
    	apt-get update -y > /dev/null 2>&1;
	sudo apt install wget > /dev/null 2>&1;
	apt-get install golang -y > /dev/null 2>&1;
	apt-get install python > /dev/null 2>&1;
	apt-get install python2 > /dev/null 2>&1;
	apt-get install python3 -y > /dev/null 2>&1;
	apt-get install pip -y > /dev/null 2>&1;
	apt-get install unzip > /dev/null 2>&1;
	apt install curl -y > /dev/null 2>&1;
	pip3 install colored  > /dev/null 2>&1;
	pip3 install jsbeautifier > /dev/null 2>&1;
	apt install snap -y > /dev/null 2>&1;
	apt install jq -y > /dev/null 2>&1;
	apt install python-pip -y > /dev/null 2>&1;
	apt install snapd -y > /dev/null 2>&1;
	apt install python3-pip -y > /dev/null 2>&1;
	sudo apt install snapd
	sudo apt-get install parallel
	sudo rm /etc/parallel/config
	sudo apt-get --assume-yes install git make gcc
	sudo apt-get install -y grepcidr
	sudo apt install wkhtmltopdf
	sudo apt install -y libpcap-dev
}

DNS_RESOLVER () {
	#MassDNS
	echo -e ${BLUE}"[DNS RESOLVER]" ${RED}"MassDNS installation in progress ...";
	sudo su
	cd /root/OK-VPS/tools && git clone https://github.com/blechschmidt/massdns.git > /dev/null 2>&1 && cd massdns && make && make install > /dev/null 2>&1 && ln -s /root/OK-VPS/tools/massdns/bin/massdns /usr/local/bin/;
	echo -e ${BLUE}"[DNS RESOLVER]" ${GREEN}"MassDNS installation is done !"; echo "";
	#PureDNS
	echo -e ${BLUE}"[DNS RESOLVER]" ${RED}"PureDNS installation in progress ...";
	GO111MODULE=on go install github.com/d3mondev/puredns/v2@latest > /dev/null 2>&1 && ln -s ~/go/bin/puredns /usr/local/bin;
	echo -e ${BLUE}"[DNS RESOLVER]" ${GREEN}"PureDNS installation is done !"; echo "";
	
	git clone https://github.com/robertdavidgraham/masscan
	cd masscan
	make
	make install
	
	su nishant57

	go install -v github.com/owasp-amass/amass/v3/...@master
	sudo cp $HOME/go/bin/amass /usr/local/bin
	
	go install github.com/lc/subjs@latest
	sudo cp $HOME/go/bin/subjs /usr/local/bin

	go install github.com/lc/gau/v2/cmd/gau@latest
	sudo cp $HOME/go/bin/gau /usr/local/bin

	go install github.com/hakluke/haklistgen@latest
	sudo cp $HOME/go/bin/haklistgen /usr/local/bin
	sudo pip3 install dnsgen
	
	go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
	sudo cp $HOME/go/bin/nuclei /usr/local/bin
	
	go install github.com/tomnomnom/hacks/tok@master
	sudo cp $HOME/go/bin/tok /usr/local/bin
	
	go install github.com/tomnomnom/assetfinder@latest
	sudo cp $HOME/go/bin/assetfinder /usr/local/bin
	
	go install github.com/tomnomnom/httprobe@master
	sudo cp $HOME/go/bin/httprobe /usr/bin/
	
	go install github.com/haccer/subjack@latest
	sudo cp $HOME/go/bin/subjack /usr/bin/
	
	go install github.com/sensepost/gowitness@latest
	sudo cp $HOME/go/bin/gowitness /usr/local/bin
	
	go install github.com/hakluke/hakrawler@latest
	sudo cp $HOME/go/bin/hakrawler /usr/local/bin

	go install github.com/Josue87/gotator@latest
	sudo cp $HOME/go/bin/gotator /usr/local/bin
	
	go install -v github.com/tomnomnom/anew@latest
	sudo cp $HOME/go/bin/anew /usr/local/bin
	
	go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
	sudo cp $HOME/go/bin/httpx /usr/local/bin

	go install github.com/jaeles-project/gospider@latest
	sudo cp $HOME/go/bin/gospider /usr/local/bin

	go install github.com/tomnomnom/unfurl@latest
	sudo cp $HOME/go/bin/unfurl /usr/local/bin
	
	go install github.com/OJ/gobuster/v3@latest
	sudo cp $HOME/go/bin/gobuster /usr/local/bin

	go install github.com/ffuf/ffuf/v2@latest
	sudo cp $HOME/go/bin/ffuf /usr/local/bin

	go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
	sudo cp $HOME/go/bin/subfinder /usr/local/bin
	
	go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
	sudo cp $HOME/go/bin/naabu /usr/local/bin
	
	go install -v github.com/projectdiscovery/wappalyzergo/cmd/update-fingerprints@latest
	sudo cp $HOME/go/bin/wappalyzergo /usr/local/bin
	
	cd $HOME/BB
	git clone https://github.com/vortexau/dnsvalidator.git
	cd dnsvalidator
	sudo pip install -r requirements.txt
	sudo python3 setup.py install
	
	cd $HOME
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source $HOME/.cargo/env
	rustup update
	sudo apt install cargo
	
	cd $HOME
	git clone https://github.com/findomain/findomain.git
	cd findomain
	cargo build --release
	sudo cp target/release/findomain /usr/bin/
	
	cd $HOME/BB
	git clone https://github.com/Josue87/AnalyticsRelationships.git
	cd AnalyticsRelationships/
	go build -ldflags "-s -w"
	
	cd $HOME/BB
	git clone https://github.com/SpiderLabs/HostHunter.git
	cd HostHunter
	sudo pip3 install -r requirements.txt

	cd $HOME
	cargo install ripgen
	
	cd $HOME/BB
	
	git clone https://github.com/shmilylty/OneForAll.git
	cd OneForAll/
	sudo python3 -m pip install -U pip setuptools wheel
	sudo pip3 install -r requirements.txt
	
	cd $HOME/BB
	git clone https://github.com/dariusztytko/vhosts-sieve.git
	sudo pip3 install -r vhosts-sieve/requirements.txt
	
	cd $HOME/BB
	git clone https://github.com/punk-security/dnsReaper.git
	cd dnsReaper
	sudo pip install -r requirements.txt
	
	sudo pip install gdown
}

ENVIRONMENT && DNS_RESOLVER;
