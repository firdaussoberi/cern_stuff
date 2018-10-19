#$ set -x

#========================Prerequisites (Ubuntu only, refer cern website's for redhat etc)===
#required packages
sudo apt-get install git dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev
#optional but nevermind...
sudo apt-get install gfortran libssl-dev libpcre3-dev xlibmesa-glu-dev libglew1.5-dev libftgl-dev libmysqlclient-dev libfftw3-dev libcfitsio-dev graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python-dev libxml2-dev libkrb5-dev libgsl0-dev libqt4-dev
#==========================================================================================
#=========================Initial variables================================================
#username="firdaussoberi"                         #change this line (/home/yourusername)
#export HOME2=/home/${username}                   
export HOME2=$HOME                   
WHERE_TO_DOWNLOAD_ROOT=$HOME2/root_download_v5 #change this line
WHERE_TO_INSTALL_ROOT=$HOME2/root_5_34_36_run   #change this line
#$ WHERE_TO_INSTALL_ROOT=/usr/local                           
#$ WHERE_TO_INSTALL_ROOT=$HOME2/root_5_34_36 
#=======================================================================================
#========================Download files================================================
sudo mkdir -pv $WHERE_TO_DOWNLOAD_ROOT
cd $WHERE_TO_DOWNLOAD_ROOT
sudo wget https://root.cern.ch/download/root_v5.34.36.source.tar.gz
sudo tar -xzvpf root_v5.34.36.source.tar.gz
#$ sudo wget https://root.cern.ch/download/root_v5.34.36.Linux-ubuntu14-x86_64-gcc4.8.tar.gz
#$ sudo tar -xzvpf root_v5.34.36.Linux-ubuntu14-x86_64-gcc4.8.tar.gz
#$ tar -xzvpf root_v5.30.00.source.tar.gz
#$ wget https://root.cern.ch/download/root_v5.34.36.Linux-ubuntu14-x86_64-gcc4.8.tar.gz
#$ wget ftp://root.cern.ch/root/root_v5.30.00.source.tar.gz
#===============Building and compiling, works only for source distribution============
sudo mkdir -pv $WHERE_TO_INSTALL_ROOT
cd $WHERE_TO_INSTALL_ROOT
sudo cmake $WHERE_TO_DOWNLOAD_ROOT/root
sudo cmake --build .
#=====================================================================================




#=====================Extras, unless want advanced options, don't bother==============
#$ sudo ./configure linux --with-x11-libdir=/usr/lib/i386-linux-gnu --with-xft-libdir=/usr/lib/i386-linux-gnu --with-xext-libdir=/usr/lib/i386-linux-gnu --with-xrootd-opts=--syslibs=/usr/lib/i386-linux-gnu --prefix=$WHERE_TO_INSTALL_ROOT

#$ ./configure linuxx8664gcc --enable-asimage --enable-astiff --enable-builtin-afterimage --enable-builtin_ftgl --enable-builtin_glew --enable-builtin_pcre --enable-builtin-lzma --enable-cintex --enable-explicitlink --enable-fftw3 --enable-genvector --enable-krb5 --enable-mathmore --enable-memstat --enable-mysql --enable-opengl --enable-pgsql --enable-pythia6 --enable-python --enable-reflex --enable-roofit --enable-shadowpw --enable-shared --enable-ssl --enable-tmva --enable-vdt --enable-x11 --enable-xft --enable-xml

#$ ./configure linuxx8664gcc --enable-asimage --enable-astiff --enable-builtin-afterimage --enable-builtin_ftgl --enable-builtin_glew --enable-builtin_pcre --enable-builtin-lzma --enable-cintex --enable-explicitlink --enable-fftw3 --enable-genvector --enable-krb5 --enable-mathmore --enable-memstat --enable-mysql --enable-opengl --enable-pgsql --enable-pythia6 --enable-python --enable-reflex --enable-roofit --enable-shadowpw --enable-shared --enable-ssl --enable-tmva --enable-vdt --enable-x11 --enable-xft --enable-xml --prefix=$WHERE_TO_INSTALL_ROOT

#$ ./configure
#$ sudo make
#$ sudo make install                     ## sudo needed at least for for /etc/root
#NEVER use make install in modern distros. Instead use:
#$ sudo checkinstall --pkgname=root-framework --fstrans=no --strip=no make install
#$ sudo

#====================For testing, after complete installation=====================
#$ cd $WHERE_TO_INSTALL_ROOT
#$ sudo source bin/thisroot.sh
#$ root -l                                 ##  :-)   works...
#       .Q                                 # to quit root
#$      .q                                 # to quit root
#=================================================================================
