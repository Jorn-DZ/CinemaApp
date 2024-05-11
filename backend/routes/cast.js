const express = require("express");
const router = express.Router();
const CastController = require("../controllers/cast_controllers");
const castValidator = require("../validators/cast_validators");

router.get("/", CastController.findAll);

router.post("/", castValidator.createCastValidator, CastController.create);

router.get(
  "/:id([0-9]+)",
  castValidator.findByIdValidator,
  CastController.findById
);

module.exports = router;
