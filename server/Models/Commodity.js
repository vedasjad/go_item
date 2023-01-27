const mongoose = require("mongoose");
const commoditySchema = new mongoose.Schema(
  {
  },
  { timestamps: true }
);
const Commodity = mongoose.model("User", commoditySchema);
module.exports = Commodity;
