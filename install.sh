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
apt install phantomjs
apt-get install curl
sudo curl https://getmic.ro | bash
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip install selenium==2.53.6

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
sudo apt install chromium-browser
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



echo "installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "done"

echo "installing httpx"
GO111MODULE=auto go get -u -v github.com/projectdiscovery/httpx/cmd/httpx

echo "installing ffuf"
cd ~/go/bin
git clone https://github.com/ffuf/ffuf ; cd ffuf ; go get ; go build


echo "installing wayback url"
go get github.com/tomnomnom/waybackurls

echo "installing hakrawler"
go get github.com/hakluke/hakrawler
go get github.com/hakluke/hakcheckurl
echo "Done"

echo "installing findomain"
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux
./findomain-linux
echo "done"



echo "Installing okadminfinder3"
git clone https://github.com/mIcHyAmRaNe/okadminfinder3.git
cd okadminfinder3
pip3 install --user -r requirements.txt
chmod +x okadminfinder.py
xd ~/tools/
echo "Done"

echo "installing subfinder"
GO111MODULE=auto go get -u -v github.com/projectdiscovery/subfinder/cmd/subfinder
echo "done"

echo "Installing AMASS"
export GO111MODULE=on
go get -v github.com/OWASP/Amass/v3/...
echo "Done"

cd ~/tools/

echo "installing Nuclei"
 GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
 nuclei -update-templates
cd ~/tools/
echo "done"


echo "Installing Gau and SubJS"
GO111MODULE=on go get -u -v github.com/lc/gau
GO111MODULE=on go get -u -v github.com/lc/subjs
echo "Done"



echo "Installing OhMyZSH"
sudo apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo "Done"

echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la

echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/Deepaklahari/recon_profile
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
cd ~/tools/
echo "done"

