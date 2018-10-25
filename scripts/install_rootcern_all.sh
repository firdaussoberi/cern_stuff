#$ set -x

#========================Prerequisites/Required (Ubuntu only, refer cern website's for redhat etc)===
#required packages
sudo apt-get install wget xorg emacs24 gedit python-pip git dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev
#optional but nevermind...
sudo apt-get install gfortran libssl-dev libpcre3-dev xlibmesa-glu-dev libglew1.5-dev libftgl-dev libmysqlclient-dev libfftw3-dev libcfitsio-dev graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python-dev libxml2-dev libkrb5-dev libgsl0-dev libqt4-dev
#==========================================================================================
#=========================Initial variables================================================
ROOT6VER=6.14.02
export HOME2=$HOME
WHERE_TO_DOWNLOAD_ROOT=$HOME2/root_download                                  #can change folder name
WHERE_TO_INSTALL_ROOT=$HOME2/root-${ROOT6VER}_run                            #comment if using ROOt ver 5
                                                                             #can change folder name
#WHERE_TO_INSTALL_ROOT=$HOME2/root_5_34_36                                   #uncomment if using ROOt ver 5
                                                                             #can change folder name
#=======================================================================================
#========================Download files================================================
sudo mkdir -pv $WHERE_TO_DOWNLOAD_ROOT
cd $WHERE_TO_DOWNLOAD_ROOT
#sudo wget https://root.cern.ch/download/root_v5.34.36.source.tar.gz         #uncomment for ROOT ver 5
sudo wget https://root.cern.ch/download/root_v${ROOT6VER}.source.tar.gz      #comment if using ROOt ver 5
#sudo tar -xzvpf root_v5.34.36.source.tar.gz                                 #uncomment for ROOT ver 5
sudo tar -xzvpf root_v${ROOT6VER}.source.tar.gz                              #comment if using ROOt ver 5
#===============Building and compiling, works only for source distribution============
sudo mkdir -pv $WHERE_TO_INSTALL_ROOT
cd $WHERE_TO_INSTALL_ROOT
#sudo cmake $WHERE_TO_DOWNLOAD_ROOT/root
sudo cmake $WHERE_TO_DOWNLOAD_ROOT/root-${ROOT6VER}
#sudo cmake --build . --target VDT
sudo cmake --build . -- -j2
#sudo cmake --build . -- -j$(nproc)
#nproc is for how many core the cpu has, this is for faster building by using all cores
#=====================================================================================
#*************************************************************************************
#*************************************************************************************
#*************************************************************************************
#=====================================================================================
#=====================================================================================
#old commands,  don't bother, for testing purpose
#username="firdaussoberi"                         #change this line (/home/yourusername)
#export HOME2=/home/${username}                   
#$ WHERE_TO_INSTALL_ROOT=/usr/local                           
#$ sudo wget https://root.cern.ch/download/root_v5.34.36.Linux-ubuntu14-x86_64-gcc4.8.tar.gz
#$ sudo tar -xzvpf root_v5.34.36.Linux-ubuntu14-x86_64-gcc4.8.tar.gz
#$ tar -xzvpf root_v5.30.00.source.tar.gz
#$ wget https://root.cern.ch/download/root_v5.34.36.Linux-ubuntu14-x86_64-gcc4.8.tar.gz
#$ wget ftp://root.cern.ch/root/root_v5.30.00.source.tar.gz
