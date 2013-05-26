#!/bin/sh
# Primitiver Stream-Recorder. Nimmt Streams ab einem bestimmten Zeitpunkt auf. Gut für Aufnahme von Podcast-Livestreams geeignet.
#
# Bitte anpassen: 	In recstream.sh Pfad zur recstream-helper.sh anpassen
#					Unten (1. Codezeile) E-Mail-Adresse anpassen
#
# recstream.sh und recstream-helper.sh stehen unter der MIT-Lizenz (http://opensource.org/licenses/MIT).


MAILTO="yourmail@example.com"

echo "Aufnahme gestartet.

URL:	$1
To:	$2" | mail -s "[Aufnahme gestartet] $(basename $2)" "$MAILTO"

mplayer -dumpstream $1 -dumpfile $2
echo "Aufnahme beendet.

URL:	$1
To:	$2
Size:	$(du -sh $2)" | mail -s "[Aufnahme beendet] $(basename $2)" "$MAILTO"
