const express = require('express')
const app = express()
const port = 3000
var spawn = require("child_process").spawn,child;

app.get('/tage', async (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_tage");

child = spawn("powershell.exe",["play-song.ps1 tage"]);
await child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input

})

app.get('/tim', async (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_tim");

child = spawn("powershell.exe",["play-song.ps1 tim"]);
await child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input
})

app.get('/mikke', async (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_mikke");

child = spawn("powershell.exe",["play-song.ps1 mikke"]);
await child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
