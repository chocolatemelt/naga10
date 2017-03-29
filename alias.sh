#!/usr/bin/sh
#hacky way to update fonts.alias

cp /usr/share/fonts/misc/fonts.alias /usr/share/fonts/misc/fonts.alias.old

new=false

while read f; do
	if ! grep -q -F "$f" /usr/share/fonts/misc/fonts.alias ; then
		if ! $new ; then
			echo "" >> /usr/share/fonts/misc/fonts.alias
			new=true
		fi
		echo "$f" >> /usr/share/fonts/misc/fonts.alias
	fi
done < fonts.alias
