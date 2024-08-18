const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Good Morning, This Website is created by Ashish');
});

app.listen(port, () => {
  console.log(`Store app listening at http://localhost:${port}`);
});
