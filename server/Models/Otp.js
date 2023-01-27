const mongoose = require('mongoose')

const OtpSchema = new mongoose.Schema({
    number: { 
        type:Number, 
        require:true 
    },
    Otp:{ 
        type:String, 
        require:true 
    },
    createdAt: { type: Date, default: Date.now(), index: {expires: 500}}
},
   { timestamps:true }
   );

   const Otp = mongoose.model('Otp', OtpSchema)
 module.exports=Otp;