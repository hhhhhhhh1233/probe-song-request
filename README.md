# Probe Song Request
A collection of scripts that work in unison to play a song upon detecting a probe request from a recognized mac address.

## scan-probing<span>.sh</span>
scan-probing<span>.sh</span> is a systemd service that runs on a Kali Linux machine. When it detects a mac address that it recognizes sending out probe requests it will send a request to a node server.

## node
The node server will check for requests from scan-probing<span>.sh</span>, then it will call the play-song.ps1 script with an argument specifying which song to play.

## play-song.ps1
play-song.ps1 is a powershell script that will be invoked by the node server. It's role is to first check if it is within the specified time to play music, and if it is then it will play a little song.
