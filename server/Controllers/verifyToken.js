const jwt=require("jsonwebtoken");
const User = require("../Models/User.js");
const verifytoken=async (req, res) => {
    try {
      const token = req.header("auth-token");
      if (!token) return res.json(false);
      const verified = jwt.verify(token, process.env.SECRET_KEY,{algorithm:'HS256'});
      if (!verified) return res.json(false);
      const user = await User.findById(verified.payload.id);
      if (!user) return res.json(false);
      res.json(true);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  };
  module.exports=verifytoken;