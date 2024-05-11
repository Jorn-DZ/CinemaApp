const express = require("express");
const router = express.Router();
const UsersController = require("../controllers/users_controllers");
const usersValidator = require("../validators/users_validators");
const prisma = require("../config/prisma_db");
const { authMiddleware } = require("../middlewares/auth_middleware");

router.get("/", authMiddleware, UsersController.findAll);

router.post("/", usersValidator.createUserValidator, UsersController.create);

router.post("/login", UsersController.login);

router.get(
  "/:id([0-9]+)",
  usersValidator.findByIdValidator,
  UsersController.findById
);

router.get("/verify", authMiddleware, async (req, res) => {
  const userId = req.id;
  try {
    const user = await prisma.gebruikers.findUnique({
      where: {
        id: userId,
      },
      select: {
        id: true,
        email: true,
      },
    });

    if (!user) {
      res.sendStatus(404);
    } else {
      res.status(200).json(user);
    }
  } catch (error) {
    res.sendStatus(500);
  }
});

module.exports = router;
