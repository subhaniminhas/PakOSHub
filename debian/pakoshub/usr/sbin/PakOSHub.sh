#!/bin/bash
#
# subhaniminhas -- Revision: 2 May 2020 -- by subhaniminhas (https://sourceforge.net/projects/pakos/)
#
#
#
# ---------------------------------------
# Define Functions:
# ---------------------------------------
#

mainmenu () {

yad --form --width=381 --text="Choose Your Option:" \
--field="     Update PakOS!/usr/share/icons/PakOS_Icons/updated.png":fbtn "bash -c UpgradeandUpdate" \
--field=" Install Software!/usr/share/icons/PakOS_Icons/Install2.png":fbtn "bash -c InstallValueAddedSoftware" \
--field="         Security!/usr/share/icons/PakOS_Icons/Security.png":fbtn "bash -c SecurityOptions" \
--field="        Eye Candy!/usr/share/icons/PakOS_Icons/themes.png":fbtn "bash -c EyeCandy" \
--field="  Developer Tools!/usr/share/icons/PakOS_Icons/Builder.png":fbtn "bash -c AdvanceDeveloperTools" \
--field="      Dedications!/usr/share/icons/PakOS_Icons/dedications.png":fbtn "bash -c PakOSLinksVote" \
--field="  Enable Internet!/usr/share/icons/PakOS_Icons/Internet.png":fbtn "bash -c EnableInternetInPakistan" \
--button=gtk-cancel:1

}
########################## Security #############################
SecurityOptions ()
{
yad --form --width=381 --text="Choose Your Option:" \
--field="       Update Anti Virus!/usr/share/icons/PakOS_Icons/AntiVirus.png":fbtn "bash -c UpdateAntiVirus" \
--field=" Browser Security Addons!/usr/share/icons/PakOS_Icons/BrowserAddons.png":fbtn "bash -c BrowserSecurityAddons" \
--field="Manage Internet Firewall!/usr/share/icons/PakOS_Icons/Firewall.png":fbtn "bash -c ManageInternetFirewall" \
--field="Web Application Firewall!/usr/share/icons/PakOS_Icons/FireJail.png":fbtn "bash -c WebApplicationFirewall" \
--field="               USB Guard!/usr/share/icons/PakOS_Icons/USBGuard.png":fbtn "bash -c USBGuard" \
--field="       Encrypted Storage!/usr/share/icons/PakOS_Icons/ZuluCrypt.png":fbtn "bash -c EncryptedStorage" \
--field="    Lynis Security Audit!/usr/share/icons/PakOS_Icons/Lynis.png":fbtn "bash -c LynisSecurityAudit" \
--button=gtk-cancel:1
}
#----------------------------------------------------------------
UpdateAntiVirus ()
{
	#sudo freshclam
	pkexec freshclam
	echo "All Done!!"
	echo "Launching Anti Virus Now for AV Scans"
	clamtk %F
}
#----------------------------------------------------------------
ManageFirewall ()
{
	gufw
}
#----------------------------------------------------------------
BrowserSecurityAddons ()
{
yad --form --width=381 --columns=2  --text="Choose Your Option:" \
--field="           FaceBook Container!/usr/share/icons/PakOS_Icons/FacebookContainer.png":fbtn "bash -c FaceBookContainer" \
--field="DuckDuckGo Privacy Essentials!/usr/share/icons/PakOS_Icons/Duckduckgo.png":fbtn "bash -c DuckDuckGoPrivacyEssentials" \
--field="                uBlock Origin!/usr/share/icons/PakOS_Icons/uBlockOrigins.png":fbtn "bash -c uBlockOrigin" \
--field="      NoScript Security Suite!/usr/share/icons/PakOS_Icons/NoScript.png":fbtn "bash -c NoScriptSecuritySuite" \
--field="        Avast Online Security!/usr/share/icons/PakOS_Icons/Avast.png":fbtn "bash -c AvastOnlineSecurity" \
--field="               Privacy Badger!/usr/share/icons/PakOS_Icons/PrivacyBadger.png":fbtn "bash -c PrivacyBadger" \
--field="            Cookie AutoDelete!/usr/share/icons/PakOS_Icons/CookieAutoDelete.png":fbtn "bash -c CookieAutoDelete" \
--field="                    Disconnect!/usr/share/icons/PakOS_Icons/Disconnect.png":fbtn "bash -c Disconnect" \
--button=gtk-cancel:1
}
#-----------------------------------------------------------------------------
FaceBookContainer ()
{
xdg-open https://addons.mozilla.org/en-US/firefox/addon/facebook-container/ &
}
#-----------------------------------------------------------------------------
DuckDuckGoPrivacyEssentials ()
{
xdg-open https://addons.mozilla.org/en-US/firefox/addon/duckduckgo-for-firefox/ &
}
#-----------------------------------------------------------------------------
uBlockOrigin ()
{
xdg-open https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/ &
}
#-----------------------------------------------------------------------------
NoScriptSecuritySuite ()
{
xdg-open https://addons.mozilla.org/en-US/firefox/addon/noscript/ &
}
#-----------------------------------------------------------------------------
AvastOnlineSecurity ()
{
xdg-open https://addons.mozilla.org/en-US/firefox/addon/avast-online-security/ &
}
#-----------------------------------------------------------------------------
PrivacyBadger ()
{
xdg-open https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/ &
}
#-----------------------------------------------------------------------------
CookieAutoDelete ()
{
xdg-open https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete/ &
}
#-----------------------------------------------------------------------------
Disconnect ()
{
xdg-open https://addons.mozilla.org/en-US/firefox/addon/disconnect/?src=search &
}
#-----------------------------------------------------------------------------
LynisSecurityAudit()
{
sudo apt install lynis
#https://medium.com/@hariharan.u2018/how-i-got-10-hardening-points-with-lynis-my-experience-3075da6a923a
sudo apt install -y apt-listbugs
sudo apt install -y debsecan
sudo apt install -y fail2ban
sudo apt install -y debsums



sudo /usr/sbin/lynis audit system --no-colors
#./lynis -h
#./lynis show version
#./lynis audit system

cat /var/log/lynis.log
cat /var/log/lynis-report.dat
}
###################################################################################
ManageInternetFirewall ()
{
	gufw
}
#----------------------------------------------------------------
WebApplicationFirewall ()
{
	firetools
}
#----------------------------------------------------------------
USBGuard ()
{
 	usbguard-applet-qt
}
#----------------------------------------------------------------
EncryptedStorage ()
{
	/usr/bin/zuluCrypt-gui #-d %U
}
########################## Eye Candy #############################
EyeCandy ()
{
while true
do
ans=$(zenity --list --width 400 --height 250\
  	--title="Eye Candy" \
  	--column="Ser" --column="Please Select an Option"  \
		1  "Wallpapers"\
		2  "Icons Sets"\
		3  "Themes"\
		4  "Fonts"\
		5  "Exit");
case $ans in
 1) downloadWallpapers;;
 2) IconsSets;;
 3) Themes;;
 4) Fonts;;
 5) return 0;;
esac
done
}
#--------------------------IconsSets ----------------------------#https://itsfoss.com/best-icon-themes-ubuntu-16-04/
IconsSets2 ()
{
while true
do
ans=$(zenity --list --width 400 --height 650\
  	--title="Download Icon Themes" \
  	--column="Ser" --column="Please Select an Option"\
		1  "Windows 10 Icons theme"\
		2  "Pop icon theme"\
		3  "Papirus icon theme"\
		4  "Paper icon theme"\
		5  "Numix icon theme"\
		6  "Moka icon theme"\
		7  "Uniform icon theme"\
		8  "Dalisha icon theme"\
		9  "Xenlism Wildfire icon theme"\
		10  "Square 2.0 Icon pack"\
		11  "Vivacious Colors icon theme"\
		12  "La Capitane icon theme"\
		13  "Shadow icon theme"\
		14  "Compass icon theme"\
		15  "Evolvere icon theme"\
		17  "Obsidian icon theme"\
		18  "Masalla icon theme"\
		19  "Vibrancy Colors icon theme"\
		20  "Oranchelo icon theme"\
		21  "Exit");
case $ans in
 1) SetIconTheme "Windows10";;
 2) sudo add-apt-repository ppa:system76/pop && sudo apt update && sudo apt install -y pop-icon-theme;;
 3) sudo add-apt-repository ppa:papirus/papirus && sudo apt update && sudo apt install -y papirus-icon-theme;;
 4) sudo add-apt-repository ppa:snwh/pulp && sudo apt-get update && sudo apt install -y paper-icon-theme;;
 5) sudo apt-add-repository ppa:numix/ppa && sudo apt-get update && sudo apt install -y numix-icon-theme-circle;;
 6) sudo add-apt-repository ppa:moka/daily && sudo apt-get update && sudo apt install -y moka-icon-theme;;
 7) sudo add-apt-repository ppa:noobslab/icons2 && sudo apt-get update && sudo apt install -y uniform-icons;;
 8) sudo add-apt-repository ppa:noobslab/icons && sudo apt-get update && sudo apt install -y dalisha-icons;;
 9) sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 90127F5B && echo "deb http://downloads.sourceforge.net/project/xenlism-wildfire/repo deb/" | sudo tee -a /etc/apt/sources.list && sudo apt-get update && sudo apt install -y xenlism-wildfire-icon-theme;;
 10) sudo add-apt-repository ppa:noobslab/icons2 && sudo apt-get update && sudo apt install -y square-icons;;
 11) sudo add-apt-repository ppa:ravefinity-project/ppa && sudo apt-get update && sudo apt install -y vivacious-colors;;
 12) SetIconTheme "La_Capitane";;
 13) sudo add-apt-repository ppa:noobslab/icons && sudo apt-get update && sudo apt install -y shadow-icon-theme;;
 14) SetIconTheme "Compass";;
 15) SetIconTheme "Evolvereicontheme";;
 17) sudo add-apt-repository ppa:noobslab/icons && sudo apt-get update && sudo apt install -y obsidian-1-icons;;
 18) SetIconTheme "Masallaicontheme";;
 19) sudo add-apt-repository ppa:ravefinity-project/ppa && sudo apt update && sudo apt install -y vibrancy-colors;;
 20) sudo add-apt-repository ppa:oranchelo/oranchelo-icon-theme && sudo apt-get update && sudo apt install -y oranchelo-icon-theme;;
 21) return 0;;
esac
done
}
#--------------------------SetIconTheme----------------------------
IconsSets ()
{
while true
do
ans=$(zenity --list --width 400 --height 650\
  	--title="Download Icon Themes" \
  	--column="Ser" --column="Please Select an Option"\
		1  "Windows 10 Icons theme"\
		2  "Pop icon theme"\
		3  "Papirus icon theme"\
		4  "Korla icon theme"\  # https://www.addictivetips.com/ubuntu-linux-tips/how-to-set-up-the-korla-icon-theme-on-linux/
		21  "Exit");
case $ans in
 1) SetIconTheme "Windows10";;
 2) sudo add-apt-repository ppa:system76/pop && sudo apt update && sudo apt install pop-icon-theme;;
 3) wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | sh;;
 4) wget https://github.com/bikass/korla/archive/master.zip -O korla.zip && unzip korla.zip && sudo mv ~/korla-master/korla* ~/.icons;;
 21) return 0;;
esac
done
}
#--------------------------Themes----------------------------
Themes ()
{
ls -l


}
#-------------------------- Fonts ----------------------------
Fonts ()
{
ls -l


}
#--------------------------Download Wallpapers from Unsplash ----------------------------
downloadWallpapers()
{
while true
do
ans=$(zenity --list --width 400 --height 650\
  	--title="Download Wallpapers" \
  	--column="Ser" --column="Please Select an Option"  \
		1  "Pakistan"\
		2  "Featured"\
		3  "Wallpapers"\
		4  "Textures & Patterns"\
		5  "Nature"\
		6  "Current Events"\
		7  "Architecture"\
		8  "Business and Work"\
		9  "Film: Analog photography"\
		10  "Animals"\
		11  "Travel"\
		12  "Fashion"\
		13  "Food & Drink"\
		14  "Spirituality"\
		15  "Experimental"\
		17  "Health"\
		18  "Arts & Culture"\
		19  "Random"\
		20  "Exit");
case $ans in
 1) BatchDownloadfromUnsplash "Pakistan";;
 2) BatchDownloadfromUnsplash "Featured";;
 3) BatchDownloadfromUnsplash "wallpapers";;
 4) BatchDownloadfromUnsplash "textures-patterns";;
 5) BatchDownloadfromUnsplash "nature";;
 6) BatchDownloadfromUnsplash "current-events";;
 7) BatchDownloadfromUnsplash "architecture";;
 8) BatchDownloadfromUnsplash "business-work";;
 9) BatchDownloadfromUnsplash "film";;
 10) BatchDownloadfromUnsplash "animals";;
 11) BatchDownloadfromUnsplash "travel";;
 12) BatchDownloadfromUnsplash "fashion";;
 13) BatchDownloadfromUnsplash "food-drink";;
 14) BatchDownloadfromUnsplash "spirituality";;
 15) BatchDownloadfromUnsplash "Experimental";;
 17) BatchDownloadfromUnsplash "health";;
 18) BatchDownloadfromUnsplash "arts-culture";;
 19) BatchDownloadfromUnsplash "Random";;
 20) return 0;;
esac
done
}
#-----------downloadfromUnsplash----------------------------------------------
downloadfromUnsplashSingle()
{
wget -q -O unsplash_wallpaper.jpg https://unsplash.it/1920/1080/?$1
#wget -O wallpaper.jpg https://unsplash.it/2560/1440/?random
#wget -q -O unsplash_wallpaper.jpg https://unsplash.it/1920/1080/?random

#wget -O /tmp/wallpaper.jpg https://unsplash.it/2560/1440/?random
#gsettings set org.gnome.desktop.background picture-uri file:///tmp/wallpaper.jpg
}
#-----------downloadfromUnsplash----------------------------------------------
BatchDownloadfromUnsplash()
{
mkdir -p imgs
Height=1440
Width=2560
Catagory=$1
Size=$(zenity  --list  --text "Select Image Size" --radiolist  --column "Pick" --column "Size" TRUE "1600x900" FALSE "1920x1080" FALSE "2560x1440" FALSE "3840x2160"); echo $Size

ENDlength=$(zenity  --list  --text "Select No of Images to Download" --radiolist  --column "Pick" --column "No" TRUE "10" FALSE "20" FALSE "30" FALSE "40"); echo $ENDlength

END=$ENDlength
(for ((i=1;i<=END;i++));
do
echo -e "#Downloading $i out of $END"
echo "$(( (i * 100) / END ))"
sudo wget -q -O "/usr/share/backgrounds/${Catagory}-${i}.jpg" https://source.unsplash.com/$Size/?$Catagory$i #Last $i is ensuring each image is random
done) | zenity --progress \
     --title="Downloading from Unsplash" \
     --percentage=0
}
#----------------------batchDownloadUnsplash----------------------------------
############################ Remaster PakOS ##############################################
RemasterPakOS(){
while true
do
ans=$(zenity --list --width 400 --height 500\
  	--title="Linux Live Build Tools"\
  	--column="Ser" --column="Please Select an Option"\
		1  "Buil a Min Base Linux Live ISO from Scratch"\
		2  "Remaster Min Base Linux Live ISO"\
		3  "Build PakOS from Scratch"\
		4  "Remaster PakOS"\
		5 "Exit");
case $ans in
 1) buildMinBaseISO;;
 2) remasterMinBaseISO;;
 3) buildPakOSfromScratch;;
 4) remasterPakOSISO;;
 5) return 0;;
esac
done
}
#------------------------- Build Min ISo as per Will halay Tutorial--------------------
buildMinBaseISO(){
sudo apt-get install debootstrap squashfs-tools xorriso grub-pc-bin grub-efi-amd64-bin mtools
sudo debootstrap --arch=i386 --variant=minbase buster $HOME/LIVE_BOOT/chroot http://ftp.us.debian.org/debian/
sudo chroot $HOME/LIVE_BOOT/chroot
echo "debian-live" > /etc/hostname
#apt-cache search linux-image
sudo apt-get update && apt-get install --no-install-recommends linux-image-686 live-boot systemd-sysv
sudo apt-get install --no-install-recommends \
    network-manager net-tools wireless-tools wpagui \
    curl openssh-client \
    icewm xserver-xorg-core xserver-xorg xinit xterm \
    nano && apt-get clean

passwd root
exit
sudo mkdir -p $HOME/LIVE_BOOT/{scratch,image/live}
sudo mksquashfs \
    $HOME/LIVE_BOOT/chroot \
    $HOME/LIVE_BOOT/image/live/filesystem.squashfs \
    -e boot


sudo cp $HOME/LIVE_BOOT/chroot/boot/vmlinuz-* \
    $HOME/LIVE_BOOT/image/vmlinuz && \
sudo cp $HOME/LIVE_BOOT/chroot/boot/initrd.img-* \
    $HOME/LIVE_BOOT/image/initrd

sudo cat <<'EOF' >$HOME/LIVE_BOOT/scratch/grub.cfg
search --set=root --file /DEBIAN_CUSTOM
insmod all_video
set default="0"
set timeout=30
menuentry "Debian Live" {
    linux /vmlinuz boot=live quiet nomodeset
    initrd /initrd
}
EOF

touch $HOME/LIVE_BOOT/image/DEBIAN_CUSTOM

grub-mkstandalone \
    --format=x86_64-efi \
    --output=$HOME/LIVE_BOOT/scratch/bootx64.efi \
    --locales="" \
    --fonts="" \
    "boot/grub/grub.cfg=$HOME/LIVE_BOOT/scratch/grub.cfg"

(cd $HOME/LIVE_BOOT/scratch && \
    dd if=/dev/zero of=efiboot.img bs=1M count=10 && \
    mkfs.vfat efiboot.img && \
    mmd -i efiboot.img efi efi/boot && \
    mcopy -i efiboot.img ./bootx64.efi ::efi/boot/
)

grub-mkstandalone \
    --format=i386-pc \
    --output=$HOME/LIVE_BOOT/scratch/core.img \
    --install-modules="linux normal iso9660 biosdisk memdisk search tar ls" \
    --modules="linux normal iso9660 biosdisk search" \
    --locales="" \
    --fonts="" \
    "boot/grub/grub.cfg=$HOME/LIVE_BOOT/scratch/grub.cfg"

cat \
    /usr/lib/grub/i386-pc/cdboot.img \
    $HOME/LIVE_BOOT/scratch/core.img \
> $HOME/LIVE_BOOT/scratch/bios.img

xorriso \
    -as mkisofs \
    -iso-level 3 \
    -full-iso9660-filenames \
    -volid "DEBIAN_CUSTOM" \
    -eltorito-boot \
        boot/grub/bios.img \
        -no-emul-boot \
        -boot-load-size 4 \
        -boot-info-table \
        --eltorito-catalog boot/grub/boot.cat \
    --grub2-boot-info \
    --grub2-mbr /usr/lib/grub/i386-pc/boot_hybrid.img \
    -eltorito-alt-boot \
        -e EFI/efiboot.img \
        -no-emul-boot \
    -append_partition 2 0xef ${HOME}/LIVE_BOOT/scratch/efiboot.img \
    -output "${HOME}/LIVE_BOOT/debian-custom.iso" \
    -graft-points \
        "${HOME}/LIVE_BOOT/image" \
        /boot/grub/bios.img=$HOME/LIVE_BOOT/scratch/bios.img \
        /EFI/efiboot.img=$HOME/LIVE_BOOT/scratch/efiboot.img
}
#------------------------- Remaster Min ISo as per Will halay Tutorial--------------------
remasterMinBaseISO(){
#I needed to find a way to use my created iso files as a starting point to further tinker the live cd. Many a times, i break the created iso in some way. So instead of going through all the steps, i needed to extract the created iso to chroot folder and start of again from a certain check point. I achieved this by running following commands:
#first delete the chroot folder then create 3 folders
#While already inside ~/LIVE_BOOT folder , i do these

mkdir extract-cd mnt chroot
sudo mount -o loop ~/LIVE_BOOT/debian-custom.iso mnt
sudo rsync --exclude=/live/filesystem.squashfs -a mnt/ extract-cd
sudo unsquashfs mnt/live/filesystem.squashfs
sudo mv squashfs-root/* chroot

#ptionally delete the extract-cd mnt folders, and also delete LIVE_BOOT/image/live/filesystem.squashfs beore rebuilding filesystem.squashfs

#source: https://www.915tx.com/remaster
}
#------------------------- Remaster Min ISo as per Will halay Tutorial--------------------
buildPakOSfromScratch(){
#!/bin/sh
#1st and foremost
# sudo apt-get install live-build
# bldPakOS -- Revision: 100b3 -- by gSm (https://sourceforge.net/projects/pakos/)
# (GNU/General Public License version 3.0)
#
# Step by Step Live-Build
#
#
# ~/PakOS10 -- build folder
# ~/prepPakOSPro10  -- files location
#
#
# Phase 1: - Assign gSm variable the output of pwd
#
WKDIR="$(pwd)"
#
#
# Phase 2: - Create the build staging folder
#
rm -r PakOS10
mkdir PakOS10
#
cd PakOS10
#
#
# Phase 3: - Set up build environment
#
lb config --binary-images iso-hybrid --mode debian --architectures i386 --linux-flavours 686 --distribution buster --archive-areas "main contrib non-free" --updates true --security true --cache true --apt-recommends true --debian-installer live --debian-installer-distribution live --debian-installer-gui true --uefi-secure-boot auto --win32-loader true --iso-application PakOS --iso-preparer gSm-https://sourceforge.net/projects/pakos/ --iso-publisher gSm-https://sourceforge.net/projects/pakos/ --iso-volume PakOS
#
#
# Phase 4: - Install desktop and applications
#
echo task-lxqt-desktop > $WKDIR/PakOS10/config/package-lists/desktop.list.chroot
#
#
echo evince task-print-server foomatic-db system-config-printer system-config-printer-common system-config-printer-udev printer-driver-gutenprint printer-driver-hpcups printer-driver-postscript-hp cups cups-client cups-ppdc cups-server-common cups-browsed cups-core-drivers cups-filters-core-drivers cups-pk-helper bsdmainutils avahi-daemon ghostscript thunderbird gimp haveged less gdebi psensor synaptic gparted bleachbit flac faad faac mjpegtools x265 x264 mpg321 ffmpeg streamripper sox mencoder dvdauthor pulseaudio pavucontrol vlc mpv hplip-gui ntfs-3g cdtool mtools gthumb testdisk xorriso p7zip-full p7zip-rar keepassx hardinfo inxi gnome-disk-utility network-manager-gnome simple-scan remmina gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-plugins-good gnome-system-tools dos2unix dialog liferea transmission-gtk python-glade2 rar unrar ssh cifs-utils fuse gvfs-fuse gvfs-backends gvfs-bin pciutils squashfs-tools syslinux syslinux-common dosfstools isolinux live-build fakeroot linux-headers-686 lsb-release menu build-essential dkms curl wget apt-transport-https dirmngr openvpn network-manager-openvpn openvpn-systemd-resolved libqt5opengl5 zulumount-gui zulucrypt-gui zulupolkit calamares calamares-settings-debian genisoimage resolvconf syslinux-utils debconf locales redshift redshift-gtk geoclue-2.0 xscreensaver xscreensaver-gl-extra xscreensaver-data-extra xscreensaver-screensaver-bsod fonts-nafees fbreader ufw gufw gnome-software clamav clamav-daemon clamtk usbguard usbguard-applet-qt firejail firetools gedit nano clamav clamav-daemon clamtk rcconf aptitude arch-test apt-utils multiarch-support snapd libappindicator1 wireless-tools gnupg2 chkservice debian-installer-launcher yad zenity> $WKDIR/PakOS10/config/package-lists/packages.list.chroot
# Phase 5: - Make folders in the chroot
#
mkdir -p $WKDIR/PakOS10/config/includes.chroot/usr/share/PakOS10
#mkdir -p $WKDIR/PakOS10/config/includes.chroot/etc/skel/.config
mkdir -p $WKDIR/PakOS10/config/includes.chroot/usr/share/images/desktop-base
mkdir -p $WKDIR/PakOS10/config/includes.chroot/usr/share/icons/default
mkdir -p $WKDIR/PakOS10/config/includes.chroot/usr/local/bin
mkdir -p $WKDIR/PakOS10/config/hooks/normal
mkdir -p $WKDIR/PakOS10/config/includes.chroot/usr/share/doc/PakOS10
mkdir -p $WKDIR/PakOS10/config/includes.chroot/etc/calamares/branding
mkdir -p $WKDIR/PakOS10/config/includes.chroot/usr/share/applications
mkdir -p $WKDIR/PakOS10/config/includes.chroot/etc/skel/Desktop
#
#
# Phase 6: - Copy files into the chroot
#
#cp -r $WKDIR/prepPakOSPro10 $WKDIR/PakOS10/config/includes.chroot/usr/share/PakOS10/prepPakOSPro10
cp -r $WKDIR/prepPakOSPro10/bootloaders $WKDIR/PakOS10/config/bootloaders
#cp -r $WKDIR/prepPakOSPro10/xfce4 $WKDIR/PakOS10/config/includes.chroot/etc/skel/.config/xfce4
cp -r $WKDIR/prepPakOSPro10/calamares/branding/PakOS $WKDIR/PakOS10/config/includes.chroot/etc/calamares/branding/PakOS
cp $WKDIR/prepPakOSPro10/hooks/* $WKDIR/PakOS10/config/hooks/normal/
cp $WKDIR/prepPakOSPro10/misc64/* $WKDIR/PakOS10/config/packages.chroot/
cp $WKDIR/prepPakOSPro10/scripts/* $WKDIR/PakOS10/config/includes.chroot/usr/local/bin/
cp $WKDIR/prepPakOSPro10/doc/* $WKDIR/PakOS10/config/includes.chroot/usr/share/doc/PakOS10/
cp $WKDIR/prepPakOSPro10/backgrounds/* $WKDIR/PakOS10/config/includes.chroot/usr/share/images/desktop-base/
cp $WKDIR/prepPakOSPro10/icons/* $WKDIR/PakOS10/config/includes.chroot/usr/share/icons/default/
cp $WKDIR/prepPakOSPro10/calamares/settings.conf $WKDIR/PakOS10/config/includes.chroot/etc/calamares/settings.conf
cp $WKDIR/prepPakOSPro10/calamares/usr/share/applications/install-debian.desktop $WKDIR/PakOS10/config/includes.chroot/usr/share/applications/install-debian.desktop
#ln -s /usr/share/doc/PakOS10 $WKDIR/PakOS10/config/includes.chroot/etc/skel/Desktop/
#
#
# Phase 7: - Start the build process
#
lb build
}

#CDIMAGENAME='PakOS2019-03-18_23:10.iso'
IMAGE_NAME='PakOS'
#################################################################

#################################################################
openISO () {
FILE=`zenity --file-selection --width 381 --file-filter='ISO Image (iso) | *.iso' --title="Select an ISO Image"`
DIRECTORY=$(dirname "${FILE}")
zenity --info --width 381 --title="Selected File is" --text=$FILE
zenity --info --width 381 --title="Selected Directory is" --text=$DIRECTORY
cd $DIRECTORY
ls -l
BuildDir=""
BuildDir=$(zenity --entry --title="Name of Build Directory" --text="Pl Enter Build Directory Name:")
# replace first blank only
# replace all blanks
BuildDir=${BuildDir// /""} #remove spaces in suggested Dir names, as it causes errors in drectory building
zenity --info --title="Name of Build Directory" --text="Your input was: $BuildDir"
#zenity --info --width 530 --title="Create New Dir" --text="Creating New Build Directory Now"
sudo mkdir $DIRECTORY/$BuildDir
zenity --info --width 381 --title="Build Directory is " --text=$DIRECTORY/$BuildDir
ls -l
sleep 5

echo "Copying $FILE to working directory..."
ls -l
sleep 5

sudo cp $FILE $DIRECTORY/$BuildDir/
sleep 5
cd $DIRECTORY/$BuildDir
ls -l
sleep 5

sudo mkdir mnt extract-cd
echo "Mounting the .iso as 'mnt' in the local directory"
sudo mount -o loop $FILE $DIRECTORY/$BuildDir/mnt
sleep 5
echo "Extract the .iso contents into dir 'extract-cd'"

sudo rsync --exclude=$DIRECTORY/$BuildDir/extract-cd/live/filesystem.squashfs -a $DIRECTORY/$BuildDir/mnt/ extract-cd
sleep 5
echo "#Extract the isohybrid MBR 'isohdpfx.bin' from the source ISO image using dd"
sudo dd if=$FILE bs=512 count=1 of=$DIRECTORY/$BuildDir/extract-cd/isolinux/isohdpfx.bin
sleep 5
echo "Extract the Desktop system "
sudo unsquashfs $DIRECTORY/$BuildDir/mnt/live/filesystem.squashfs
#basically rename the squashfs-root directory to edit directory . edit folder will be made on gthe fly
sudo mv squashfs-root edit
#sudo rsync -avP -e squashfs-root $DIRECTORY/$BuildDir/edit
sleep 5
echo "We are finished with the source .iso image. Unmount it."
sudo umount $DIRECTORY/$BuildDir/mnt
}
#################################################################
enterChroot () {

BuildDir=$(zenity  --file-selection --title="Choose Build Directory Location" --directory)
zenity --info --width 381 --title="Selected Directory is" --text=$BuildDir
clear
#WKDIR="$(pwd)"
echo " "
echo "Prepare and chroot"
echo "Entering the $BuildDir directory..."
sleep 5
#cd ~/.  #In debian proper, it takes to the Root Home Folder, so skipping this step now
cd $BuildDir #(if you're not in there already)
ls $BuildDir
pwd
echo "Copy Resolve.conf ..."
#sleep 10
sudo cp /etc/resolv.conf edit/etc/
sudo mount --bind /dev/ edit/dev

# Learned this inline scripting from https://askubuntu.com/questions/551195/scripting-chroot-how-to
echo "Entering the chroot..."
sleep 5
cat << EOF | sudo chroot edit
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devpts none /dev/pts

echo "To avoid locale issues and in order to import GPG keys..."
sleep 5
export HOME=/root
export LC_ALL=C
dbus-uuidgen > /var/lib/dbus/machine-id
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl

#Customizations

# Add Google Chrome's stable repository to apt (hey, I like Chrome)
#echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list
#wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

echo "Update and Upgrade (distributions)"
sleep 5
apt-get update
sudo plymouth-set-default-theme -R PakOS
#apt-get purge thunderbird -y
apt-get dist-upgrade -y
EOF

echo "---------------starting the interactive bash shell-----------------"
sleep 5
sudo chroot edit sh -c "ls; bash"
#==========exit should get us out of it-----------------------------
#apt-get install google-chrome-stable yubikey-luks -y

cat << EOF | sudo chroot edit
echo "---------------removing and cleaning the apt packages-----------------"
sleep 5
apt --fix-broken install
apt-get autoremove -y
apt-get autoclean -y

echo " More Clean up"
sleep 5
rm -rf /tmp/* ~/.bash_history
rm /var/lib/dbus/machine-id
rm /sbin/initctl
dpkg-divert --rename --remove /sbin/initctl

echo "now umount (unmount) special filesystems and exit chroot"
sleep 5
umount /proc || umount -lf /proc
umount /sys
umount /dev/pts
EOF

echo "now umount  edit/dev"
sleep 5
sudo umount edit/dev

echo "Press any key to continue..."
sleep 5
}
##############################################################
InstallSoftwaresinChroot()
{
while true
do
ans=$(zenity --list --width 400 --height 381\
  	--title="Install Base Software In Chroot" \
  	--column="Ser" --column="Please Select an Option"  \
		1  "Install Desktop Environment"\
		2  "Install Full Printig Suite"\
		3  "Install Hardware Drivers (Wireless/Sound/Audio)"\
		4  "Install Security Suite"\
		5  "Smartphone"\
		6  "Services Management"\
		7  "Ports Management"\
		8  "Build PakOS"\
		9  "Eye Candy"\
		10  "PakOS Dedication/Links/Vote"\
		11 "Exit");
case $ans in
 1) sudo apt install task-lxqt-desktop;;
 2) sudo apt-get install --no-install-recommends task-print-server foomatic-db system-config-printer system-config-printer-common system-config-printer-udev printer-driver-gutenprint printer-driver-hpcups printer-driver-postscript-hp cups cups-client cups-ppdc cups-server-common cups-browsed cups-core-drivers cups-filters-core-drivers cups-pk-helper hplip-gui;;
 3) sudo apt-get install --no-install-recommends wicd wicd-curses wavemon inxi net-tools curl wget pavucontrol pulseaudio pulseaudio-utils network-manager-gnome neofetch wireless-tools flac faad faac mjpegtools x265 x264 mpg321 ffmpeg streamripper sox mencoder dvdauthor twolame lame firmware-linux firmware-linux-nonfree firmware-misc-nonfree firmware-realtek firmware-atheros firmware-bnx2 firmware-bnx2x firmware-brcm80211 firmware-ipw2x00 firmware-intelwimax firmware-iwlwifi firmware-libertas firmware-netxen firmware-zd1211;;
 4) sudo apt-get install --no-install-recommends bleachbit keepassx zulumount-gui zulucrypt-gui zulupolkit  ufw gufw  usbguard usbguard-applet-qt firejail firetools clamav clamav-daemon clamtk ;;
 5) Smartphone;;
 6) ServicesManagement;;
 7) PortsManagement;;
 8) RemasterPakOS;;
 9) EyeCandy;;
 10) PakOSLinksVote;;
 11) exit;;
esac
done
}
#################################################################
buildISO () {
BuildDir=$(zenity  --file-selection --title="Choose Build Directory Location" --directory)
zenity --info --width 381 --title="Selected Directory is" --text=$BuildDir
#WKDIR="$(pwd)"
#echo "Regenerate the manifest"
echo "Entering the $BuildDir directory..."
sleep 5
ls -l
#cd ~/. #In debian proper, it takes to the Root Home Folder, so skipping this step now
#cd custom-img #(if you're not in there already)
#pwd
#Regenerate the manifest
#sudo chmod +w extract-cd/live/filesystem.manifest
#sudo chroot edit dpkg-query -W --showformat='${Package} ${Version}\n' | sudo tee extract-cd/live/filesystem.manifest
#sudo cp extract-cd/live/filesystem.manifest extract-cd/live/filesystem.manifest-desktop
#sudo sed -i '/ubiquity/d' extract-cd/live/filesystem.manifest-desktop
#sudo sed -i '/casper/d' extract-cd/live/filesystem.manifest-desktop

#Compress the filesystem
# Delete any existing squashfs - normally nothing to delete/rm.
sudo rm $BuildDir/extract-cd/live/filesystem.squashfs
	zenity --question --title="Create Compressed Image" --width=450 --text="Use Standard /Fast Compression or Max/ Slow Compression.\n\nClick Yes for Standared or No for Max Compression."
	if [ "$?" -eq "0" ];then
		sudo mksquashfs $BuildDir/edit $BuildDir/extract-cd/live/filesystem.squashfs -b 1048576
    else
    	#    mksquashfs [source folder] [SquashFS target file] -b 1048576 -comp xz -Xdict-size 100%
    	sudo mksquashfs $BuildDir/edit $BuildDir/extract-cd/live/filesystem.squashfs  -b 1048576 -comp xz -Xdict-size 100%
	fi

# mksquashfs compresses using gzip (deflate) as default, but if the compression time doesn’t matter as much as final size, you should use the xz (LZMA2) option of more recent SquashFS version. The command above activates xz (-comp xz) using the highest possible compression options and the highest possible blocksize (1 MiB instead of the default 128 kiB). Therefore the process of creating the SquashFS file is slower than if using default options, but the resulting file is much smaller and might be (depending on disk IO time etc) a bit faster. LZMA2 is a highly asymmetric compression algorithm, so decompression is much faster and uses less memory than compression

echo "Update the filesystem.size file, which is needed by the installer"
sleep 5
printf $(sudo du -sx --block-size=1 $BuildDir/edit | cut -f1) | sudo tee $BuildDir/extract-cd/live/filesystem.size

echo "Remove old md5sum.txt and calculate new md5 sums"
sleep 5
cd $BuildDir/extract-cd
sudo rm md5sum.txt
find -type f -print0 | sudo xargs -0 md5sum | grep -v isolinux/boot.cat | sudo tee md5sum.txt

echo "Create the ISO image"
sleep 5
#manpage for genisoimage http://manpages.ubuntu.com/manpages/trusty/man1/genisoimage.1.html
#original
#sudo genisoimage -D -r -V "$IMAGE_NAME" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../$IMAGE_NAME.iso .

#from EFI Q&A: https://askubuntu.com/questions/457528/how-do-i-create-an-efi-bootable-iso-of-a-customized-version-of-ubuntu
#sudo mkisofs -U -A "Custom1604" -V "Custom1604" -volset "Custom1604" -J -joliet-long -r -v -T -o ../Custom1604.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot .

# From https://linuxconfig.org/legacy-bios-uefi-and-secureboot-ready-ubuntu-live-image-customization
# THIS WORKS for creating a .iso that can boot a PC from USB after dd to the USB drive, and as a file referenced as the boot image for a VM (e.g. VirtualBox)
sudo xorriso -as mkisofs -isohybrid-mbr isolinux/isohdpfx.bin -c isolinux/boot.cat -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot -isohybrid-gpt-basdat -o ../$IMAGE_NAME.iso .

cd ..

sudo chmod 777 $IMAGE_NAME.iso

sudo mv $IMAGE_NAME.iso "PakOS$(date +%F_%R).iso"

}
##################################################################

##################################################################
uploadOnSourceForge () {
clear
echo " "
#CDIMAGENAME = $ANS
while true
do
echo "-------------------"
echo " PakOS ISO Uploader:"
echo "-------------------"
echo
echo " (a) Upload Small test file on Main Page in Source Forge"
echo " (b) Upload Main ISO on Main Page in Source Forge"
echo " (c) Upload Small test file on Hidden Page in Source Forge"
echo " (d) Upload Main ISO on Hidden Page in Source Forge"
echo " (x) Exit "
echo
read -p "Please Enter Choice:  " ANS3
   	case $ANS3 in
	  a|A) UploadTestFileMainPage;;
	  b|B) UploadISOonMainPage;;
	  c|C) UploadTestFileonHiddenPage;;
	  d|D) UploadISOonHiddenPage;;
	  x|X) return 0;;
	  *) echo "invalid answer, please try again";;
	esac
done
}
##################################################################
UploadTestFileMainPage () {
echo "1st creating an Empty File"
ls -l > test.txt
sleep 5
echo "Now Uploading on Source Forge Main Files Section"
rsync -avP -e ssh test.txt subhaniminhas@frs.sourceforge.net:/home/frs/project/pakos/Main/
echo "Please visit https://sourceforge.net/projects/pakos/files/ and refresh page to see if test.txt has been uploaded"
sleep 10
}
##################################################################
UploadISOonMainPage () {
read -p "Please Enter ISO name for editing, be exact and press Enter, Ensure File Name does not have : Symbol e.g Time Stamp 21:17, Replace with _ or - : " ANS4
sleep 5
echo "Copying $ANS4 to Source Forge Main Files Section..."
sleep 5
echo "Now Uploading on Source Forge Main Files Section.. This WILL Take Many Hours at 100 Kbps"
rsync -avP -e ssh $ANS4 subhaniminhas@frs.sourceforge.net:/home/frs/project/pakos/Main/
echo "Please visit https://sourceforge.net/projects/pakos/files/ and refresh page to see if $ANS4 has been uploaded"
sleep 10
}
##################################################################
UploadTestFileonHiddenPage () {
echo "1st creating an Empty File"
ls -l > test.txt
sleep 5
echo "Now Uploading on Source Forge Hidden Files Section"
rsync -avP -e ssh test.txt subhaniminhas@web.sourceforge.net:/home/project-web/pakos/htdocs/
echo "please login at sftp subhaniminhas,pakos@web.sourceforge.net , give site password, once logged into cd to htdocs folder and see if test.txt file is present there, then use get test.txt command to download the test file"
sleep 10
sftp subhaniminhas,pakos@web.sourceforge.net
}
##################################################################
UploadISOonHiddenPage () {
read -p "Please Enter ISO name for editing, be exact and press Enter, Ensure File Name does not have : Symbol e.g Time Stamp 21:17, Replace with _ or - : " ANS5
sleep 5
echo "Copying $ANS5 to Source Forge Hidden Files Section..."
sleep 5
echo "Now Uploading on Source Forge hidden htdocs Files Section.. This WILL Take Many Hours at 100 Kbps"
rsync -avP -e ssh $ANS5 subhaniminhas@web.sourceforge.net:/home/project-web/pakos/htdocs/
echo "please login at sftp subhaniminhas,pakos@web.sourceforge.net , give site password, once logged into cd to htdocs folder and see if iso file is present there, then use get $ANS4 command to download the iso file"
sleep 10
sftp subhaniminhas,pakos@web.sourceforge.net
}
##------------------------------------------------------------
remasterPakOSISO () {
while true
do
ans=$(zenity --list --width 400 --height 450\
  	--title="PakOS Hub" \
  	--column="Ser" --column="Please Select an Option"  \
				1  "Open an ISO"\
				2  "Resume / Continue Your Project"\
				3  "Build ISO"\
				4  "Write ISO on USB"\
				5  "Upload ISO on SourceForge"\
				6  "Exit");
case $ans in
  1) openISO;;
  2) enterChroot;;
  3) buildISO;;  #  On-line Upgrade to 64 Bit Architecture (Std Kernal) "
  4) WritePakOSISOonUSB;;
  5) uploadOnSourceForge;;
  6) exit;;
esac
done
}
################### V a l u e  A d d e d  S o f t w a r e ##################
#-----------------------Steam ----------------------
InstallSteam(){
#https://wiki.debian.org/Steam
#https://linuxconfig.org/how-to-install-steam-with-steam-play-on-debian-10-buster
#https://www.wikihow.com/Install-Steam-on-Linux



echo This action will auto add non free respository in the sources.list
echo deb http://deb.debian.org/debian/ buster main contrib non-free
sudo apt-add-repository non-free
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y steam
echo "All Done!!"
#sudo apt install nvidia-driver nvidia-driver-libs-i386 nvidia-vulkan-icd nvidia-vulkan-icd:i386
}
#-----------------------Google Chrome ----------------------
InstallChromeBrowser()
{
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
echo "All Done!!"
#sudo apt remove google-chome-stable
}
#-----------------------TOR----------------------
InstallTORBrowser()
{

xdg-open https://www.torproject.org/download/ &
#sudo printf "deb http://deb.debian.org/debian buster-backports main contrib" > /etc/apt/sources.list.d/buster-backports.list
#sudo apt update
#sudo apt install torbrowser-launcher -t buster-backports


}
#-----------------------Cross Over----------------------
InstallCrossoverLinux()
{
wget http://crossover.codeweavers.com/redirect/crossover.bin
sudo chmod 755 crossover.bin
sudo dpkg --add-architecture i386 ; sudo apt-get update

./crossover.bin
}
#-----------------------Wine and Play on Linux----------------------
InstallWineandPlayonLinux()
{
sudo dpkg --add-architecture i386
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt-add-repository https://dl.winehq.org/wine-builds/debian/
sudo apt update
sudo apt install -y --install-recommends winehq-stable
echo "All Done!!"
export PATH=$PATH:/opt/wine-stable/bin
wine --version
#------Play on Linux

sudo apt-add-repository contrib
sudo apt update
sudo apt install -y wine wine64 wine32 winbind winetricks
sudo apt install -y playonlinux
echo "All Done!!"
playonlinux --version
#https://linuxhint.com/install_playonlinux_debian_10/



#

}
#-----------------------WPS Office 10----------------------
#InstallWPSOffice10()
#{
#http://linux.wps.com/#
#http://wps-community.org/downloads
#wget http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9662/wps-office_11.1.0.9662.XA_amd64.deb
#wget http://kdl.cc.ksosoft.com/wps-community/download/8392/wps-office_11.1.0.8392_i386.deb
#http://kdl.cc.ksosoft.com/wps-community/download/8392/wps-office_11.1.0.8392_amd64.deb
#http://kdl.cc.ksosoft.com/wps-community/download/8722/wps-office_11.1.0.8722_amd64.deb
#sudo apt install ./wps-office_11.1.0.9662.XA_amd64.deb
#echo "All Done!!"
#}
InstallWPSOffice2019()
{
wget http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9662/wps-office_11.1.0.9662.XA_amd64.deb
sudo apt install ./wps-office_11.1.0.9662.XA_amd64.deb
#wget http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9126/wps-office_11.1.0.9126.XA_amd64.deb
#sudo apt install -y ./wps-office_11.1.0.9126.XA_amd64.deb
echo "All Done!!!"
}
#-----------------------WPS Office 11----------------------
InstallWPSOffice11()
{
#wget http://kdl.cc.ksosoft.com/wps-community/download/8865/wps-office_11.1.0.8865_amd64.deb
#sudo apt install ./wps-office_11.1.0.8865_amd64.deb
wget http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9662/wps-office_11.1.0.9662.XA_amd64.deb
sudo apt install ./wps-office_11.1.0.9662.XA_amd64.deb
echo "All Done!!"
}
#-----------------------Virtual Box----------------------
InstallVirtualBox()
{
#https://computingforgeeks.com/install-virtualbox-ubuntu-debian/
#https://www.virtualbox.org/wiki/Downloads
sudo apt update && sudo apt -y upgrade
sudo apt -y install wget
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt update
sudo apt install -y linux-headers-$(uname -r) dkms
sudo apt install -y virtualbox-6.1
echo "All Done!!"
cd ~/
wget https://download.virtualbox.org/virtualbox/6.0.0/Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack
echo "All Done!!"

}
#-----------------------Google Earth----------------------
InstallGoogleEarth()
{
#wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
wget http://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb
sudo apt install ./google-earth-pro-stable_current_amd64.deb
echo "All Done!!"
}
#-----------------------RAMBox or Franz----------------------
InstallRamBox()
{
sudo apt -y install libappindicator1
#sudo apt update
#sudo apt install snapd
#sudo snap install ramboxpro
#https://github.com/ramboxapp/community-edition/releases/tag/0.6.9
#wget https://github.com/ramboxapp/community-edition/releases/download/0.6.9/Rambox-0.6.9-linux-i386.deb
wget https://github.com/ramboxapp/community-edition/releases/download/0.7.3/Rambox-0.7.3-linux-i386.deb
#wget https://github.com/ramboxapp/community-edition/releases/download/0.6.9/Rambox-0.6.9-linux-amd64.deb
sudo apt install ./Rambox-0.7.3-linux-i386.deb
echo "All Done!!"
}
#-----------------------AppOutlet Store----------------------
InstallKDEDiscoverStore()
{

sudo apt -y install plasma-discover
#sudo snap install app-outlet
#https://github.com/app-outlet/app-outlet
#sudo wget https://appoutlet.herokuapp.com/download/deb/app_outlet_1.2.1_amd64.deb
#sudo apt install ./app_outlet_1.2.1_amd64.deb
}
#-----------------------Ubuntu Snap Store----------------------
InstallUbuntuSnapStore()
 {
 sudo apt update
 sudo apt install snapd
 sudo snap install core
 sudo snap install snap-store
 echo "All Done!!"
 sudo snap list
 sudo ln -s /var/lib/snapd/desktop/applications /usr/share/applications/snapd
 #cd /var/lib/snapd/desktop/applications
 #sudo rm applications
 cd /usr/share/applications/snapd
 sudo rm applications

 snap run snap-store
 }
 #-----------------------balena Etcher----------------------
InstallBalenaEtcherUSBWriter()
{


 #   Add Etcher debian repository:

    echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list

#    Trust Bintray.com's GPG key:

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61

#    Update and install:

    sudo apt-get update
    sudo apt install -y --allow-unauthenticated balena-etcher-electron
echo "All done !!"
#Uninstall

#sudo apt-get remove balena-etcher-electron
#sudo rm /etc/apt/sources.list.d/balena-etcher.list
#sudo apt-get update
}
#-----------------------Firefox Quantum ----------------------
#################################################################
InstallFirefoxQuantumBrowser()
{
# ffinstall -- Revision: 103r1 -- by eznix (https://sourceforge.net/projects/eznixos/)
# (GNU/General Public License version 3.0)
#
#sleep 5
if [ -d "/opt/FFDL" ]; then sudo rm -r /opt/FFDL
fi
sudo mkdir /opt/FFDL
if [ -d "/opt/moz" ]; then sudo rm -r /opt/moz
fi
#sleep 5
sudo mkdir /opt/moz
#32 Bit
#wget -O /opt/FFDL/FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux&lang=en-US"
#64 Bit
#sleep 5
sudo wget -O /opt/FFDL/FirefoxSetup.tar.bz2 "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
#sleep 5
sudo tar xjf /opt/FFDL/FirefoxSetup.tar.bz2 -C /opt/moz/
#cp /usr/share/eznixOS103/eznix103/launchers/Firefox-Latest.desktop /usr/share/applications/
#sleep 5
sudo rm -r /opt/FFDL
#clear
sudo printf "[Desktop Entry]\nName=Firefox Quantum\nComment=Web Browser\nExec=/opt/moz/firefox/firefox https://sourceforge.net/projects/pakos/\nTerminal=false\nType=Application\nIcon=/opt/moz/firefox/browser/chrome/icons/default/default128.png\nCategories=Network;WebBrowser;\nMimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;\nStartupNotify=true" >>  /usr/share/applications/firefox-quantum.desktop
sudo ln -s /opt/moz/firefox /usr/local/bin/firefox

sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /opt/moz/firefox 200 && sudo update-alternatives --set x-www-browser /opt/moz/firefox

echo "All Done!!!"
}
#################################################################
upgrade64Bit() {
	zenity --info --width 530\
		--text="Upgrading PakOS to 64 Bit Kernal"

#wget -q --spider http://google.com
#if [ $? -eq 0 ]; then
#	zenity --info --width 530\
#			--text="Online - Updating from main repository"
#	sleep 2
#	#sudo lsof | tee >(zenity --progress --pulsate) >lsof.txt
#else
#        zenity --info --width 530\
#				--text="Offline Upgrade to 64 Bit Stable Kernal"
#				return 0
    	#sudo dpkg --add-architecture amd64
    	#cd ~/Downloads/64BitKernal/
        #sudo dpkg -i *
#fi

#sudo dpkg --print-architecture && echo #?
#if [sudo dpkg --print-architecture -eq "i386" ]; then echo "386"
#fi
#zenity --info --width 530\
#			--text="No need to upgrade, You have already 64 Bit Architecture"
#	sleep 2
#	return 0
#	*/
#else
	sudo dpkg --add-architecture amd64 && sudo apt-get update && sudo apt-get install --no-install-recommends arch-test apt-utils linux-image-amd64 | tee >(zenity --progress --pulsate) > progress.txt
#fi
#	sleep 2
	#zenity --info --text="Now Supported Architectures are:" && sudo arch-test
#	sudo lsof | zenity --text-info --width 530
#	sleep 2

	sleep 2
    sudo dpkg --print-architecture | zenity --text-info --width 530 --title="Main Architecture is now"

	sleep 2
    sudo dpkg --print-foreign-architectures | zenity --text-info --width 530 --title="Foreign Architecture is "

	sleep 2
    uname -a | zenity --text-info --width 630 --title="Full kernal Info: Reboot to Load 64 Bit Kernal"
	#zenity --info --text =
	sleep 2
	echo " "
sleep 2
}
#################################################################
UpgradeandUpdateOld () {
(echo "10" ; sudo apt-get update
echo "# Getting and Installing Updates" ; sleep 1
echo "20" ; sleep 1
echo "# Upgrading System Auto" ; sudo apt-get upgrade
echo "50" ; sleep 1
echo "# Upgrading Distriution Auto if possible" ; sudo apt-get dist-upgrade && sudo plymouth-set-default-theme -R PakOS && sudo cp /usr/share/backgrounds/PakOS.png /boot/grub && sudo update-grub
echo "75" ; sleep 1
echo "# Cleaning System if possible" ; sudo apt-get autoclean
echo "90" ; sleep 1
echo "# Removing unnecessary packages if any"; sudo apt-get auto-remove
echo "99" ; sleep 1
echo "# Done!!!"; sleep 1
echo "100"; sleep 1
) |
zenity --progress --width 400 --height 350 \
  --title="Update System" \
  --text="Updating System..." \
  --percentage=0

if [ "$?" = -1 ] ; then
        zenity --error \
          --text="Update canceled."
fi
}
#----------------------------------------------------------------
UpgradeandUpdate(){
	if [ "$(pidof synaptic)" ]
	then
   	sudo killall -9 synaptic
	else
   	echo""
	fi

	if [ -z "$(pgrep gdebi-gtk)" ]
	then
   	echo ""
	else
   	killall -9 gdebi-gtk
	fi

# PakOS default dialog icon
#ic="/usr/share/icons/zenity-llcc.png"



# Get list of available updated packages then populate them to /tmp/updateslist
zenity --question --title="PakOS Updates" --width=450 --text="We will now fetch the Updates list.\n\nClick Yes to continue or No to abort."

if [ "$?" -eq "0" ];then

		x=$(stdbuf -oL /bin/bash \-c '(sudo apt-get update \-y )' 2>&1 |
		stdbuf -oL sed -n -e '/\[*$/ s/^/# /p' -e '/\*$/ s/^/# /p'|
		zenity --progress --title="Updating package information..." --pulsate \
		--width=600 --auto-close )

		# Creates a list in /tmp/updateslist
		LISTNAMES=$(apt-get --just-print upgrade 2>&1 | perl -ne 'if (/Inst\s([\w,\-,\d,\.,~,:,\+]+)\s\[([\w,\-,\d,\.,~,:,\+]+)\]\s\(([\w,\-,\d,\.,~,:,\+]+)\)? /i) {print "Name: $1 INSTALLED: $2 AVAILABLE: $3\n"}' | awk '{print NR,":\t"$0}' | tee /tmp/updateslist)

# Check if any updates are available, if there are none, script pops up dialog box saying 'No Updates Available', removes /tmp/updateslist
	if [  -z "$(cat /tmp/updateslist)"  ]; then
    	zenity --info --title="PakOS Updates" \
      	--text="No Updates Available"
   	rm /tmp/updateslist
   	return 0
	fi

	# Insert text into  /tmp/updateslist
			sed -i -e '1 i\List of available Updates' -e '1 i\Click Update to continue or Cancel to stop the update process\n'  /tmp/updateslist

	# Erase existing available info
	sudo dpkg --clear-avail

else
    return 0
fi

# Call the zenity dialog to show update list
zenity --text-info --ok-label="Update" --cancel-label="Cancel" --title="PakOS Updates" --width=780 --height=300 --filename="/tmp/updateslist"
      if [ "$?" -eq "0" ];then


      # Continue script if no halt
        INSTALL_ICON="/usr/share/icons/zenity-llcc.png"
        APPNAME="PakOS"

                 #remove tmp file
                 rm /tmp/updateslist

       x=$( stdbuf -oL /bin/bash \-c '(sudo apt-get upgrade \-y )' 2>&1 | tee /tmp/PakOSUpdates.log |
       stdbuf -oL sed -n -e '/\[*$/ s/^/# /p' -e '/\*$/ s/^/# /p'|
       zenity --progress --title="Updating..." --pulsate \
       --width=600 --auto-close )

                                if [ "${PIPESTATUS[0]}" -ne "0" ]; then

                                        zenity --error \
                                        --title="Error" --text="$APPNAME Updates have failed."
                                        return 0
                                fi

       x=$( stdbuf -oL /bin/bash \-c '(sudo apt-get dist-upgrade \-y && sudo plymouth-set-default-theme -R PakOS && sudo cp /usr/share/backgrounds/PakOS.png /boot/grub && sudo update-grub)' 2>&1 | tee /tmp/PakOSUpdates.log |
       stdbuf -oL sed -n -e '/\[*$/ s/^/# /p' -e '/\*$/ s/^/# /p'|
       zenity --progress --title="Dist Updating..." --pulsate \
       --width=600 --auto-close )

                                if [ "${PIPESTATUS[0]}" -ne "0" ]; then

                                        zenity --error \
                                        --title="Error" --text="$APPNAME Dist upgrade has failed."
                                        return 0
                                fi
       x=$( stdbuf -oL /bin/bash \-c '(sudo apt-get autoclean \-y )' 2>&1 | tee /tmp/PakOSUpdates.log |
       stdbuf -oL sed -n -e '/\[*$/ s/^/# /p' -e '/\*$/ s/^/# /p'|
       zenity --progress --title="Auto Cleaning..." --pulsate \
       --width=600 --auto-close )

                                if [ "${PIPESTATUS[0]}" -ne "0" ]; then

                                        zenity --error \
                                        --title="Error" --text="$APPNAME Auto Cleaning has failed."
                                        return 0
                                fi
      x=$( stdbuf -oL /bin/bash \-c '(sudo apt-get auto-remove \-y )' 2>&1 | tee /tmp/PakOSUpdates.log |
       stdbuf -oL sed -n -e '/\[*$/ s/^/# /p' -e '/\*$/ s/^/# /p'|
       zenity --progress --title="Auto Remove..." --pulsate \
       --width=600 --auto-close )

                                if [ "${PIPESTATUS[0]}" -ne "0" ]; then

                                        zenity --error \
                                        --title="Error" --text="$APPNAME Auto Remove has failed."
                                        return 0
                                fi



   # Halt updates script if user selects Cancel
    else
         rm /tmp/updateslist
             return 0
   fi

PROCEED=$(zenity --question --title="$APPNAME Updates" --text="Updates have finished installing.\n\nWould you like to view the $APPNAME Updates log?"; echo $?)
	if [ ${PROCEED} -eq 1 ]; then
   	zenity --info --title="$APPNAME Updates" --window-icon="${INSTALL_ICON}" --text="$APPNAME Updates Complete."
   	exit;
	else
   	zenity --text-info --ok-label="Quit" --cancel-label="Cancel" --title="Updates Log" --width=700 --height=300 --filename="/tmp/PakOSUpdates.log"
	fi

}
#################################################################
PakOSonLinuxWeeklyNews () {
xdg-open https://static.lwn.net/Distributions/#pakistan &
}
#----------------------------------------------------------------
PakOSonDebainDerivativesCensus () {
xdg-open https://wiki.debian.org/Derivatives/Census/PakOS &
}
#----------------------------------------------------------------
PakOSonDistroWatch () {
xdg-open https://distrowatch.com/dwres-mobile.php?resource=links &
xdg-open https://www.youtube.com/watch?v=6Q7To0eX3hU &

}
#----------------------------------------------------------------
PakOSonSourceForge () {
xdg-open https://sourceforge.net/projects/pakos/ &
}
#----------------------------------------------------------------
PakOSDedications () {
zenity --info --width=381 --height=381 --title="Dedication" --icon-name="face-smile" --text="PakOS is dedicated to the Great People of Pakistan, who have always triumphed in the face of harshest calamities and will continue to do so ... \n \n \n I also dedicate my humble effort to my Mentor and Teacher eznix, a great Gentleman, PakOS would never have been made possible without his selfless encouragements, great spirit and belief in Open Source"

xdg-open https://sourceforge.net/projects/eznixos/ &

xdg-open https://www.youtube.com/channel/UCQrSHD-tv9nkssrD4nNGcMw &
}
#----------------------------------------------------------------
PakOSLinksVote () {
while true
do
ans=$(zenity --list \
  	--title="PakOS Links" --width 500 --height 280\
  	--column="Ser" --column="Please Select an Option"  \
		1  "PakOS on SourceForge"\
		2  "PakOS on DistroWatch - Vote for PakOS" \
		3  "PakOS on Debain Derivatives Census" \
		4  "PakOS on Linux Weekly News" \
		5  "Dedications"\
		6  "Exit");
case $ans in
 1) PakOSonSourceForge;;
 2) PakOSonDistroWatch;;
 3) PakOSonDebainDerivativesCensus;;
 4) PakOSonLinuxWeeklyNews;;
 5) PakOSDedications;;
 6) return 0;;
esac
done

}
#################################################################

DisableService()
{
sudo systemctl disable $1
}
#-----------------------------------------------------------------
EnableService()
{
sudo systemctl enable $1
}
#-----------------------------------------------------------------
MaskService()
{
sudo systemctl mask $1
}
#-----------------------------------------------------------------
UnmaskService()
{
sudo systemctl unmask $1
}
#-----------------------------------------------------------------
CheckServiceStatus()
{
systemctl list-unit-files | grep $1 | grep enabled --quiet && echo TRUE
}
#-----------------------------------------------------------------
ServicesManagementDisableNew ()
{
#local CupsStatus ClamAVStatus HeavgedStatus
local CupsStatus=CheckServiceStatus "cups"
local ClamAVStatus=CheckServiceStatus "clamav"
local HeavgedStatus=CheckServiceStatus "heavged"

ans=$(zenity  --list  --text "Please Check Services to disable" --checklist  --column "Disbale" --column "Services" $CupsStatus "cups" $ClamAVStatus "clamav" $HeavgedStatus "heavged"  --separator=":"); echo $ans

IFS=':' read -ra ADDR <<< "$ans"
for i in "${ADDR[@]}"; do
    DisableService $i
done
}
#-----------------------------------------------------------------
ServicesManagementEnableNew ()
{
#local CupsStatus ClamAVStatus HeavgedStatus
local CupsStatus=CheckServiceStatus "cups"
local ClamAVStatus=CheckServiceStatus "clamav"
local HeavgedStatus=CheckServiceStatus "heavged"

ans=$(zenity  --list  --text "Please Check Services to Enable" --checklist  --column "Enable" --column "Services" $CupsStatus "cups" $ClamAVStatus "clamav" $HeavgedStatus "heavged"  --separator=":"); echo $ans

IFS=':' read -ra ADDR <<< "$ans"
for i in "${ADDR[@]}"; do
    EnableService $i
done
}
#systemctl list-unit-files | grep enabled
#-----------------------------------------------------------------
ServicesManagementDisable ()
{
SvcList=()
SvcState=()
SvcList=$(systemctl list-unit-files | sed 's/[ ]* //g' | grep .service |  grep -E 'enabled|disabled' | sed 's/enabled/TRUE:/' | sed 's/disabled/FALSE:/' |sed 's/.service/:/');# | sed 's/[ ]* //g'); #last sed 's/ *$//g' remove all trailing spaces
#SvcState=$(systemctl list-unit-files | grep .service |  grep -E 'enabled|disabled' | sed 's/enabled/TRUE/' | sed 's/disabled/FALSE/' |sed 's/.service//' | sed -n '/enabled/,$p' SvcList);
echo $SvcList #| cut -d: -f2-
arrIN=(${SvcList//:/ })
echo "${arrIN[0]}"
echo "${arrIN[1]}"

choices=(`zenity \
	--list --width 500 --height 250\
	--separator="$IFS" \
	--checklist --multiple \
	--text="Show Running Services:" \
	--column "Disable" \
	--column "Service name" \
	  "${arrIN[@]}"`)
#IFS="$OLDIFS"
echo "Selected Choice was named $choices"
echo "You selected ${#arrIN[$choices]}: out of total ${#arrIN[@]}"
for choice in "${arrIN[@]}" ; do
	if [ "$choice" == TRUE ]; then
    	echo -e "\t $choice "
	fi
done
}
#-----------------------------------------------------------------
ManageSelectedService()
{
while true
do
ans=$(zenity --list --width 381 --height 381\
  	--title="Manage Selected Service" \
  	--column="Ser" --column="Please Select an Option"  \
		1  "Enable Service"\
		2  "Disable Service"\
		3  "Mask Service (Full Disable))"\
		4  "Unmask Service"\
		5 "Exit");
case $ans in
 1) EnableService $1;;
 2) DisableService $1;;
 3) MaskService $1;;
 4) UnmaskService $1;;
 5) exit;;
esac
done


}
#-----------------------------------------------------------------
ServicesManagement()
{
SvcList=()
#SvcList=$(systemctl list-unit-files |grep .service | grep disabled | sed 's/disabled//' | sed 's/.service/,/' | sed 's/ *$//g'); echo $SvcList
SvcList=$(systemctl list-unit-files |grep .service |grep 'enabled\|disabled\|masked' | sed 's/.service/,/' | sed 's/ *$//g'); echo $SvcList

arrIN=(${SvcList//,/ })
#echo "${arrIN[0]}"
#echo "${arrIN[1]}"

while true
do
	choices=(`zenity \
		--list --width 481 --height 681\
		--separator="$IFS" \
		--text="Show All Services:" \
		--column "Service name" \
		--column "Status" \
		"${arrIN[@]}"`)
	#IFS="$OLDIFS"
	echo "Selected Choice was named $choices"
	echo "You selected Ser No ${#arrIN[$choices]}: out of total ${#arrIN[@]}"
	while true
	do
	ans=$(zenity --list --width 381 --height 381\
  		--title="Manage $choices Service" \
  		--column="Ser" --column="Please Select an Option"  \
			1  "Enable $choices"\
			2  "Disable $choices"\
			3  "Mask $choices (Full Disable))"\
			4  "Unmask $choices"\
			5 "Exit");
	#proceed, if a service was selected, oherwise exit  (Cancelled was pressed)
	case $ans in
 	1) EnableService $choices;;
 	2) DisableService $choices;;
 	3) MaskService $choices;;
 	4) UnmaskService $choices;;
 	5) return 0;;
	esac
	done
done


	#ManageSelectedService $choices;;

}
#-----------------------------------------------------------------
ServicesManagementold()
{
while true
do
ans=$(zenity --list --width 400 --height 250\
  	--title="Manage Services" \
  	--column="Ser" --column="Please Select an Option"  \
		1  "Disable Running Services"\
		2  "Enable Stopped Services" \
		3  "Exit");
case $ans in
 1) ServicesManagementDisable;;
 2) ServicesManagementEnable;;
 3) return 0;;
esac
done
}
#------------------------PortsManagement--------------------------------------
PortsManagement ()
{
while true
do
ans=$(zenity --list --width 400 --height 250\
  	--title="Manage Ports" \
  	--column="Ser" --column="Please Select an Option"  \
		1  "List Open Ports"\
		2  "Close Open Ports"\
		3  "Open a Close Port"\
		4  "Exit");
case $ans in
 1) ListOpenPorts;;
 2) CloseOpenPorts;;
 3) OpenClosedPorts;;
 4) return 0;;
esac
done
}
#------------------------------ListOpenPorts---------------------------------
ListOpenPorts ()
{
sudo ss -twlwn | grep  LISTEN



less /etc/services
}
#------------------------------CloseOpenPorts---------------------------------
CloseOpenPorts ()
{
sudo ufw deny $1
}
#------------------------------OpenClosedPorts---------------------------------
OpenClosedPorts ()
{
sudo ufw allow $1
}
#------------------------------ServicesManagementOld---------------------------------
ServicesManagementOld () {
while true
do
ans=$(zenity --list --width 400 --height 250\
  	--title="Manage Services" \
  	--column="Ser" --column="Please Select an Option"  \
		1  "AntiVirus Service"\
		2  "Printing Service" \
		3  "Random Number Generator" \
		5  "Exit");
case $ans in
 1) DisableService "clamav";;
 2) DisableService "cups";;
 3) DisableService "haveged";;
 5) return 0;;
esac
done
}
#################################################################
Smartphone () {
while true
do
ans=$(zenity --list --width 400 --height 250 \
  	--title="Manage Smartphones" \
  	--column="Ser" --column="Please Select an Option"  \
		1  "Mount Anroid Smartphone"\
		2  "Unmount Smartphone" \
		3  "Install Apple Software" \
		4  "Install Media Player Software"\
		5  "Exit");
case $ans in
 1) MountAnroidSmartphone;;
 2) UnmountSmartphone;;
 3) InstallAppleSoftware;;
 4) InstallMediaPlayerSoftware;;
 5) return 0;;
esac
done
}
#----------------------------------------------------------------
MountAnroidSmartphone()
{
sudo apt-get install jmtpfs
mkdir ~Android
jmtpfs ~/Android/


}
#----------------------------------------------------------------
UnmountSmartphone()
{
fusermount -u ~/Android/

}
#----------------------------------------------------------------
InstallMediaPlayerSoftware()
{
sudo apt-get install gmtp mtp-tools
}
#################################################################
Gaming () {
while true
do
ans=$(zenity --list --width 400 --height 300\
  	--title="Install Gaming Software" \
  	--column="Ser" --column="Please Select an Option"  \
		1  "Install CrossOver Linux"\
		2  "Install Wine and Play on Linux" \
		3  "Install NVidia Drivers" \
		4  "Install Steam"\
		5  "Install Gnome Gaming Bundle"\
		6  "Install KDE Games Bundle"\
		7 "Exit");
case $ans in
 1) InstallCrossOverLinux;;
 2) InstallWineandPlayonLinux;;
 3) InstallNVidiaDrivers;;
 4) InstallSteam;;
 5) InstallGnomeGamingBundle;;
 6) InstallKDEGamesBundle;;
 7) return 0;;
esac
done
}
#################################################################
AtomDevelopmentEnvironment ()
{

xdg-open https://atom.io/ &

sudo wget https://atom.io/download/deb/atom-amd64.deb && apt -install ./atom-amd64.deb

}
#################################################################
InstallNVidiaDrivers ()
{
# https://linuxconfig.org/how-to-install-nvidia-driver-on-debian-10-buster-linux
sudo apt -y install nvidia-detect
nvidia-detect
apt install -y nvidia-driver
echo "All Done!!"
xdg-open https://www.nvidia.com/en-us/drivers/unix/ &

}
#################################################################
InstallGnomeGamingBundle ()
{
sudo apt install -y gnome-games
echo "All Done!!"
}
#################################################################
InstallKDEGamesBundle ()
{
sudo apt install -y kdegames
echo "All Done!!"
}
#################################################################
InstallOperaBrowser ()
{
#https://wiki.debian.org/Opera
#sudo nano /etc/apt/sources.list
echo This action will auto add non free respository in the sources.list
echo deb http://deb.debian.org/debian/ buster main contrib non-free
sudo apt-add-repository non-free
#sudo apt update
#sudo wget -O - https://deb.opera.com/archive.key | apt-key add -
sudo apt update
sudo apt install -y opera-stable
echo "All Done!!"
#xdg-open https://www.opera.com/computer &
#xdg-open https://www.opera.com/computer/thanks?partner=www&par=id=49276%26location=415&gaprod=opera &
}
#################################################################
InstallFranz ()
{
#xdg-open https://meetfranz.com/#download &
wget https://github.com/meetfranz/franz/releases/download/v5.5.0/franz_5.5.0_amd64.deb
sudo apt install ./franz_5.5.0_amd64.deb
echo "All Done!!"
}
#################################################################
InstallZoom ()
{
#xdg-open https://zoom.us/download?os=linux &
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install -y ./zoom_amd64.deb
echo "All Done!!"
}

#################################################################
InstallValueAddedSoftware () {

yad --form --width=381 --columns=4 --text="Choose Your Option:" \
--field="     Firefox Quantum!/usr/share/icons/PakOS_Icons/firefox.png":fbtn "bash -c InstallFirefoxQuantumBrowser" \
--field="              Chrome!/usr/share/icons/PakOS_Icons/chrome.png":fbtn "bash -c InstallChromeBrowser" \
--field="                 TOR!/usr/share/icons/PakOS_Icons/TOR.png":fbtn "bash -c InstallTORBrowser" \
--field="               Opera!/usr/share/icons/PakOS_Icons/opera.png":fbtn "bash -c InstallOperaBrowser" \
--field="     CrossOver Linux!/usr/share/icons/PakOS_Icons/Crossover.png":fbtn "bash -c InstallCrossoverLinux" \
--field="Wine and PlayonLinux!/usr/share/icons/PakOS_Icons/PlayonLinux.png":fbtn "bash -c InstallWineandPlayonLinux" \
--field="   WPS Office 64 Bit!/usr/share/icons/PakOS_Icons/WPS.png":fbtn "bash -c InstallWPSOffice2019" \
--field="          VirtualBox!/usr/share/icons/PakOS_Icons/VirtulaBox.png":fbtn "bash -c InstallVirtualBox" \
--field="        Google Earth!/usr/share/icons/PakOS_Icons/GoogleEarth.png":fbtn "bash -c InstallGoogleEarth" \
--field="              RamBox!/usr/share/icons/PakOS_Icons/Rambox.png":fbtn "bash -c InstallRamBox" \
--field="               Franz!/usr/share/icons/PakOS_Icons/Franz.png":fbtn "bash -c InstallFranz" \
--field="   Ubuntu Snap Store!/usr/share/icons/PakOS_Icons/Snapstore.png":fbtn "bash -c InstallUbuntuSnapStore" \
--field="  KDE Discover Store!/usr/share/icons/PakOS_Icons/AppOutletStore.png":fbtn "bash -c InstallKDEDiscoverStore" \
--field="   Balena USB Writer!/usr/share/icons/PakOS_Icons/BaenaEtcher.png":fbtn "bash -c InstallBalenaEtcherUSBWriter" \
--field="      Nvidia Drivers!/usr/share/icons/PakOS_Icons/Nvidia.png":fbtn "bash -c InstallNVidiaDrivers" \
--field="               Steam!/usr/share/icons/PakOS_Icons/Steam.png":fbtn "bash -c InstallSteam" \
--field="         Gnome Games!/usr/share/icons/PakOS_Icons/Gnome.png":fbtn "bash -c InstallGnomeGamingBundle" \
--field="           KDE Games!/usr/share/icons/PakOS_Icons/KDE.png":fbtn "bash -c InstallKDEGamesBundle" \
--field="            Atom IDE!/usr/share/icons/PakOS_Icons/Atom.png":fbtn "bash -c AtomDevelopmentEnvironment" \
--field="                Zoom!/usr/share/icons/PakOS_Icons/zoom.png":fbtn "bash -c InstallZoom" \
--button=gtk-cancel:1
}
#-----------------------------------------------------------------
InstallValueAddedSoftwareOld ()
{
while true
do
ans=$(zenity --list --width 400 --height 500 \
  	--title="Install Value Added Software" \
  	--column="Ser" --column="Please Select to Install"  \
		1  "Firefox Quantum Browser"\
		2  "Chrome Browser" \
		3  "TOR Browser" \
		4  "Crossover Linux"\
		5  "Wine and Play on Linux"\
		6  "WPS Office 2019 64 Bit Only"\
		8  "Virtual Box"\
		9  "Google Earth"\
		10 "RamBox"\
		11 "Ubuntu Snap Store"\
		12 "App-Outlet Store"\
		13 "Balena Etcher USB Writer"\
		14 "Gaming"\
		15 "Atom Development Environment"\
		16 "Exit");
case $ans in
 1) InstallFirefoxQuantumBrowser;;
 2) InstallChromeBrowser;;
 3) InstallTORBrowser;;
 4) InstallCrossoverLinux;;
 5) InstallWineandPlayonLinux;;
 6) InstallWPSOffice2019;;
 8) InstallVirtualBox;;
 9) InstallGoogleEarth;;
 10) InstallRamBox;;
 11) InstallUbuntuSnapStore;;
 12) InstallKDEDiscoverStore;;
 13) InstallBalenaEtcherUSBWriter;;
 14) Gaming;;
 15) AtomDevelopmentEnvironment;;
 16) return 0;;
esac
done
}

#################################################################
USBTools () {
while true
do
ans=$(zenity --list --width 400 --height 300\
  	--title="USB Tools" \
  	--column="Ser" --column="Please Select an Option"  \
		1  "Format USB"\
		2  "Encrypt USB" \
		3  "Force Encrypt USB on Plugin" \
		4  "Force Virus Scan USB on Plugin"\
		5  "Write PakOS ISO on USB"\
		6  "List all USB Devices"\
		7  "Use USB as 2 Factor Authentication"\
		8 "Exit");
case $ans in
 1) FormatUSB;;
 2) EncryptUSB;;
 3) ForceEncryptUSBonPlugin;;
 4) ForceVirusScanUSBonPlugin;;
 5) WritePakOSISOonUSB;;
 6) ListallUSBDevices;;
 7) UseUSBas2FactorAuthentication;;
 8) return 0;;
esac
done
}

#------------------------UseUSBas2FactorAuthentication-------------------------------
UseUSBas2FactorAuthentication () {
ls -l
}
#------------------------UseUSBas2FactorAuthentication-------------------------------
UseUSBas2FactorAuthentication2 () {
ls -l
}
#------------------------UseUSBas2FactorAuthentication-------------------------------
UseUSBas2FactorAuthentication3 () {
ls -l
}
#------------------------UseUSBas2FactorAuthentication-------------------------------
UseUSBas2FactorAuthentication4 () {
ls -l
}
#------------------------UseUSBas2FactorAuthentication-------------------------------
UseUSBas2FactorAuthentication5 () {
ls -l
}

#------------------------FormatUSB-------------------------------
FormatUSB () {
df -h
sudo umount /dev/sdc1
#    Format with vFat File System

    sudo mkfs.vfat /dev/sdc1

#    Format with NTFS File System

    sudo mkfs.ntfs /dev/sdc1

#    Format with EXT4 File System

    sudo mkfs.ext4 /dev/sdc1


}
#------------------------FormatUSB-------------------------------
FormatUSB2 () {
lsblk
df
#Suppose it may be /dev/sdy1. Unmount it with:

sudo umount /dev/sdy1

#To format drive with the FAT32 file system format:

sudo mkfs.vfat /dev/sdy1

#To set a file system label for your pen drive in the process:

sudo mkfs.vfat -n 'name_for_your_pendrive' /dev/sdy1


}
#------------------------FormatUSB-------------------------------
FormatUSB3 () {
#Erase everything in the pen drive (This step is Optional):

sudo dd status=progress if=/dev/zero of=/dev/sdb bs=4k && sync

#Replace /dev/sdb with your corresponding device.
dd if=/dev/zero of=/dev/sdb bs=4k && sync
#dd: error writing '/dev/sdb': No space left on device

#1984257+0 records in
#1984256+0 records out
#8127512576 bytes (8.1 GB) copied, 1236.37 s, 6.6 MB/s
#Make a new partition table in the device:
sudo fdisk /dev/sdb
#Then press letter o to create a new empty DOS partition table.
#Make a new partition:

#    Press letter n to add a new partition. You will be prompted for the size of the partition. Making a primary partition when prompted, if you are not sure.

#    Then press letter w to write table to disk and exit.


#    Issue the command below to format the new volume:

    sudo mkfs.vfat /dev/sdb1

 #   Please replace /dev/sdb1 with your corresponding device.

 #   Eject the device:

    sudo eject /dev/sdb
}
#------------------------EncryptUSB------------------------------
EncryptUSB () {
#1. Use the fdisk command to find the device name for your USB Drive:
sudo fdisk -l

#The above command lists all partition tables for the specified devices connected on your system. In my case I connected an external 8GB USB Drive on my computer and it showed up as device name /dev/sdb.

#2. OPTIONAL: Use the shred command to overwrite random data by 1s and 0s several times on the USB Drive:
sudo shred -v -n 1 /dev/sdb

#his way you start off having random data on your USB Drive to begin with.

#3. Install cryptsetup package on your system:
sudo apt-get install cryptsetup

#You may already have it installed by default on your Ubuntu OS.

#4. Set up a new dm-crypt device in LUKS encryption mode:
sudo cryptsetup luksFormat /dev/sdb

#You will need you enter the passphrase for your encrypted usb.

#5. Open the device and setup mapping with name provided (e.g. USBDrive in this example):
sudo cryptsetup luksOpen /dev/sdb USBDrive

#Provide the passphrase you had earlier setup in step 4.

#6. Verify the new virtual block device mapper:
ls -arlt /dev/mapper | tail

#7. Run ext4 filesystem directly on that device:
sudo mkfs -t ext4 /dev/mapper/USBDrive

#8. Mount the device your filesystem:
sudo mount /dev/mapper/USBDrive /USBDrive

#9. Verify the the mapper is properly mounted using the df command:
df -h /USBDrive/

#10. Success, at this point you can use the filesystem as you normally would, you have an encrypted USB Drive in your hand now.

#Additional Notes: Use the following two commands on every reboot to mount and unmount a drive:

#Mounting:
sudo cryptsetup luksOpen /dev/sdb USBDrive
#Provide your pass phrase:
sudo mount /dev/mapper/USBDrive /USBDrive

#Unmounting:
sudo umount /USBDrive
sudo cryptsetup luksClose USBDrive

#Resources:
#1. http://www.markus-gattol.name/ws/dm-crypt_luks.html


}
#------------------------ForceEncryptUSBonPlugin-------------------------------
ForceEncryptUSBonPlugin () {
ls -l


}
#------------------------ForceVirusScanUSBonPlugin-------------------------------
ForceVirusScanUSBonPlugin () {


#This is an automated script. Just run it as root. You can change the command executed by editing /usr/bin/doOnUSBinsert.

#!/bin/bash
#doOnUSBinsert_0.2.sh
#Author : Totti
# Make it executable by running 'sudo chmod  x doOnUSBinsert_0.2.sh'


if ! [ -f /etc/udev/rules.d/80-doOnUSBinsert.rules ]
then        # rule not added
   cp "$0" /usr/bin/doOnUSBinsert
   chmod u x /usr/bin/doOnUSBinsert

#   echo 'SUBSYSTEM=="usb", ACTION=="add", RUN ="/path/to/script.sh"' | sudo tee     /etc/udev/rules.d/80-clamscan.rules
   echo 'SUBSYSTEM=="usb", ACTION=="add", RUN ="/usr/bin/doOnUSBinsert & "' | tee     /etc/udev/rules.d/80-doOnUSBinsert.rules
   if  [ $? -eq 0 ]
   then
     echo 'Rule Successfully added. See file "/usr/bin/doOnUSBinsert" if you wish to edit the command'
     exit 0
    else
     echo 'ERROR while adding rule'
     exit 1
   fi
fi



lfile="/tmp/doOnUSBinsert.log"     # udev
lfile2="/tmp/clamscanFromUdev.log"   # clamscan
lfile3="/tmp/doOnUSBinsert_mount.log"   # mount


main ()
{
sleep 12  # let the partitions to mount

   #cat /proc/$$/environ | tr '�' 'n' >> /tmp/udevEnvirn.txt
echo "found $ID_SERIAL"   >> "$lfile"
  cat /etc/mtab | grep "^$part_c"   >> "$lfile.3"

if [ "$ID_SERIAL"x = 'x' ]
then
 echo "Exiting on empty ID_SERIAL"   >> "$lfile"
 exit 1
fi

#Eg: ID_SERIAL --> /dev/disk/by-id/usb-sandisk....42343254343543
#i=0
echo 'searching partitions'   >> "$lfile"

for partitionPath in  $( find /dev/disk/by-id/ -name "*$ID_SERIAL*part*" )
do
  echo "current partition = $partitionPath"   >> "$lfile"
 # part[i  ]="$( readlink -f "$partition" )"        # Eg Output: /dev/sdb1     , /dev/sdb2
  part_c="$( readlink -f $partitionPath )"
  mpoint="$( cat /etc/mtab | grep "^$part_c"  | awk '{print $2}' )"

  echo "partitionPath= $partitionPath, part = $part_c, mountpoint=  $mpoint"  >>     "$lfile"

  echo "Scaning -->  $mpoint"  >> "$lfile.2"
  ############################################
  clamscan -r --bell "$mpoint"/*  >> "$lfile.2"
  #############################################
done
}


main &
echo ______________________________________  >> "$lfile"
exit 0


}
#------------------------ForceVirusScanUSBonPlugin-------------------------------
ForceVirusScanUSBonPlugin2 () {
#I finished the udev rule and the script to scan a flash-drive for viruses when mounted.
#They are working now.

#"/etc/udev/rulles.d/99-scan-UsbStorage.rules"
#Code:

#KERNEL=="sd*1", SUBSYSTEM=="block", DRIVER=="usb-storage", NAME="flash_drive" RUN+="/etc/udev/scripts/clamscan.sh &"

#"clamscan.sh"
#Code:

#!/bin/ksh
file="/tmp/clamscan.log"
export DISPLAY=":0.0"

zenity --info --width=180 --title="Clam Anti Virus" --text="Executing virus scan on flashdrive" &

if [ -f $file ]; then
        rm -f $file
fi

date > $file

flashdisk_dir=`udevinfo -q all -p $(udevinfo -q path -n /dev/flash_drive) | grep "ID_FS_LABEL" | awk -F "=" '{print $2}'`

/usr/local/bin/clamscan -r --bell /media/$flashdisk_dir/* >> $file 2>&1

if [ -f $file ]; then
        file_content=`date; tail --lines 10 $file; echo "\nSee /tmp/clamscan.log for more information"`

        #zenity --text-info --title="Clam Anti Virus" --filename=$file &
        zenity --info --width=180 --title="Clam Anti Virus" --text="$file_content" &
fi

exit 0
}

#------------------------WritePakOSISOonUSB------------------------------
WritePakOSISOonUSB () {
#FILE=`zenity --file-selection --width 381 --file-filter='ISO Image (iso) | *.iso' --title="Select an ISO Image to Write to USB"`
#DIRECTORY=$(dirname "${FILE}")
#zenity --info --width 381 --title="Selected File is" --text=$FILE


#USBDrive=$(zenity  --file-selection --title="Choose USB Drive" --directory)
#zenity --info --width 381 --title="Selected USB Drive is" --text=$USBDrive
#USBDrive=$(lsblk | grep /media | grep -oP "sd[a-z]" | awk '{print "/dev/"$1}' | sort | uniq)

#zenity --info --width 381 --title="Selected USB Drive is" --text=$USBDrive

#sudo umount $USBDrive
#sudo dd status=progress if=$FILE of=$USBDrive
#sudo dd bs=4M if=$FILE of=$USBDrive conv=fdatasync  status=progress
/opt/balenaEtcher/balena-etcher-electron
}

#------------------------ListallUSBDevices-------------------------------
ListallUSBDevices () {
for device in /sys/block/*
do
    if udevadm info --query=property --path=$device | grep -q ^ID_BUS=usb
    then
        echo $device
    fi
done


 # Criação       : 2019-07-24 RBR.
  local disks=`lsblk -o name,tran | awk '$2=="usb"{print $1}' | tr "\n" " " | sed -E "s/^ +//g;s/ +$//g"`
 # Another method
  local mask=`sed -E "s/ /\([\\\\t ]|[0-9]\)+|/g;s/$/\([\\\\t ]|[0-9]\)+/g" <<< ${disks}`
  lsblk -f | sed -n "1p"
  lsblk -f | grep -E "$mask"
  lsblk | grep /media | grep -oP "sd[a-z]" | awk '{print "/dev/"$1}' | sort | uniq

  #df | grep USB
}
#################################################################
ChooseFastestUpdateMirror()
{
sudo netselect-apt  #auto selects the fastest mirror and updates the sources.list n home only, may not be run each time.


}
#################################################################
UpdateLatestKernal ()
{
echo "Current Installed Kernal Is:" && uname -r
echo "Abprt Now to Cancel, otherwise, latest kernal wil be installed and system rebooted automatically"
sleep 10
echo "Add this line in Sources.list:        deb http://deb.debian.org/debian buster-backports main"
sudo nano /etc/apt/sources.list
echo "System will now be updated to include the back-ports repository"
sleep 10
sudo apt update
echo "Installing Latest Kernal Now"
sleep 10
sudo apt -t buster-backports install linux-image-amd64
#sudo reboot
#for 64 nit kernal
echo "setting up PakOS plumouth theme now"

plymouth-set-default-theme -l
sudo plymouth-set-default-theme -R PakOS

echo "SYSTEM WILL REBOOT NOW , PRESS CTRL + C NOW TO ABORT REBOOT, yoy may reboot later to complete kernal installation later"
sleep 10
sudo reboot

}
#################################################################
AdvanceDeveloperTools () {
while true
do
ans=$(zenity --list --width 581 --height 381\
  	--title="Developer Tools" \
  	--column="Ser" --column="Please Select an Option with Care, Exercise Caution, Some Options may break your Installation"  \
		1  "Choose Fastest Update Mirror"\
		2  "Upgrade 64 Bit (Not Required, PakOS is fully multi arch)"\
		3  "USB Tools (To Do)"\
		4  "Services Management - Working: Use at your own Risk"\
		5  "Ports Management (To do)"\
		6  "Update Latest Kernal (Use at your own Risk)"\
		7  "Build PakOS"\
		8  "Return"\
		9  "Exit");
case $ans in
 1) ChooseFastestUpdateMirror;;
 2) upgrade64Bit;;
 3) USBTools;;
 4) ServicesManagement;;
 5) PortsManagement;;
 6) UpdateLatestKernal;;
 7) RemasterPakOS;;
 8) return 0;;
 9) exit;;
esac
done
}
#################################################################
DisableIPV6()
{
echo "Name of Active Network Interface is"
ethernet="$(nmcli -t -f NAME c show --active)"
#OUTPUT="$(ls -1)"  #save command output in a variable
#echo "${OUTPUT}"
#How to remove both leading and trailing spaces--chain the seds:
#FOO=' test test test '
#FOO_NO_EXTERNAL_SPACE="$(echo -e "${FOO}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
#echo -e "FOO_NO_EXTERNAL_SPACE='${FOO_NO_EXTERNAL_SPACE}'"
# > FOO_NO_EXTERNAL_SPACE='test test test'
#echo -e "length(FOO_NO_EXTERNAL_SPACE)==${#FOO_NO_EXTERNAL_SPACE}"
# > length(FOO_NO_EXTERNAL_SPACE)==14
#ethernet="$(ls /sys/class/net | grep "eth")"
echo "Now disabling IPV6 on Active Network Connection ${ethernet}"
nmcli connection modify "${ethernet}" ipv6.method "ignore"
echo "Restarting Active Interface ${ethernet} to take effect"
nmcli connection up  "${ethernet}"
echo "Please see that IPV6 is disabled for ${ethernet}"
ip address show #"${ethernet}"





}
#################################################################
EnableIPV6()
{

ls -l

}
#################################################################
EnableInternetInPakistan()
{
zenity --info --width 381 --title="Some Mixed News" --text="Debain 10 has made IPV6 as default to connect to Internet, a protocol which many a service providers in Pakistan and some in world do not support fully, resuting in blockage of internet facility after a few minutes of use. So, i have disabled the IPv6 at multiple lavels as per this tutoral https://itsfoss.com/disable-ipv6-ubuntu-linux/. However, still user has to do some settings by hand (To be prformed by End Users) including: \n 1. Edit Connection in Network Manager Applet  \n 2. Select Either Wifi or Ethernet Connection \n 3. Edit the selected Connection by clicking on the settings icon at the bottom \n 4. Set IPV6 Settings set to Method: Ignore \n 5. Set IPv4 Settings as  Automatic (DHCP) address only \n 6. Set DNS Server as either "208.67.222.222" (DNS Provider: CISCO) or "1.1.1.1" (DNS Provider: CloudFlare) or "8.8.8.8" (DNS Provider: Google) \n  7. Finally Save \n 8. To be sure, disconnect and then conect Internet once. \n Interneet Conection will now work flawlessly"

xdg-open https://www.youtube.com/watch?v=xJHQ-xWVoUo &
}
#################################################################
#---------------------EnableLightWeightMenu-----------------------
EnableLightWeightMenu()
{
cd ~/.config/autostart
ls *.desktop
echo "This will disable standard menu system and enable light weight menu system with minimum memory foot print"
mkdir backupMin
cp *.desktop ~/.config/autostart/backupMin/
rm *.desktop
cp ~/.config/autostart/min/*.desktop ~/.config/autostart/
echo "system will logoff now to take efect"
lxqt-leave --logout
}
export -f EnableLightWeightMenu
#---------------------EnableFullMenuSstem-----------------------
EnableFullMenuSystem()
{
cd ~/.config/autostart
ls *.desktop
echo "This will disable standard menu system and enable mid weight menu system with meduim foot print"
mkdir backupMax
cp *.desktop ~/.config/autostart/backupMax/
rm *.desktop
cp ~/.config/autostart/max/*.desktop ~/.config/autostart/
echo "system will logoff now to take efect"
lxqt-leave --logout

}
export -f EnableFullMenuSystem
#---------------------ChoooseStartUpItems-----------------------
ChoooseStartUpItems()
{
lxqt-config-session
}
export -f ChoooseStartUpItems
#---------------------CorrectConkyNetworkSpeedIndicator-----------------------
#-------------------------------------------------------------------
CorrectConkyNetworkSpeedIndicator()
{
networkname="$(printf '%s\n' /sys/class/net/*/wireless | awk -F'/' '{ print $5 }')"
echo "changing network name in all conky files one by one ${networkname}"
cd ~/.conky/4and2coreblue/
#cp conkyrc2core conkyrc2coreOld
sed -i "s/wlan0/${networkname}/g" "conkyrc2core"

cd ~/.conky/conky_light_4core_work/
#cp black blackold
sed -i "s/wlan0/${networkname}/g" "black"
#cp white whiteold
sed -i "s/wlan0/${networkname}/g" "white"

cd ~/.conky/ConkySeamod/
#cp conky_seamod conky_seamodOld
sed -i "s/wlan0/${networkname}/g" "conky_seamod"

cd ~/.conky/GreenAppleDesktop/
#cp conky_seamod conky_seamodOld
sed -i "s/wlan0/${networkname}/g" "conky_seamod"

cd ~/.conky/Metropolis/
#cp rings.lua rings.luaOld
sed -i "s/wlan0/${networkname}/g" "rings.lua"

cd ~/.conky/PakOS-Lua/
#cp conkyrc conkyrcOld
sed -i "s/wlan0/${networkname}/g" "conkyrc"

cd ~/.conky/PakOS1/
#cp Mask MaskOld
sed -i "s/wlan0/${networkname}/g" "Mask"

cd ~/.conky/practico/
#cp Práctico_Conky Práctico_ConkyOld
sed -i "s/wlan0/${networkname}/g" "Práctico_Conky"
#cp Práctico_Orange Práctico_OrangeOld
sed -i "s/wlan0/${networkname}/g" "Práctico_Orange"
#cp Práctico_Red Práctico_RedOld
sed -i "s/wlan0/${networkname}/g" "Práctico_Red"
#cp Práctico_Yellow Práctico_YellowOld
sed -i "s/wlan0/${networkname}/g" "Práctico_Yellow"

cd ~/.conky/Red_Smooth_Rings/
#cp Smooth_Gold Smooth_GoldOld
sed -i "s/wlan0/${networkname}/g" "Smooth_Gold"

cd ~/.conky/Smooth_Rings/
#cp Smooth_blue Smooth_blueOld
sed -i "s/wlan0/${networkname}/g" "Smooth_blue"

cd ~/.conky/TeejeeTech/
#cp NetworkPanel NetworkPanelOld
sed -i "s/wlan0/${networkname}/g" "NetworkPanel"
conky-manager &
echo "All Done!!!"
}
export -f CorrectConkyNetworkSpeedIndicator
#---------------------AutoCorrectGrubOSBootName-----------------------
AutoCorrectGrubOSBootName()
{
cd /etc/default
#pkexec cp grub grubold   #pkexec does not get the job done!!!
sudo  cp grub grubold
sudo sed -i 's/'Debian'/'PakOS'/g' grub
sudo update-grub
}
export -f AutoCorrectGrubOSBootName
#----------------------------------------------------------------------------
1stBootOptions()
{
#https://unix.stackexchange.com/questions/471434/how-to-tell-if-a-system-is-running-as-a-live-usb-from-bash
full_fs=$(df ~ | tail -1 | awk '{print $1;}')  # /dev/sda1
fs=$(basename $full_fs)                        # sda1
if grep -q "$fs" /proc/partitions; then
  echo "regular linux install. NOT a live OS, Corecting PakOS Grub Name, will run Update grub now"
  AutoCorrectGrubOSBootName
else
  echo "is a live OS running from RAM"

fi

yad --form --width=381 --text="Choose Your Option:" \
--field="Enable Light Weight Menu(Low Memory Lxqt Menu)!/usr/share/icons/PakOS_Icons/lxqt.png":fbtn "bash -c EnableLightWeightMenu" \
--field=" Enable Full Menu System(Mid Weight XFCE Menu)!/usr/share/icons/PakOS_Icons/xfce.png":fbtn "bash -c EnableFullMenuSystem" \
--field="       Chooose Start Up Items(Expert Use Only)!/usr/share/icons/PakOS_Icons/startupitems.png":fbtn "bash -c ChoooseStartUpItems" \
--field="         Correct Conky Network Speed Indicator!/usr/share/icons/PakOS_Icons/conky.png":fbtn "bash -c CorrectConkyNetworkSpeedIndicator" \
--field="                Auto Correct Grub OS Boot Name!/usr/share/icons/PakOS_Icons/grub.png":fbtn "bash -c AutoCorrectGrubOSBootName" \
--button=gtk-cancel:1
}
export -f 1stBootOptions
#################################################################

mainmenuOld () {
# You must place file "Welcome.txt" in same folder of this script.
FILE=`dirname $0`/Welcome.txt

zenity --text-info --width 700 --height 600\
       --title="Welcome to PakOS" \
       --filename=$FILE \
       #--checkbox="I read and accept the terms."


case $? in
    0)
        echo "1"
	# next step
	;;
    1)
        echo "0"
	;;
    -1)
        echo "-1"
	;;
esac

while true
do
ans=$(zenity --list --width 481 --height 381\
  	--title="PakOS Hub" \
  	--column="Ser" --column="Please Select an Option"  \
		1  "Update and Upgrade"\
		2  "Install Value Added Softwares (Experimental)"\
		3  "Smartphone (Work in Porgress)"\
		4  "Eye Candy (Work In Progress)"\
		5  "Advance Settings/Developer Tools"\
		6  "PakOS Dedication/Links/Vote"\
		7  "Enable Internet In Pakistan"\
		8  "Exit");
case $ans in
 1) UpgradeandUpdate;;
 2) InstallValueAddedSoftware;;
 3) Smartphone;;
 4) EyeCandy;;
 5) AdvanceDeveloperTools;;
 6) PakOSLinksVote;;
 7) EnableInternetInPakistan;;
 8) exit;;
esac
done
}


export -f UpgradeandUpdate InstallValueAddedSoftware EyeCandy AdvanceDeveloperTools PakOSLinksVote EnableInternetInPakistan ServicesManagement ChooseFastestUpdateMirror remasterPakOSISO InstallFirefoxQuantumBrowser InstallChromeBrowser InstallTORBrowser InstallCrossoverLinux InstallWineandPlayonLinux InstallWineandPlayonLinux InstallWPSOffice2019 InstallVirtualBox InstallGoogleEarth InstallRamBox InstallUbuntuSnapStore InstallKDEDiscoverStore InstallBalenaEtcherUSBWriter Gaming AtomDevelopmentEnvironment InstallNVidiaDrivers InstallSteam InstallGnomeGamingBundle InstallKDEGamesBundle InstallOperaBrowser InstallFranz InstallZoom PakOSonSourceForge PakOSonDistroWatch PakOSonDebainDerivativesCensus PakOSonLinuxWeeklyNews PakOSDedications SecurityOptions UpdateAntiVirus BrowserSecurityAddons ManageInternetFirewall WebApplicationFirewall USBGuard EncryptedStorage FaceBookContainer DuckDuckGoPrivacyEssentials uBlockOrigin NoScriptSecuritySuite AvastOnlineSecurity PrivacyBadger CookieAutoDelete Disconnect LynisSecurityAudit 1stBootOptions
##################################################################

case $1 in
 0) mainmenu;;
 1) UpgradeandUpdate;;
 InstallValueAddedSoftware) InstallValueAddedSoftware;;
 3) EyeCandy;;
 4) AdvanceDeveloperTools;;
 5) PakOSLinksVote;;
 6) EnableInternetInPakistan;;
 ChooseFastestUpdateMirror) ChooseFastestUpdateMirror;;
 ServicesManagement) ServicesManagement;;
 remasterPakOSISO) remasterPakOSISO;;
 Security) SecurityOptions;;
 1stBoot) 1stBootOptions;;
 conkyNetworkCorrection) CorrectConkyNetworkSpeedIndicator;;
 ffinstall) InstallFirefoxQuantumBrowser;;
esac



##################################################################

# Disclaimer:
#
# THIS SOFTWARE IS PROVIDED BY SUBHANIMINHAS “AS IS” AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL SUBHANIMINHAS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
# IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
