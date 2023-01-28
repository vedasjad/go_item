const mongoose = require("mongoose");
const businessSchema = new mongoose.Schema(
  {  businessName:{type:String},
    countries:{type:Array,required:true}
  },
  { timestamps: true }
);
const business = mongoose.model("business", businessSchema);
module.exports = business;
