# Probe Song Request
A collection of scripts that work in unison to play a song upon detecting a probe request from a recognized mac address.

## scan-probing<span>.sh</span>
scan-probing<span>.sh</span> is a systemd service that runs on a Kali Linux machine. Using wireshark it detects when a mac address it recognizes is making probe requests, when it detects something it will send a GET request to a node server

## node
The node server will check for GET requests from scan-probing<span>.sh</span>, then it will call the play-song.ps1 script with an argument specifying which song to play.

## play-song.ps1
play-song.ps1 is a powershell script that will be invoked by the node server. It's role is to first check if it is within the specified time to play music, and if it is then it will play a little song. Should be noted that the script does not function properly without mpg123 installed to actually play the mp3 files.

## Prerequisites
Ensure you have the following installed:

* [Chocolatey](https://www.chocolatey.com/) Chocolatey is used to get dependencies.
* [Node.js](https://nodejs.org/en/) Node is used to run the express webserver.
* [mpg123](https://community.chocolatey.org/packages/mpg123/1.24.0) The musicplayer we use to play songs from powershell.

In the git repo there is a install script to install everything needed.

## TODO
[ ] make choco -y
[ ] npm i .


## Installation
```shell
$ git clone https://github.com/hhhhhhhh1233/probe-song-request && cd probe-song-request
# If you don't have all prerequisites installed run
$ ./setup.ps1
#---------------#
$ npm install    #Install npm dependencies.
$ node ./index.js #Starts the webserver
```
