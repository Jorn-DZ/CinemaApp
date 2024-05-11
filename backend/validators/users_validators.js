const { body, param } = require("express-validator");

const usersValidator = {
  createUserValidator: [
    body("voornaam")
      .trim()
      .notEmpty()
      .withMessage("Voornaam mag niet leeg zijn."),
    body("achternaam")
      .trim()
      .notEmpty()
      .withMessage("Achternaam mag niet leeg zijn"),
    body("email")
      .normalizeEmail()
      .isEmail()
      .withMessage("Geen geldig emailadres"),
    body("wachtwoord")
      .isLength({ min: 6, max: 30 })
      .withMessage(
        "Wachtwoord moet uit minstens 6 karakters en max 30 karakters bestaan."
      ),
  ],
  findByIdValidator: [
    param("id").isNumeric().withMessage("Moet nummerieke waarde zijn."),
  ],
};

module.exports = usersValidator;
