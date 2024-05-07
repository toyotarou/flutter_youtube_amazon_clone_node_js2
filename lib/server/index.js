console.log('node starting!!');

const express = require('express');

const port = 3000;

const app = express();

app.get('/hello-world', (req, res) => {
//res.send("hello world");
res.json({"msg": "hello world"});
});

app.listen(port, "0.0.0.0", () => {
console.log(`connected at port ${port}`);
});
