const express = require('express')
const app = express()
const port = 3000
var spawn = require("child_process").spawn,child;

app.get('/tage', (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_tage");

child = spawn("powershell.exe",["c:\\temp\\helloworld.ps1 tage"]);
child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input

})

app.get('/tim', (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_tim");

child = spawn("powershell.exe",["c:\\temp\\helloworld.ps1 tim"]);
child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input
})

app.get('/mikke', (req, res) => {
  res.send('Hello World!\n');
  console.log("worky_mikke");

child = spawn("powershell.exe",["c:\\temp\\helloworld.ps1 mikke"]);
child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
