const express = require('express');
const axios = require('axios');
const { PrismaClient } = require('@prisma/client');
const cors = require('cors')

const prisma = new PrismaClient();
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use(cors());



// Rota para a página "Lojas"
app.get('/loja', async (req, res) => {
  try {
    const lojas = await prisma.loja.findMany();
    res.json(lojas);
  } catch (error) {
    console.error('Erro ao obter dados das lojas:', error.message);
    res.status(500).json({ error: 'Erro interno do servidor' });
  }
});

// Rota para a página "Frota"
app.get('/frota', async (req, res) => {
  try {
    const frotas = await prisma.frota.findMany();
    res.json(frotas);
  } catch (error) {
    console.error('Erro ao obter dados da frota:', error.message);
    res.status(500).json({ error: 'Erro interno do servidor' });
  }
});

// Rota para a página "Loja"
app.get('/loja/:id/carros', async (req, res) => {
  const lojaId = parseInt(req.params.id);

  try {
    const carrosLoja = await prisma.carroLoja.findMany({
      where: {
        lojaId: lojaId
      },
      include: {
        carro: true
      }
    });

    // Extrai os carros da resposta do banco de dados

    const carros = carrosLoja.map(item => item.carro);

    res.json(carros);
  } catch (error) {
    console.error('Erro ao obter dados da frota:', error.message);
    res.status(500).json({ error: 'Erro interno do servidor' });
  }
});




app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
