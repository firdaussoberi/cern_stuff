#$ set -x

#========================Prerequisites/Required (Ubuntu only, refer cern website's for redhat etc)===
#required packages
sudo apt-get install wget xorg emacs25 emacs24 gedit python-pip git dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev
#emacs25 for Ubuntu18
#optional but nevermind...
sudo apt-get install gfortran libssl-dev libpcre3-dev xlibmesa-glu-dev libglew1.5-dev libftgl-dev libmysqlclient-dev libfftw3-dev libcfitsio-dev graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python-dev libxml2-dev libkrb5-dev libgsl0-dev libqt4-dev
#==========================================================================================
#=========================Initial variables================================================
#Change to your preferred ROOT version, if you want...
ROOTVER=6.14.02
#Last ROOT5 version:
#5.34.36

export HOME2=$HOME
#=================================== Checking ROOTVER =====================================
MAJORROOTVER="${ROOTVER:0:1}"
if [  $MAJORROOTVER -eq 5 ]
then
    ROOTSOURCE_FOLDER=root
    echo "ROOTVERSION is:" $MAJORROOTVER
    echo "Source folder is:" $ROOTSOURCE_FOLDER 
elif [  $MAJORROOTVER -eq 6 ]
then
    ROOTSOURCE_FOLDER=root-${ROOTVER}
    echo "ROOTVERSION is:" $MAJORROOTVER
    echo "Source folder is:" $ROOTSOURCE_FOLDER 
else
    echo "ERROR: ROOTVERSION not found. Check the install_rootcern_all.sh file and start again"
    return
fi
#==========================================================================================
WHERE_TO_DOWNLOAD_ROOT=$HOME2/root_download                                 #can change folder name
WHERE_TO_INSTALL_ROOT=$HOME2/root-${ROOTVER}_run                            #can change folder name 

#=======================================================================================
#========================Download files================================================
sudo mkdir -pv $WHERE_TO_DOWNLOAD_ROOT
cd $WHERE_TO_DOWNLOAD_ROOT
sudo wget https://root.cern.ch/download/root_v${ROOTVER}.source.tar.gz      
sudo tar -xzvpf root_v${ROOTVER}.source.tar.gz

#===============Building and compiling, works only for source distribution============
sudo mkdir -pv $WHERE_TO_INSTALL_ROOT
cd $WHERE_TO_INSTALL_ROOT
sudo cmake $WHERE_TO_DOWNLOAD_ROOT/${ROOTSOURCE_FOLDER}
sudo cmake --build . -- -j2
#sudo cmake --build . -- -j$(nproc)
#nproc is for how many core the cpu has, this is for faster building by using all cores
#=====================================================================================
#*************************************************************************************
#*************************************************************************************
#*************************************************************************************
