const router = require("express").Router();
const jwt = require("jsonwebtoken");
const CryptoJS = require("crypto-js");
const{ register,country} = require("../Controllers/register");
const login = require("../Controllers/login");
const Otp = require("../Models/Otp.js");
const User = require("../Models/User.js");
const verifytoken = require("../Controllers/verifyToken");
const otpgenerator = require("otp-generator");
const verifyemail = require("../Controllers/verifyEmail");
//REGISTER
router.post("/register",register);
//Add Country 
router.put("/:id/addCountry",country);
//LOGIN
router.post("/login",login);
//Verification through jwt
router.get("/verifytoken",verifytoken);
//verification email
router.post("/register/verify/email", verifyemail);
//phone number verification
// const accountSID = " ";
// const authToken = " ";

// router.post("/sendOTP", async (req, res) => {
//   try {
//     const { number } = req.body.number;
//     const user = await User.findOne({ number: number });
//     if (user) {
//       res.status(400).json("User already exist");
//     } else {
//       const OTP = otpgenerator.generate(6, {
//         digits: true,
//         alphabet: false,
//         upperCase: false,
//         specialChars: false,
//       });

//       client.messages
//         .create({
//           body: `Your One Time Password is ${OTP}`,
//           from: twilioNum,
//           to: number,
//         })
//         .then((messages) => console.log(messages))
//         .catch((err) => console.error(err));

//       const number = req.body.number;
//       const otp = new Otp({ number: number, Otp: OTP });
//       const salt = await bcrypt.genSalt(10);
//       otp.Otp = await bcrypt.hash(otp.Otp, salt);
//       await otp.save();
//       return res.status(200).json("Otp has been sent succesfully!");
//     }
//   } catch (err) {
//     res.status(500).json(err);
//   }
// });

// router.post("/verifyOTP", async (req, res) => {
//   try {
//     const { number } = req.body.number;
//     const otpHolder = await Otp.find({
//       number: number,
//     });
//     if (otpHolder.length === 0) {
//       res.status(400).json("You are using an expired OTP!");
//     } else {
//       const OtpFound = otpHolder[otpHolder.length - 1];
//       const validUser = await bcrypt.compare(req.body.Otp, OtpFound.Otp);
//       if (OtpFound.number === req.body.number && validUser) {
//         const newUser = new User(_.pick(req.body, ["number"]));

//         const token = jwt.sign(
//           {
//             _id: this._id,
//             number: this.number,
//           },
//           process.env.JWTKEY,
//           { expiresIn: "1d" }
//         );

//         const result = await user.save();
//         res.status(200).json({
//           message: "Number Verified!!",
//           token: token,
//           data: result,
//         });
//       } else {
//         res.status(400).json("Wrong OTP!");
//       }
//     }
//   } catch (err) {
//     res.status(500).json(err);
//   }
// });
router.get("/forget",async(req,res)=>{
  const user=await User.findOneAndUpdate({email:req.body.email},{$set:{password:req.body.password}});
  if(!user)return res.status(404).json("No such user found!");
  return res.status(200).json("Password Updated!");
})
module.exports = router;
