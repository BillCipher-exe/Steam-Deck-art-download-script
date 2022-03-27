#!/usr/bin/env bash
user_id= <replace with own user_id!>
grid_path=/home/deck/Desktop/Steam/userdata/$user_id/config/grid/

echo source Steam App ID:
read
id=$REPLY
echo Target App ID of non steam Game (get it via Proton tricks):
read
id_ziel=$REPLY

curl https://steamcdn-a.akamaihd.net/steam/apps/$id/library_600x900_2x.jpg --output ${id}p.jpg

size_box=$(wc -c ${id}p.jpg | awk '{print $1}')
if [ $size_box -lt 1000 ]
then
	echo ERROR: No Boxart found for ID= &id
	rm ${id}p.jpg
else
	cp ${id}p.jpg ${grid_path}${id_ziel}p.jpg
fi

curl https://steamcdn-a.akamaihd.net/steam/apps/$id/header.jpg --output ${id}.jpg

size_box=$(wc -c ${id}.jpg | awk '{print $1}')
if [ $size_box -lt 1000 ]
then
	echo ERROR: No Header found for ID= &id
	rm ${id}.jpg
else
	cp ${id}.jpg ${grid_path}${id_ziel}.jpg
fi

curl https://steamcdn-a.akamaihd.net/steam/apps/$id/library_hero.jpg --output ${id}_hero.jpg

size_box=$(wc -c ${id}_hero.jpg | awk '{print $1}')
if [ $size_box -lt 1000 ]
then
	echo ERROR: No hero banner found for ID= &id
	rm ${id}_hero.jpg
else
	cp ${id}_hero.jpg ${grid_path}${id_ziel}_hero.jpg
fi

curl https://steamcdn-a.akamaihd.net/steam/apps/$id/logo.png --output ${id}_logo.png

size_box=$(wc -c ${id}_logo.png | awk '{print $1}')
if [ $size_box -lt 1000 ]
then
	echo ERROR: No logo found for ID= &id
	rm ${id}_logo.png
else
	cp ${id}_logo.png ${grid_path}${id_ziel}_logo.png
fi




