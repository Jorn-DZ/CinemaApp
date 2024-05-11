const express = require("express");
const router = express.Router();
const ZalenController = require("../controllers/zalen_controllers");
const zalenValidator = require("../validators/zalen_validators");

router.get("/", ZalenController.findAll);

router.post("/", zalenValidator.createZaalValidator, ZalenController.create);

router.get(
  "/:id([0-9]+)",
  zalenValidator.findByIdValidator,
  ZalenController.findById
);

module.exports = router;
