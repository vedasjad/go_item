const mongoose = require("mongoose");
const warehouseSchema = new mongoose.Schema(
  {
    warehouseId: { type: String, required: true }, //Bussiness name+country
    country: { type: String, required: true },
    capacity: { type: Number, required: true },
    commodity: [
      {
        commodityName: { type: String },
        quantity: { type: Number },
      },
    ],
    availableCapacity: { type: Number, required: true },
  },
  { timestamps: true }
);
const warehouse = mongoose.model("warehouse", warehouseSchema);
module.exports = warehouse;
