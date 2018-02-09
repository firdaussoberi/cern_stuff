#sudo su
echo "Make sure you did 'sudo su' first!"
source install_rootcern_all.sh 2>&1 | tee -a ../log_rootcern.log
source install_geant4_all.sh 2>&1 | tee -a ../log_geant4.log
sudo rm ../log_rootcern.log #if do many installation, remove log for next one
sudo rm ../log_geant4.log   #if do many installation, remove log for next one
