const prisma = require("../config/prisma_db");
const { validationResult } = require("express-validator");

const FilmsController = {
  findAll: async (req, res) => {
    try {
      const films = await prisma.films.findMany({
        orderBy: {
          id: "asc",
        },
        include: {
          genre: true,
          cast: true,
          Voorstellingen: true,
        },
      });
      res.json(films);
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
      const film = await prisma.films.findUnique({
        where: {
          id: Number.parseInt(id),
        },
      });

      if (film) {
        res.status(200).json(film);
      } else {
        res.status(404).send("Film niet gevonden");
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

    const newFilm = req.body;

    try {
      const createdFilms = [];

      for (let index = 0; index < newFilm.length; index++) {
        const element = newFilm[index];

        const film = await prisma.films.create({
          data: {
            titel: element.titel,
            genre: {
              data: {
                naam: element.genre.naam,
              },
            },
            speelDuur: element.speelDuur,
            beschrijving: element.beschrijving,
            releaseDatum: Date.parse(element.releaseDatum),
            cast: {
              data: {
                voornaam: element.cast.voornaam,
                achternaam: element.cast.achternaam,
              },
            },
            thumbnail: element.thumbnail,
          },
        });
        createdFilms.push(film);
      }

      res.status(201).json(createdFilms);
    } catch (error) {
      res
        .status(500)
        .send("Er is een fout gebeurd bij het aanmaken van een film.");
    }
  },
};

module.exports = FilmsController;
