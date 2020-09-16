#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt-get install make
sudo apt-get install perl


#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.15.2.linux-amd64.tar.gz
					sudo tar -xvf go1.15.2.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi



echo " creating tools folder in root directory "
mkdir ~/tools
cd ~/tools/

#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"

#install chromium
echo "Installing Chromium"
sudo snap install chromium
echo "done"

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo "installing sqlmap"
apt install sqlmap
cd ~/tools/
echo "done"

echo "installing nmap"
sudo apt-get install -y nmap
echo "done"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

echo "installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "done"

echo "installing httpx"
GO111MODULE=auto go get -u -v github.com/projectdiscovery/httpx/cmd/httpx

echo "installing ffuf"
sudo go get github.com/ffuf/ffuf

echo "installing wayback url"
go get github.com/tomnomnom/waybackurls

echo "installing hakrawler"
go get github.com/hakluke/hakrawler

echo "installing findomain"
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux
./findomain-linux
echo "done"

echo "installing subfinder"
GO111MODULE=auto go get -u -v github.com/projectdiscovery/subfinder/cmd/subfinder
echo "done"

echo "installing Nuclei"
GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
echo "done"


echo "installing webscreenshot"
git clone https://github.com/maaaaz/webscreenshot.git
cd webscreenshot 
pip install -r requirements.txt

echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la

echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/deepaklahari/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
cd ~/tools/
echo "done"

