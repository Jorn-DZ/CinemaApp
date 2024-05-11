require("dotenv").config();

const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
const cors = require("cors");

const indexRouter = require("./routes/index");
const genresRouter = require("./routes/genres");
const castRouter = require("./routes/cast");
const filmsRouter = require("./routes/films");
const ticketsRouter = require("./routes/tickets");
const usersRouter = require("./routes/users");
const voorstellingenRouter = require("./routes/voorstellingen");
const zalenRouter = require("./routes/zalen");

const app = express();

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

const corsOptions = {
  origin: "http://localhost:5173",
  optionsSuccessStatus: 200,
  methods: "GET, PUT, POST, DELETE, PATCH",
  allowedHeaders:
    "Content-Type, Authorization, Origin, X-Requested-With, Accept",
  credentials: true,
};

app.use(cors(corsOptions));

app.use("/", indexRouter);
app.use("/genres", genresRouter);
app.use("/cast", castRouter);
app.use("/film", filmsRouter);
app.use("/tickets", ticketsRouter);
app.use("/users", usersRouter);
app.use("/voorstellingen", voorstellingenRouter);
app.use("/zalen", zalenRouter);

app.all("*", (req, res) => {
  res.status(404).send("Mijn eigen 404 response.");
});

app.listen(4200);

module.exports = app;
