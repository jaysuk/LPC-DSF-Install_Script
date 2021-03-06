echo "-----This will install the STM Version of DSF-----"
echo "-----Update and upgrade the PI-----"
cd ~
sudo apt-mark hold \
    duetsoftwareframework \
    duetcontrolserver \
    duetruntime \
    duetsd \
    duetsoftwareframework \
    duettools \
    duetwebcontrol \
    duetwebserver \
    reprapfirmware
sudo apt-get -q update && sudo apt-get -y upgrade
echo "-----Upgrade and Update finished-----"
echo "-----Swichting to the unstable branch-----"
wget -q https://pkg.duet3d.com/duet3d.gpg
wget -q https://pkg.duet3d.com/duet3d-unstable.list
sudo mv duet3d.gpg /etc/apt/trusted.gpg.d/
sudo mv duet3d-unstable.list /etc/apt/sources.list.d/duet3d-unstable.list
sudo chown root:root /etc/apt/trusted.gpg.d/duet3d.gpg
sudo chown root:root /etc/apt/sources.list.d/duet3d-unstable.list
sudo rm /etc/apt/sources.list.d/duet3d.list
echo "-----Switching finished-----"
sudo apt -q update 
sudo apt install \
	duetsoftwareframework=3.2.0-beta1+1 \
	duetcontrolserver=3.2.0-beta1+1 \
	duetruntime=3.2.0-beta1+1 \
	duetsd=1.0.7 \
	duettools=3.2.0-beta1+1 \
	duetwebcontrol=3.2.0-beta1+2 \
	duetwebserver=3.2.0-beta1 \
	reprapfirmware=3.2.0-beta1+1-1 \
	--allow-downgrades