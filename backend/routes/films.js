const express = require("express");
const router = express.Router();
const FilmsController = require("../controllers/films_controllers");
const filmsValidator = require("../validators/films_validators");

router.get("/", FilmsController.findAll);

router.post("/", filmsValidator.createFilmValidator, FilmsController.create);

router.get(
  "/:id([0-9]+)",
  filmsValidator.findByIdValidator,
  FilmsController.findById
);

module.exports = router;
