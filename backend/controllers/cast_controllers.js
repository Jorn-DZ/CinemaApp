const prisma = require("../config/prisma_db");
const { validationResult } = require("express-validator");

const CastController = {
  findAll: async (req, res) => {
    try {
      const cast = await prisma.cast.findMany({
        orderBy: {
          achternaam: "asc",
        },
      });
      res.json(cast);
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
      const cast = await prisma.cast.findUnique({
        where: {
          id: Number.parseInt(id),
        },
      });

      if (cast) {
        res.status(200).json(cast);
      } else {
        res.status(404).send("Cast niet gevonden");
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

    const newCast = req.body;
    try {
      const createdCasts = [];

      for (let index = 0; index < newCast.length; index++) {
        const element = newCast[index];
        const cast = await prisma.cast.create({
          data: {
            voornaam: element.voornaam,
            achternaam: element.achternaam,
          },
        });
        createdCasts.push(cast);
      }
      res.status(201).json(createdCasts);
    } catch (error) {
      res
        .status(500)
        .send("Er is een fout gebeurd bij het aanmaken van een cast.");
    }
  },
};

module.exports = CastController;
