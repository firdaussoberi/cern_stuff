#Initial variables, youu can check what the variables do, but if you want a quick setting just change the two lines below:
#This assumes you have enough admin/root access to install new packages (e.g sudo access will do)
#============================================================================================================================
export HOME2=$HOME
INSTALL_FOLDER=$HOME2/geant4_new  #change this line, all geant4 will be installed inside
GEANT4=geant4
GEANT4VER=10.3
GEANT4PATCHNUM=3                   #if no patch yet or is the first version of the release, put GEANTPATCHNUM=0
#refer: https://github.com/Geant4/geant4/releases
GEANT_GITDOWNLOAD=v${GEANT4VER}.${GEANT4PATCHNUM}.tar.gz   #fix broken geant4 link, now download from github
GEANT_VERSION=${GEANT4}-${GEANT4VER}.${GEANT4PATCHNUM}
#GEANT_VERSION=geant4.10.03.p03     #change this line, or let it be same, you can check the version on geant4 website (link put later)
#============================================================================================================================
#=============Preparation, check prerequisites, don't change this unless you know what you are
#doing or don't want to install new packages
sudo apt-get update
#sudo apt-get upgrade
sudo apt-get install git  #will pull a lot of files from github later
sudo apt-get install libxerces-c3-dev qt4-dev-tools freeglut3-dev libmotif-dev tk-dev cmake libxpm-dev libxmu-dev libxi-dev
#=============================================================================================================================

#==========================================
sudo mkdir -pv ${INSTALL_FOLDER}/${GEANT_VERSION}-build
cd ${INSTALL_FOLDER}/${GEANT_VERSION}-build
#==========Installation steps
cd $INSTALL_FOLDER
#==========Download geant4 source
#sudo wget http://geant4.web.cern.ch/geant4/support/source/${GEANT_VERSION}.tar.gz     #now download from github
sudo wget https://github.com/Geant4/geant4/archive/${GEANT_GITDOWNLOAD}
#sudo tar -xzvpf ${GEANT_VERSION}.tar.gz
sudo tar -xzvpf ${GEANT_GITDOWNLOAD}

#==========Build
sudo mkdir -pv ${GEANT_VERSION}-build
cd ${GEANT_VERSION}-build
#=============Advanced option uses -D arguments, see e.g: http://geant4.web.cern.ch/geant4/UserDocumentation/UsersGuides/InstallationGuide/BackupVersions/V9.6/fo/BookInstalGuide.pdf 
sudo cmake -DCMAKE_INSTALL_PREFIX=../${GEANT_VERSION}-build/ -DGEANT4_INSTALL_DATA=ON -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_RAYTRACER_X11=ON -DGEANT4_USE_QT=ON -DGEANT4_USE_G3TOG4=ON -DGEANT4_USE_INVENTOR=OFF -DGEANT4_USE_XM=ON ../${GEANT_VERSION}/
#==========Cmake options
#-DCMAKE_INSTALL_PREFIX=../geant4.10.03-install
#-DGEANT4_INSTALL_DATA=ON
#-DGEANT4_USE_OPENGL_X11=ON
#-DGEANT4_USE_GDML=ON
#-DGEANT4_USE_XM=ON
#-DGEANT4_USE_QT=ON
#-DGEANT4_BUILD_MULTITHREADED=ON
#==========After cmake, make. N is number of cpu cores, e.g) 2. After make、make instal
sudo make
sudo make install
#$make -jN
#$make install -jN
#==========Add path to .bashrc
