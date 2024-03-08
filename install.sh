cd /etc/apt/sources.list.d
rm ct-preset.list
apt update && apt -y upgrade
apt --fix-broken install
apt -y upgrade
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh 4
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
apt update
apt install -y pip nodejs nano
npm install -g npm@latest
systemctl stop apache2
apt remove apache2
apt autoremove
curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | sudo bash
sudo apt-get install pufferpanel
sudo pufferpanel user add
sudo systemctl enable --now pufferpanel
apt install -y nginx
cd /etc/nginx/sites-available
rm default
wget -N https://raw.githubusercontent.com/trisout78/woiden-pufferpanel-install/main/pufferpanel.conf
systemctl restart nginx
