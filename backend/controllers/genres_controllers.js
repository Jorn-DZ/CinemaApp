const prisma = require("../config/prisma_db");
const { validationResult } = require("express-validator");

const GenresController = {
  findAll: async (req, res) => {
    try {
      const genres = await prisma.genres.findMany({
        orderBy: {
          naam: "asc",
        },
      });
      res.json(genres);
    } catch (error) {
      res.status(500).send("Er is een fout opgetreden.");
    }
  },
  findById: async (req, res) => {
    const validationErrors = validationResult(req);

    if (!validationErrors.isEmpty()) {
      return res.status(500).json(validationErrors.array());
    }

    const id = req.params.id;

    try {
      const genre = await prisma.genres.findUnique({
        where: {
          id: Number.parseInt(id),
        },
      });

      if (genre) {
        res.status(200).json(genre);
      } else {
        res.status(404).send("Genre niet gevonden");
      }
    } catch (error) {
      res.status(500).send("Er is een fout opgetreden");
    }
  },
  create: async (req, res) => {
    const validationErrors = validationResult(req);

    if (!validationErrors.isEmpty()) {
      return res.status(500).json(validationErrors.array());
    }

    const newGenre = req.body;

    try {
      const createdGenres = [];

      for (let index = 0; index < newGenre.length; index++) {
        const element = newGenre[index];

        const genre = await prisma.genres.create({
          data: {
            naam: element.naam,
          },
        });
        createdGenres.push(genre);
      }
      res.status(201).json(createdGenres);
    } catch (error) {
      res
        .status(500)
        .send("Er is een fout gebeurd bij het aanmaken van een genre.");
    }
  },
};

module.exports = GenresController;
