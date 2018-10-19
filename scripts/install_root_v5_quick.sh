echo "ROOTCERN auto install script-Firdaus Soberi"
echo "Enter your password"
sudo rm -f install_rootcern_all.sh*
echo "Initializing installation of ROOT version 5"
sudo wget https://raw.githubusercontent.com/firdaussoberi/cern_stuff/master/scripts/install_rootcern_all.sh
source install_rootcern_all.sh
