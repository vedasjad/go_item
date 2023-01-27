const User = require("../Models/User.js");
const CryptoJS = require("crypto-js");
const jwt = require("jsonwebtoken");
const login=async (req, res) => {
    try {
      const user = await User.findOne({ email: req.body.email });
      console.log(user);
      if(!user) return res.status(400).json("Email not found!");
      const bytes = CryptoJS.AES.decrypt(user.password, process.env.SECRET_KEY);
      const originalPassword = bytes.toString(CryptoJS.enc.Utf8);
      if(originalPassword !== req.body.password) 
        return res.status(400).json("Wrong Password");
      var payload = {
        name: user.name,
        email: user.email,
        phone: user.phone,
        isBusiness: user.isBusiness,
        id: user.id,
      };
      const accessToken = jwt.sign(
        { payload},
        process.env.SECRET_KEY,
        { algorithm:'HS256',expiresIn: "50d" }
      );
      const { password, ...info } = user._doc;
      res.status(201).json({ ...info, accessToken });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  };
  module.exports=login