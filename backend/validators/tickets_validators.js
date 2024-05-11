const { body, param } = require("express-validator");

const ticketsValidator = {
  createTicketValidator: [
    body("voorstellingenId")
      .trim()
      .isNumeric()
      .withMessage("Moet nummerieke waarde zijn.")
      .notEmpty()
      .withMessage("Voorstelling id mag niet leeg zijn."),
    body("gebruikersId")
      .trim()
      .isNumeric()
      .withMessage("Moet nummerieke waarde zijn.")
      .notEmpty()
      .withMessage("Gebruikers id mag niet leeg zijn"),
    body("zitplaatsen")
      .trim()
      .notEmpty()
      .withMessage("Zitplaatsen mogen niet leeg zijn."),
  ],
  findByIdValidator: [
    param("id").isNumeric().withMessage("Moet nummerieke waarde zijn."),
  ],
};

module.exports = ticketsValidator;
