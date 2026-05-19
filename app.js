const express = require('express');
const cors = require('cors');
const app = express();
const port = 3001;

app.use(cors());

app.get('/', (req, res) => {
res.send("<h1>minikube service- Backend Opérationnel</h1>");
});

app.get('/api/articles', (req, res) => {
  res.json([{ id: 1, nom: 'Article test' }]);
});

app.listen(port, () => {
  console.log(`Application démarrée sur le port ${port}`);
});