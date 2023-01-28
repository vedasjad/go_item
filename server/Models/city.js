const mongoose = require('mongoose')

const citySchema = new mongoose.Schema({
    Countries: { 
        type:Array, 
        require:true 
    },
    
},
   { timestamps:true }
   );

   const City = mongoose.model('City', citySchema)
 module.exports=City;