const express = require("express");
const router = express.Router();
const TicketsController = require("../controllers/tickets_controllers");
const ticketsValidator = require("../validators/tickets_validators");

router.get("/", TicketsController.findAll);

router.post(
  "/",
  ticketsValidator.createTicketValidator,
  TicketsController.create
);

router.get("/:userId([0-9]+)", TicketsController.findByUserId);

router.get(
  "/:userId([0-9]+)/ticket/info/:id([0-9]+)",
  ticketsValidator.findByIdValidator,
  TicketsController.findById
);

module.exports = router;
