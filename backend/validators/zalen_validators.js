const { body, param } = require("express-validator");

const zalenValidator = {
  createZaalValidator: [
    body("naam").trim().notEmpty().withMessage("Naam mag niet leeg zijn."),
    body("capaciteit")
      .trim()
      .isNumeric()
      .withMessage("Moet nummerieke waarde zijn.")
      .notEmpty()
      .withMessage("Capaciteit mag niet leeg zijn"),
    body("schermType")
      .trim()
      .isEmpty()
      .withMessage("Scherm type mag niet leeg zijn."),
  ],
  findByIdValidator: [
    param("id").isNumeric().withMessage("Moet nummerieke waarde zijn."),
  ],
};

module.exports = zalenValidator;
