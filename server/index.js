//jshint esversion:6
const express = require("express");
const path =require("path");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const authRoute = require("./routes/authRoute");
const cityRoutes = require("./routes/cityRoutes");
const warehouseRoute = require("./routes/warehouseRoute");
mongoose.set("strictQuery", true);
require("dotenv").config();
const app = express();
app.use(express.json());
const PORT = 3000 || process.env.PORT;
mongoose
  .connect(process.env.DATABASE_KEY, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log("Database Connected"))
  .catch((err) => console.log(err));
app.set("view engine", "ejs");
app.use(express.static(path.join(__dirname, "public")));
app.use("/api/auth", authRoute);
app.use("/api/country", cityRoutes);
app.use("/api/business",warehouseRoute);
app.listen(PORT, () => {
  console.log(`Server running at ${PORT}`);
});
