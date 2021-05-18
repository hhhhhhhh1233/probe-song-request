const express = require('express')
const app = express()
const port = 3000
var spawn = require("child_process").spawn,child;

//Copy paste this app.get to add more people.
app.get('/name', (req, res) => {
  res.send(`Works for name`);
  console.log(`Works for name`);

child = spawn("powershell.exe",["Path_to_Play-song.ps1 name"]); //Replace with path and name of person in mac list.
child.stdout.on("data",function(data){
    console.log("Powershell Data: " + data);
});
child.stdin.end(); //end input

})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
