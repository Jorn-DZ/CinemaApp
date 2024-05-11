const prisma = require("../config/prisma_db");
const { validationResult } = require("express-validator");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const UsersController = {
  findAll: async (req, res) => {
    try {
      const users = await prisma.gebruikers.findMany({
        orderBy: {
          voornaam: "asc",
        },
      });
      res.json(users);
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
      const user = await prisma.gebruikers.findUnique({
        where: {
          id: Number.parseInt(id),
        },
      });

      if (user) {
        res.status(200).json(user);
      } else {
        res.status(404).send("Gebruiker niet gevonden");
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

    const newUser = req.body;
    const hashedPassword = await bcrypt.hash(newUser.wachtwoord, 12);

    try {
      const user = await prisma.gebruikers.create({
        data: {
          voornaam: newUser.voornaam,
          achternaam: newUser.achternaam,
          email: newUser.email,
          wachtwoord: hashedPassword,
        },
      });

      res.status(201).json(user);
    } catch (error) {
      console.log(error);
      res
        .status(500)
        .send("Er is een fout gebeurd bij het aanmaken van een gebruiker.");
    }
  },
  login: async (req, res) => {
    const credentials = req.body;

    try {
      // User object uit de databank uit halen
      const user = await prisma.gebruikers.findUnique({
        where: {
          email: credentials.email,
        },
        select: {
          id: true,
          email: true,
          wachtwoord: true,
        },
      });

      if (!user) {
        return res.status(404).send("Er is geen gebruiker gevonden.");
      }

      const result = await bcrypt.compare(
        credentials.password,
        user.wachtwoord
      );

      if (result) {
        const token = jwt.sign(
          {
            isLoggedIn: true,
            userId: user.id,
            voornaam: user.voornaam,
            achternaam: user.achternaam,
            userEmail: user.email,
          },
          process.env.JWT_SECRET,
          {
            expiresIn: 5 * 60 * 1000,
          }
        );

        res.cookie("token", token, { httpOnly: true });

        //res.status(200).json(user);
        res.json({ user, token });
      } else {
        res.status(401).send("Email en/of wachtwoord is verkeerd");
      }
    } catch (error) {
      res.status(500).send("Er is een fout opgetreden.");
    }
  },
};

module.exports = UsersController;
