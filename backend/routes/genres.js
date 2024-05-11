const express = require("express");
const router = express.Router();
const GenresController = require("../controllers/genres_controllers");
const genresValidator = require("../validators/genres_validators");

router.get("/", GenresController.findAll);

router.post("/", genresValidator.createGenreValidator, GenresController.create);

router.get(
  "/:id([0-9]+)",
  genresValidator.findByIdValidator,
  GenresController.findById
);

module.exports = router;
