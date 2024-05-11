const { body, param } = require("express-validator");

const filmsValidator = {
  createFilmValidator: [
    body("titel")
      .ltrim()
      .rtrim()
      .notEmpty()
      .withMessage("Title mag niet leeg zijn."),
    body("genre").trim().isEmpty().withMessage("Genres mogen niet leeg zijn."),
    body("speelDuur")
      .trim()
      .notEmpty()
      .withMessage("Speelduur mag niet leeg zijn.")
      .isNumeric()
      .withMessage("Speelduur moet een nummerieke waarde zijn."),
    body("beschrijving")
      .ltrim()
      .rtrim()
      .notEmpty()
      .withMessage("Beschrijving mag niet leeg zijn."),
    body("releaseDatum")
      .isDate()
      .withMessage("Moet datum zijn")
      .isEmpty()
      .withMessage("Datum mag niet leeg zijn."),
    body("cast").trim().isEmpty().withMessage("Cast mag niet leeg zijn."),
    body("thumbnail")
      .trim()
      .isEmpty()
      .withMessage("Thumbnail mag niet leeg zijn."),
  ],
  findByIdValidator: [
    param("id").isNumeric().withMessage("Moet nummerieke waarde zijn."),
  ],
};

module.exports = filmsValidator;
