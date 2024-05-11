const express = require("express");
const router = express.Router();
const VoorstellingenController = require("../controllers/voorstellingen_controllers");
const voorstellingenValidator = require("../validators/voorstellingen_validators");

router.get("/", VoorstellingenController.findAll);

router.post(
  "/",
  voorstellingenValidator.createVoorstellingValidator,
  VoorstellingenController.create
);

router.get(
  "/:filmId([0-9]+)/:time",
  VoorstellingenController.findByFilmAndTime
);

router.get(
  "/:id([0-9]+)",
  voorstellingenValidator.findByIdValidator,
  VoorstellingenController.findById
);

module.exports = router;
