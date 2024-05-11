const jwt = require("jsonwebtoken");

const authMiddleware = (req, res, next) => {
  const cookie = req.cookies;
  console.log(cookie);
  const token = cookie?.token;

  // Als er geen token inzit of geen cookie is -> Fout terugsturen
  if (!token) {
    return res.sendStatus(401);
  }

  jwt.verify(token, process.env.JWT_SECRET, (err, payload) => {
    if (err) {
      return res.status(400).send("Geen geldige token.");
    }

    req.id = payload.userId;
    next();
  });
};

module.exports = {
  authMiddleware: authMiddleware,
};
