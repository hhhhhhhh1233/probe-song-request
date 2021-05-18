const express = require('express')
const app = express()
const port = 3000
var spawn = require("child_process").spawn,child;

app.get('/tage',   (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_tage");

child = spawn("powershell.exe",[" C:\\Users\\administrator\\Desktop\\probe-song-request-main\\play-song.ps1 tage"]);
  child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input

})

app.get('/tim',   (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_tim");

child = spawn("powershell.exe",[" C:\\Users\\administrator\\Desktop\\probe-song-request-main\\play-song.ps1 tim"]);
  child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input
})

app.get('/mikke',   (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_mikke");

child = spawn("powershell.exe",["C:\\Users\\administrator\\Desktop\\probe-song-request-main\\play-song.ps1 mikke"]);
  child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input
})

app.get('/linus',   (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_mikke");

child = spawn("powershell.exe",[" C:\\Users\\administrator\\Desktop\\probe-song-request-main\\play-song.ps1 linus"]);
  child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input
})

app.get('/lukas',   (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_mikke");

child = spawn("powershell.exe",[" C:\\Users\\administrator\\Desktop\\probe-song-request-main\\play-song.ps1 lukas"]);
  child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input
})

app.get('/elias',   (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_mikke");

child = spawn("powershell.exe",[" C:\\Users\\administrator\\Desktop\\probe-song-request-main\\play-song.ps1 elias"]);
  child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
