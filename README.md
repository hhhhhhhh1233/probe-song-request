# Probe Song Request
A collection of scripts that work in unison to play a song upon detecting a probe request from a recognized mac address.

## scan-probing<span>.sh</span>
scan-probing<span>.sh</span> is a systemd service that runs on a Kali Linux machine. Using wireshark it detects when a mac address it recognizes is making probe requests, when it detects something it will send a GET request to a node server

## node
The node server will check for GET requests from scan-probing<span>.sh</span>, then it will call the play-song.ps1 script with an argument specifying which song to play.

## play-song.ps1
play-song.ps1 is a powershell script that will be invoked by the node server. It's role is to first check if it is within the specified time to play music, and if it is then it will play a little song. Should be noted that the script does not function properly without mpg123 installed to actually play the mp3 files.
