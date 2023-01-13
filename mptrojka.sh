#!bin/sh

#clone default buildroot
git clone git://git.buildroot.net/buildroot

#copy configured config files
cp qemu_arm_versatile_mediaplayer_defconfig buildroot/configs/qemu_arm_versatile_mediaplayer_defconfig
cp mediaplayer.config buildroot/board/qemu/arm-versatile/mediaplayer.config

#make qemu aby sa vytvoril output/target priecinok kde nakopirujeme .mp3 subor aj script
#do init.d aby hned po spusteni qemu pustil mp3
cd buildroot
make qemu_arm_versatile_mediaplayer_defconfig
make

cd ..
cp S99music.sh buildroot/output/target/etc/init.d/S99music.sh
chmod 775 buildroot/output/target/etc/init.d/S99music.sh

MUSIC_DIR="buildroot/output/target/usr/share/music"
mkdir $MUSIC_DIR
cp Tourner.mp3 $MUSIC_DIR

#po zmenach je potrebny make (aspon po debug co som ja robil tak make pomohol aby qemu nasiel 
#pridane files)
cd buildroot
make

cat board/qemu/arm-versatile/readme.txt
