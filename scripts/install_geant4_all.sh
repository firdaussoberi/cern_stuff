#Initial variables, youu can check what the variables do, but if you want a quick setting just change the two lines below:
#This assumes you have enough admin/root access to install new packages (e.g sudo access will do)
#============================================================================================================================
export HOME2=$HOME
INSTALL_FOLDER=$HOME2/geant4_new  #change this line, all geant4 will be installed inside
GEANT4=geant4
GEANT4VER=10.3
GEANT4PATCHNUM=3
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

#=============Configure visualization tools for GEANT4, OpenInventor option 
#=============
#sudo mkdir -pv ${INSTALL_FOLDER}/coin3d_source
#cd ${INSTALL_FOLDER}/coin3d_source
#============Download from Github
#sudo wget https://github.com/firdaussoberi/cern_stuff/blob/master/Coin-3.1.3.tar.gz
#sudo wget https://github.com/firdaussoberi/cern_stuff/blob/master/SoQt-1.5.0.tar.gz
#sudo wget https://github.com/firdaussoberi/cern_stuff/blob/master/SoXt-1.3.0.tar.gz
#sudo wget https://github.com/firdaussoberi/cern_stuff/blob/master/simage-1.7.0.tar.gz
#git clone https://github.com/firdaussoberi/cern_stuff/blob/master/Coin-3.1.3.tar.gz
#git clone https://github.com/firdaussoberi/cern_stuff/blob/master/SoQt-1.5.0.tar.gz
#git clone https://github.com/firdaussoberi/cern_stuff/blob/master/SoXt-1.3.0.tar.gz
#git clone https://github.com/firdaussoberi/cern_stuff/blob/master/simage-1.7.0.tar.gz
#https://raw.githubusercontent.com/firdaussoberi/cern_stuff/master/
#sudo wget https://raw.githubusercontent.com/firdaussoberi/cern_stuff/master/Coin-3.1.3.tar.gz
#sudo wget https://raw.githubusercontent.com/firdaussoberi/cern_stuff/master/SoQt-1.5.0.tar.gz
#sudo wget https://raw.githubusercontent.com/firdaussoberi/cern_stuff/master/SoXt-1.3.0.tar.gz
#sudo wget https://raw.githubusercontent.com/firdaussoberi/cern_stuff/master/simage-1.7.0.tar.gz
#============Extract
#echo 'Tar -xzvf siimage...';sleep 3;
#sudo tar -xvz -f simage-1.7.0.tar.gz
#echo 'Tar -xzvf Coin-3.1.3...';sleep 3;
#sudo tar -xvz -f Coin-3.1.3.tar.gz
#echo 'Tar -xzvf SoXt-1.3.0...';sleep 3;
#sudo tar -xvz -f SoXt-1.3.0.tar.gz
#echo 'Tar -xzvf SoQt-1.5.0...';sleep 3;
#sudo tar -xvz -f SoQt-1.5.0.tar.gz

#===========Replace files with wrong lines with corrected
#https://www.hep.ucl.ac.uk/pbt/wiki/Software/Geant4/Installation/Coin3D
#Fix Errors In Coin3D Code
#Coin3D and each of the components contain a number of programming errors. Most can be ignored and skipped over by adding the compiler flag -fpermissive at the configuration step.
#However, there is an error in the Coin3D source code that needs to be fixed before the code will compile:
#In the Coin3D source directory, find the directory src/fonts/ and open the file src/fonts/freetype.cpp.
#Insert the following two lines in src/fonts/freetype.cpp before the line #include fonts/freetype.h:
#$    #include <cstdlib>
#$    #include <cmath>
#The code should now compile successfully.
#Further modifications to enable compiling Geant4 with OpenInventor
#Geant4 compilation with OpenInventor enabled will fail unless an additional modification is made to the Coin3D source code.
#Open the file /include/Inventor/SbBasic.h inside the Coin3D source, and add the following line below #include <Inventor/C/basic.h>:
#$   #include <Inventor/C/errors/debugerror.h>

#sudo wget https://github.com/firdaussoberi/cern_stuff/blob/master/freetype.cpp
#sudo wget https://github.com/firdaussoberi/cern_stuff/blob/master/SbBasic.h
#git clone https://github.com/firdaussoberi/cern_stuff/blob/master/freetype.cpp
#git clone https://github.com/firdaussoberi/cern_stuff/blob/master/SbBasic.h
#https://raw.githubusercontent.com/firdaussoberi/cern_stuff/master/
#sudo wget https://raw.githubusercontent.com/firdaussoberi/cern_stuff/master/freetype.cpp
#sudo wget https://raw.githubusercontent.com/firdaussoberi/cern_stuff/master/SbBasic.h
#echo 'Replacing freetype.cpp in /src/fonts and SbBasic.h in /include/Inventor...'; sleep 3;
#sudo cp ./freetype.cpp ${INSTALL_FOLDER}/coin3d_source/Coin-3.1.3/src/fonts
#sudo cp ./SbBasic.h ${INSTALL_FOLDER}/coin3d_source/Coin-3.1.3/include/Inventor
#===============================NEXT.......
#==========================================
sudo mkdir -pv ${INSTALL_FOLDER}/${GEANT_VERSION}-build
cd ${INSTALL_FOLDER}/${GEANT_VERSION}-build
#sudo mkdir -pv coin3d/simage-1.7.0
#sudo mkdir -pv coin3d/Coin-3.1.3
#sudo mkdir -pv coin3d/SoXt-1.3.0
#sudo mkdir -pv coin3d/SoQt-1.5.0
#
#sudo mkdir -pv ${INSTALL_FOLDER}/geant4_prerequisites/simage-1.7.0
#sudo mkdir -pv ${INSTALL_FOLDER}/geant4_prerequisites/Coin-3.1.3
#sudo mkdir -pv ${INSTALL_FOLDER}/geant4_prerequisites/SoXt-1.3.0
#sudo mkdir -pv ${INSTALL_FOLDER}/geant4_prerequisites/SoQt-1.5.0

#cd coin3d/simage-1.7.0
#echo "You are now in: "${PWD};sleep 4;
#echo "Configuring..";sleep 4;
#sudo ../../../coin3d_source/simage-1.7.0/configure --prefix=${INSTALL_FOLDER}/geant4_prerequisites/simage-1.7.0 CXXFLAGS=-fpermissive
#echo "Now make...";sleep 4;
#sudo make
#echo "Now make install...";sleep 4;
#sudo make install
#cd ..
#echo "You are now in: "${PWD};sleep 4;

#cd Coin-3.1.3
#echo "You are now in: "${PWD};sleep 4;
#echo "Configuring..";sleep 4;
#sudo ../../../coin3d_source/Coin-3.1.3/configure --prefix=${INSTALL_FOLDER}/geant4_prerequisites/Coin-3.1.3 CXXFLAGS=-fpermissive
#echo "Now make...";sleep 4;
#sudo make
#echo "Now make install...";sleep 4;
#sudo make install
#cd ..
#echo "You are now in: "${PWD};sleep 4;

#cd SoXt-1.3.0
#echo "You are now in: "${PWD};sleep 4;
#echo "Configuring..";sleep 4;
#sudo ../../../coin3d_source/SoXt-1.3.0/configure --with-coin=${INSTALL_FOLDER}/geant4_prerequisites/Coin-3.1.3 --prefix=${INSTALL_FOLDER}/geant4_prerequisites/SoXt-1.3.0 CXXFLAGS=-fpermissive
#echo "Now make...";sleep 4;
#sudo make
#echo "Now make install...";sleep 4;
#sudo make install
#cd ..
#echo "You are now in: "${PWD};sleep 4;

#cd SoQt-1.5.0
#echo "You are now in: "${PWD};sleep 4;
#echo "Configuring..";sleep 4;
#sudo ../../../coin3d_source/SoQt-1.5.0/configure --with-coin=${INSTALL_FOLDER}/geant4_prerequisites/Coin-3.1.3 --prefix=${INSTALL_FOLDER}/geant4_prerequisites/SoQt-1.5.0 CXXFLAGS=-fpermissive
#echo "Now make...";sleep 4;
#sudo make
#echo "Now make install...";sleep 4;
#sudo make install
#cd ..
#echo "You are now in: "${PWD};sleep 4;
#======================================NEXT....
#==============================================

#==========Installation steps
cd $INSTALL_FOLDER
#==========Download geant4 source
#sudo wget http://geant4.web.cern.ch/geant4/support/source/${GEANT_VERSION}.tar.gz     #now download from github
sudo wget ${GEANT_GITDOWNLOAD}
#sudo tar -xzvpf ${GEANT_VERSION}.tar.gz
sudo tar -xzvpf ${GEANT_VERSION}
#==========CANDLES current version, but better to use latest patch for each version, this one not really the latest, usually ends with p03 (patch 03)
#sudo wget http://geant4.web.cern.ch/geant4/support/source/geant4.10.02.p02.tar.gz #(so this one is geant4 version 10.2, patch 2)
#sudo tar -zxf geant4.10.02.p02.tar.gz
#last pathch of each version:
#geant4.10.02.p03.tar.gz
#geant4.10.03.p03.tar.gz
#geant4.10.04.tar.gz
#==========Build
#sudo mkdir -pv ${GEANT_VERSION}-build
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
##
# GEANT4
##
#$source /opt/geant4/geant4.10.03-install/bin/geant4.sh"
#$source /opt/geant4/geant4.10.02-install/bin/geant4.sh"
#==========Test
#==========Use example/basic
#mkdir workspace
#$ mkdir workspace/g4work
#$ mkdir workspace/g4work/basic
#$ cd workspace/g4work/basic
#$ cp -r /opt/geant4/geant4.10.03/examples/basic/B2 . 
#$ mkdir B2-build 
#$ cd B2-build
#$ cmake ../B2
#$ make -jN
#$ cd B2b
#$ ./exampleB2b
