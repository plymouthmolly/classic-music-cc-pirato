#!/bin/bash
# expect something may go wrong as this code was never tried before .. its likely it will error at some point ..
# dont try to pretend more ethical then me!
# do not assume hero role!
# learn to read with understanding of the text you'r readin'
# you'r leeken data ... shupt man !!!!!
# you no wat a meean? shupt ya trap!!

if [ `which fluidsynth` -eq 1 ]; then
	sudo apt-get install fluidsynth
fi
# bueno arbaht, bueno trabajo
grabbeble_assets=(
http://www.piano-midi.de/zip/albeniz.zip
http://www.piano-midi.de/zip/bach.zip
http://www.piano-midi.de/zip/balakir.zip
http://www.piano-midi.de/zip/beeth.zip
http://www.piano-midi.de/zip/borodin.zip
http://www.piano-midi.de/zip/brahms.zip
http://www.piano-midi.de/zip/burgm.zip
http://www.piano-midi.de/zip/chopin.zip
http://www.piano-midi.de/zip/debussy.zip
http://www.piano-midi.de/zip/granados.zip
http://www.piano-midi.de/zip/grieg.zip
http://www.piano-midi.de/zip/haydn.zip
http://www.piano-midi.de/zip/liszt.zip
http://www.piano-midi.de/zip/mendelssohn.zip
http://www.piano-midi.de/zip/mozart.zip
http://www.piano-midi.de/zip/muss.zip
http://www.piano-midi.de/zip/schubert.zip
http://www.piano-midi.de/zip/schumann.zip
http://www.piano-midi.de/zip/tschai.zip
)
# this is not a salted at all ... just a poc
sleep_time=$(( $RANDOM / 10000 + 1))
mistash=~/Music/classical_composers
mkdir $mistash
for asset in ${grabbeble_assets[*]}; do
	sleep $sleep_time
	composer=`echo $asset|sed 's|http\:\/\/www\.piano\-midi\.de\/zip\/||'|sed 's|\.zip||'`
	echo ".. doin' $composer"
	# fold her classically .. jack
	folder=$mistash/$composer
	mkdir $folder
	cd $folder
	wget -c "$asset"
	unzip ./$composer.zip
	rm ./$composer.zip
done

echo "scale=10000000; 4*a(1)" | bc -l
# curse this ship it was ...
for chopin in $mistash/chopin/*.mid; do echo $chopin; fluidsynth -i --audio-driver=alsa -o audio.alsa.device=pulse /usr/share/sounds/sf2/FluidR3_GM.sf2 $chopin; done

