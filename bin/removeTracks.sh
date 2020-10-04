outputdir=/mnt/storage/series/Star_Wars_The_Clone_Wars
mkdir $outputdir
for var in 1 2 3 4 5 6
do
	mkdir $outputdir/Season$var
done

for entry in /mnt/storage/series/Star\ Wars\ The\ Clone\ Wars/*
do  
    newName=$(basename ${entry// /_})
    season=${newName:26:1}
    newPath=$outputdir/Season$season/$newName
    audioTrack=$(ffmpeg -i 2>&1 "$entry" | grep "(eng): Audio"| cut -c 15)
    ffmpeg -i "$entry" -map 0:0 -map 0:$audioTrack -c copy $newPath
done