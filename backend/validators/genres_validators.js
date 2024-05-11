const { body, param } = require("express-validator");

const genresValidator = {
  createGenreValidator: [
    body("naam").trim().notEmpty().withMessage("Naam mag niet leeg zijn."),
  ],
  findByIdValidator: [
    param("id").isNumeric().withMessage("Moet nummerieke waarde zijn."),
  ],
};

module.exports = genresValidator;
