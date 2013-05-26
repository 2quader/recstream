Primitiver Stream-Recorder. Nimmt Streams ab einem bestimmten Zeitpunkt auf. Gut für Aufnahme von Podcast-Livestreams geeignet.

# Einrichtung
Bitte anpassen:
* In recstream.sh Pfad zur recstream-helper.sh anpassen
* In recstream-helper.sh E-Mail-Adresse anpassen

# Benutzung
    $ ./recstream.sh 
    No arguments given.
    Usage:
        recstream.sh -s <streamurl> -f <filename> -t <time> [-d <date>]
    Example:
        recstream.sh -s http://example.org/stream.mp3 -f /home/example/out.mp3 -t 13:56 -d 15.05.2013


# Lizenz
recstream steht unter der [MIT-Lizenz](http://opensource.org/licenses/MIT).