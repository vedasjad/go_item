const User = require("../Models/User.js");
const CryptoJS = require("crypto-js");
const register=async (req, res) => {
    const otp = Math.floor(Math.floor(100000 + Math.random() * 900000));
   const existingUser = await User.findOne({ email: req.body.email });
   if (existingUser) {
     return res.status(400).json("User already exists!");
   }
   const newUser = new User({
     name: req.body.name,
     email: req.body.email,
     phone:req.body.phone,
     otp:otp,
     role:req.body.role,
     password: CryptoJS.AES.encrypt(
       req.body.password,
       process.env.SECRET_KEY
     ).toString(),
     isBusiness: req.body.isBusiness,
     country:req.body.country
   });
   try {
     const user = await newUser.save();
     const { password, ...info } = user._doc;
     // emailer(user.email,user.otp);
     res.status(201).json(info);
   } catch (err) {
     res.status(500).json({ error: err.message });
   }
 }
 module.exports=register