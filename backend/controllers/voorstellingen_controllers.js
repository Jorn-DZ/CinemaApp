const prisma = require("../config/prisma_db");
const { validationResult } = require("express-validator");

const VoorstellingenController = {
  findAll: async (req, res) => {
    try {
      const voorstellingen = await prisma.voorstellingen.findMany({
        orderBy: {
          id: "asc",
        },
      });
      res.json(voorstellingen);
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
      const voorstelling = await prisma.voorstellingen.findUnique({
        where: {
          id: Number.parseInt(id),
        },
      });

      if (voorstelling) {
        res.status(200).json(voorstelling);
      } else {
        res.status(404).send("Voorstelling niet gevonden");
      }
    } catch (error) {
      res.status(500).send("Er is een fout opgetreden");
    }
  },
  findByFilmAndTime: async (req, res) => {
    const validationErrors = validationResult(req);

    if (!validationErrors.isEmpty()) {
      return res.status(500).json(validationErrors.array());
    }

    const filmId = req.params.filmId;
    const time = req.params.time;

    try {
      const voorstelling = await prisma.voorstellingen.findMany({
        where: {
          filmsId: Number.parseInt(filmId),
          tijd: time,
        },
      });

      if (voorstelling) {
        res.status(200).json(voorstelling);
      } else {
        res.status(404).send("Voorstelling niet gevonden");
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

    const newVoorstelling = req.body;

    try {
      const createdVoorstellingen = [];

      for (let index = 0; index < newVoorstelling.length; index++) {
        const element = newVoorstelling[index];

        const voorstelling = await prisma.voorstellingen.create({
          data: {
            filmsId: element.filmsId,
            datum: element.datum,
            tijd: element.tijd,
            zalenId: element.zalenId,
          },
        });
        createdVoorstellingen.push(voorstelling);
      }

      res.status(201).json(createdVoorstellingen);
    } catch (error) {
      res
        .status(500)
        .send("Er is een fout gebeurd bij het aanmaken van een voorstelling.");
    }
  },
};

module.exports = VoorstellingenController;
