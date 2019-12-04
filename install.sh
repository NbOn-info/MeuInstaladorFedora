##########################################
###Update do sistema######################
##########################################

sudo dnf update -y;


##########################################
###Instalação do RPMFusion################
##########################################

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf update -y;


##########################################
#Instalação de Programas em Reprositorios#
##########################################

sudo dnf install lsb "libappindicator3.so.1()(64bit)" libreoffice vlc inkscape gimp kdenlive libreoffice-langpack-pt-PT.x86_64 akmod-nvidia.x86_64 xorg-x11-drv-nvidia-cuda.x86_64 obs-studio kicad arduino godot latte-dock.x86_64 neofetch-6.0.0-4.fc31.noarch thunderbird timeshift youtube-dl openssh -y


##########################################
###Instalação do Google-Chrome############
##########################################

cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF

sudo dnf install google-chrome-stable -y


##########################################
###Instalação do MegaSync#################
##########################################

sudo tee /etc/yum.repos.d/megasync.repo <<REPO
[MEGAsync]
name=MEGAsync
baseurl=http://mega.nz/linux/MEGAsync/Fedora_31/
gpgkey=https://mega.nz/linux/MEGAsync/Fedora_31/repodata/repomd.xml.key
gpgcheck=1
enabled=1
REPO

sudo dnf install megasync dolphin-megasync -y


##########################################
###Instalação do FlatPak e Programas######
##########################################

dnf install flatpak -y

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.spotify.Client -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub org.freecadweb.FreeCAD -y
flatpak install flathub com.visualstudio.code.oss -y
flatpak install flathub com.jetbrains.PyCharm-Community -y
flatpak install flathub org.audacityteam.Audacity -y


##########################################
###Baixar Programas especificos###########
##########################################

wget http://download.qt.io/official_releases/qt/5.13/5.13.2/qt-opensource-linux-x64-5.13.2.run

chmod +x qt-opensource-linux-x64-5.13.2.run

./qt-opensource-linux-x64-5.13.2.run


wget https://www.blender.org/download/Blender2.81/blender-2.81-linux-glibc217-x86_64.tar.bz2/

tar -jxvf blender-2.81-linux-glibc217-x86_64.tar.bz2


##########################################
###Fim da Instalação######################
##########################################

ECHO "Instalação efetuada com sussesso!"