const express = require('express');
const axios = require('axios');

const app = express();
const PORT = 3000;
const API_KEY = 'digitesuaApiaqui'; // Substitua pela sua chave de API do OpenWeatherMap

app.get('/temperatura/:cidade', async (req, res) => {
  const cidade = req.params.cidade;

  try {
    const url = `http://api.openweathermap.org/data/2.5/weather?q=${cidade}&appid=${API_KEY}&units=metric`;
    const response = await axios.get(url);
    const temperatura = response.data.main.temp;

    res.json({ cidade, temperatura });
  } catch (error) {
    console.error('Erro ao obter dados de temperatura:', error.message);
    res.status(500).json({ error: 'Erro ao obter dados de temperatura' });
  }
});

app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});
