const { body, param } = require("express-validator");

const voorstellingenValidator = {
  createVoorstellingValidator: [
    body("filmId")
      .trim()
      .isNumeric()
      .withMessage("Moet nummerieke waarde zijn.")
      .notEmpty()
      .withMessage("Film id mag niet leeg zijn."),
    body("datum")
      .trim()
      .isDate()
      .withMessage("Moet datum zijn.")
      .notEmpty()
      .withMessage("datum mag niet leeg zijn"),
    body("tijd")
      .trim()
      .isNumeric()
      .withMessage("Moet nummerieke waarde zijn.")
      .isEmpty()
      .withMessage("Tijd mag niet leeg zijn."),
    body("zalenId")
      .trim()
      .isNumeric()
      .withMessage("Moet nummerieke waarde zijn.")
      .notEmpty()
      .withMessage("Zalen id mag niet leeg zijn."),
  ],
  findByIdValidator: [
    param("id").isNumeric().withMessage("Moet nummerieke waarde zijn."),
  ],
};

module.exports = voorstellingenValidator;
