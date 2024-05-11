const { body, param } = require("express-validator");

const castValidator = {
  createCastValidator: [
    body("voornaam")
      .trim()
      .notEmpty()
      .withMessage("Voornaam mag niet leeg zijn."),
    body("achternaam")
      .trim()
      .notEmpty()
      .withMessage("Achternaam mag niet leeg zijn"),
  ],
  findByIdValidator: [
    param("id").isNumeric().withMessage("Moet nummerieke waarde zijn."),
  ],
};

module.exports = castValidator;
