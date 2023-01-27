const mongoose = require("mongoose");
const commoditySchema = new mongoose.Schema(
  {
    comodityName:{type:String,required:true},
    volume:{type:Number,required:true},
    category:{type:String,required:true},
  },
  { timestamps: true }
);
const Commodity = mongoose.model("Commodity", commoditySchema);
module.exports = Commodity;
