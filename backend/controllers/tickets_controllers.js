const prisma = require("../config/prisma_db");
const { validationResult } = require("express-validator");

const TicketsController = {
  findAll: async (req, res) => {
    try {
      const tickets = await prisma.tickets.findMany({
        orderBy: {
          id: "asc",
        },
      });
      res.json(tickets);
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
      const ticket = await prisma.tickets.findUnique({
        where: {
          id: Number.parseInt(id),
        },
        include: {
          voorstelling: {
            include: {
              film: {
                include: {
                  genre: true,
                  cast: true,
                },
              },
            },
          },
        },
      });
      if (ticket) {
        res.status(200).json(ticket);
      } else {
        res.status(404).send("Ticket niet gevonden");
      }
    } catch (error) {
      res.status(500).send("Er is een fout opgetreden");
    }
  },
  findByUserId: async (req, res) => {
    const validationErrors = validationResult(req);

    if (!validationErrors.isEmpty()) {
      return res.status(500).json(validationErrors.array());
    }

    const userId = req.params.userId;

    try {
      const ticket = await prisma.tickets.findMany({
        where: {
          gebruikersId: Number.parseInt(userId),
        },
        include: {
          voorstelling: {
            include: {
              film: true,
            },
          },
        },
      });

      if (ticket) {
        res.status(200).json(ticket);
      } else {
        res.status(404).send("Ticket niet gevonden");
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

    const newTicket = req.body;
    const date = new Date(); //.toJSON();
    const amountTickets = newTicket.zitplaatsen.split(", ").length;
    const totalPrice = Number.parseFloat(amountTickets * 11);

    try {
      const ticket = await prisma.tickets.create({
        data: {
          voorstellingenId: Number.parseInt(newTicket.voorstellingenId),
          gebruikersId: Number.parseInt(newTicket.gebruikersId),
          zitplaatsen: newTicket.zitplaatsen,
          totalePrijs: totalPrice,
          aankoopdatum: date,
        },
      });

      res.status(201).json(ticket);
    } catch (error) {
      res
        .status(500)
        .send("Er is een fout gebeurd bij het aanmaken van een ticket.");
    }
  },
};

module.exports = TicketsController;
