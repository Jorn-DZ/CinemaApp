const prisma = require("../config/prisma_db");
const { validationResult } = require("express-validator");

const ZalenController = {
  findAll: async (req, res) => {
    try {
      const zalen = await prisma.zalen.findMany({
        orderBy: {
          naam: "asc",
        },
      });
      res.json(zalen);
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
      const zaal = await prisma.zalen.findUnique({
        where: {
          id: Number.parseInt(id),
        },
      });

      if (zaal) {
        res.status(200).json(zaal);
      } else {
        res.status(404).send("Zaal niet gevonden");
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

    const newZaal = req.body;

    try {
      const createdZalen = [];
      for (let index = 0; index < newZaal.length; index++) {
        const element = newZaal[index];
        const zaal = await prisma.zalen.create({
          data: {
            naam: element.naam,
            capaciteit: element.capaciteit,
            schermType: element.schermType,
            // Voorstellingen: {
            //   data: {
            //     filmsId: element.filmsId,
            //     datum: element.datum,
            //     tijd: element.tijd,
            //     zaalId: element.zaalId,
            //   },
            // },
          },
        });
        createdZalen.push(zaal);
      }
      res.status(201).json(createdZalen);
    } catch (error) {
      res
        .status(500)
        .send("Er is een fout gebeurd bij het aanmaken van een zaal.");
    }
  },
};

module.exports = ZalenController;
