const express = require('express');

const app = express();

app.get('/', (_, res) => {
    console.log("Someone visited your website!");
    res.send('<h1>This is demo application!</h1>');
    }
);

app.listen(3000, () => {
    console.log("Application has started on port 3000\nhttp://localhost:3000/")
})
