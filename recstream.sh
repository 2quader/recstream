#!/bin/sh
# Primitiver Stream-Recorder. Nimmt Streams ab einem bestimmten Zeitpunkt auf. Gut für Aufnahme von Podcast-Livestreams geeignet.
# Benötigt at (http://packages.qa.debian.org/a/at.html), mplayer und recstream-helper.sh (befindet sich im selben Paket wie
# diese Datei)
#
# Bitte anpassen:    Unten (letzte Zeile) Pfad zur recstream-helper.sh anpassen
#                    In recstream-helper.sh: E-Mail-Adresse anpassen
#
# recstream.sh und recstream-helper.sh stehen unter der MIT-Lizenz (http://opensource.org/licenses/MIT).

USAGE="Usage:\n\trecstream.sh -s <streamurl> -f <filename> -t <time> [-d <date>]\nExample:\n\trecstream.sh -s http://example.org/stream.mp3 -f /home/example/out.mp3 -t 13:56 -d 15.05.2013\n"

if [ ! $# -ge 1 ];
then
	printf "No arguments given.\n$USAGE" $(basename $0) >&2
	exit 2;
fi

while getopts "s:f:t:d:h" opt; do
	case $opt in
		h)
			printf "$USAGE";
		;;
		s)
			STREAMURLGIVEN=1;
			STREAMURL=${OPTARG};
		;;
		f)
			FILEPATHGIVEN=1;
			FILEPATH=${OPTARG};
		;;
		t)
			RECTIMEGIVEN=1;
			RECTIME=${OPTARG};
		;;
		d)
			RECDATEGIVEN=1;
			RECDATE=${OPTARG};
		;;
	esac
done

if [ ! "$STREAMURLGIVEN" ] || [ ! "$FILEPATHGIVEN" ] || [ ! "$RECTIMEGIVEN" ];
then
	printf "Check arguments.\n$USAGE" $(basename $0) >&2
	exit 2;
fi

if [ ! "$RECDATEGIVEN" ]
then
	RECDATE="today"
fi

printf "Stream-URL:\t$STREAMURL\n";
printf "File:\t\t$FILEPATH\n";
printf "Date:\t\t$RECDATE\n";
printf "Time:\t\t$RECTIME\n";

echo "/home/ts/bin/recstream-helper.sh '$STREAMURL' '$FILEPATH' > /dev/null 2>&1" | at "$RECTIME" "$RECDATE"
