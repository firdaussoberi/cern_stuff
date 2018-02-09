#! /bin/sh -f
# created by Kyohei Nakajima - 2016/11/09
# modified by Firdaus Soberi (for non-RCNP) -2018/01/03 -2018/02/09 for ShafiqSri

#username="shafiqsri" #change this
#export HEPLIB_DIR=/home/${username}
#====================================
export last_update="2018/02/09"
export HEPLIB_DIR=${HOME}
export LD_LIBRARY_PATH=
export BREW_CELLAR=${HEPLIB_DIR}/.linuxbrew/Cellar
# ----- Path -----
export PATH=$PATH:$HEPLIB_DIR/bin

# ----- ROOT -----
export ROOT_VERSION=5.34.36
#export ROOT_VERSION=6.08.00
#export ROOTSYS=$HEPLIB_DIR/root/$ROOT_VERSION
export ROOTSYS=$HEPLIB_DIR/root_5_34_36_test   #version 5.34
#export ROOTSYS=$HEPLIB_DIR/root_6smth         #version 6.06
export PATH=$ROOTSYS/bin:$PATH
#if [ -d $ROOTSYS/lib/root ]; then
#  export LD_LIBRARY_PATH=$ROOTSYS/lib/root:$LD_LIBRARY_PATH
#fi
if [ -d $ROOTSYS/lib ]; then
  export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH
fi

#export ROOTTUTORIAL=$ROOTSYS/share/doc/root/tutorials
export ROOTTUTORIAL=$ROOTSYS/tutorials

# ----- Geant4 -----
#export G4VERSION=geant4.10.02.p02
#export G4VERSION="4.10.03.p03"
export G4VERSION=geant4.10.03.p03

export G4INSTALL=${HEPLIB_DIR}/geant4/${G4VERSION}
#export CMAKE_PREFIX_PATH=$G4INSTALL-build2
export CMAKE_PREFIX_PATH=${G4INSTALL}-build
if [ -f $CMAKE_PREFIX_PATH/bin/geant4.sh ]; then
  source ${CMAKE_PREFIX_PATH}/bin/geant4.sh
fi
export -n G4NEUTRONHP_USE_ONLY_PHOTONEVAPORATION
#unset G4NEUTRONHP_USE_ONLY_PHOTONEVAPORATION 

# ----- Python -----
#export PYTHONDIR=$HEPLIB_DIR/python/Python-2.7.5
export PYTHONDIR=$BREW_CELLAR/python/2.7.14/
export PATH=$PYTHONDIR/bin:$PATH
export LD_LIBRARY_PATH=$PYTHONDIR/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$ROOTSYS/lib/

# ----- cmake -----
export PATH=$BREW_CELLAR/cmake/3.10.1/bin:$PATH
#/home/firdaussoberi/.linuxbrew/Cellar/cmake/3.10.1/bin

# ----- gcc -----
#export PATH=${HEPLIB_DIR}/bin/gcc-4.9.4/bin:$PATH
export PATH=$/usr/bin:$PATH
export LD_LIBRARY_PATH=/usr/lib/gcc/x86_64-linux-gnu/4.9.3:/usr/lib:$LD_LIBRARY_PATH # added to install cmake
export CC=/usr/bin/gcc  # added to install Geant4
export CXX=/usr/bin/g++ # added to install Geant4

#g++ (Ubuntu 4.9.3-13ubuntu2) 
# for print information
if [ -n "$PS1" ]; then
  echo "======================================================"
  #echo "("$username")"" setup script (Last update: "$last_update")"
  echo "setup script (Last update: '$last_update')"
  #echo " - GCC version    : "`g++ --version | head -n 1 | sed 's/.*(GCC) //'`
  echo " - GCC version    : "`g++ --version | head -n 1 | sed 's/.*(Ubuntu 4.9.3-13ubuntu2) //'`
  echo " - ROOT version   : "$ROOT_VERSION
  echo " - Geant4 version : "$G4VERSION
  echo "======================================================"
fi
