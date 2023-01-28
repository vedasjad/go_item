const Warehouse = require("../Models/Warehouse");
const User = require("../Models/User");
const business = require("../Models/business");
const router = require("express").Router();
router.post("/:email/:businessName/addWarehouse", async (req, res) => {
  const user = await User.findOne({ email: req.params.email });
  const country=req.body.country;
  const warehouseId = req.params.businessName + country;
  const warehouse = await Warehouse.findOne({ warehouseId: warehouseId });
  const businessName = req.params.businessName;
  const busines=await business.findOne({businessName});
  const commodity = req.body.commodity;
  const capacity = req.body.capacity;

  let availableCapacity = 0;
  commodity.forEach((e) => {
    availableCapacity = availableCapacity + e.quantity * 12;
  });

  availableCapacity = capacity - availableCapacity;
  try {
    if (user.isBusiness) {
      if (!warehouse) {
        const newWarehouse = new Warehouse({
          warehouseId: businessName + country,
          country: country,
          commodity: commodity,
          capacity: capacity,
          businessName:businessName,
          availableCapacity: availableCapacity,
        });
        warehouses = await newWarehouse.save();
        if(!busines) {
            const newBusiness=new business({
                businessName:businessName,
                countries:country
            });
            await newBusiness.save();
        }
        else{
            await business.findByIdAndUpdate({_id:busines._id},{$push:{countries:country}})
        }
        return res.status(201).json(warehouses);
      }
      return res.status(400).json("Warehouse Already EXISTS!")
    }
    return res.status(401).json("YOU ARE NOT A BUSSINESS!");
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});
module.exports = router;
