const Warehouse=require("../Models/Warehouse");
const warehouse=async({params},res)=>{
      const businessName=req.body.businessName;
      const country=req.body.country;
      const newWarehouse=new Warehouse({
        warehouseId:businessName+country,
        country:country,
        commodity:req.body.commodity,
        availableCapacity:req.body.availableCapacity
      });
      try {
        warehouses=await newWarehouse.save();
        res.status(201).json(warehouses);
      } catch (error) {
        res.status(500).json({error:error.message});
      }
}
module.exports=warehouse