const express = require("express");
const bcrypt = require('bcryptjs');
const mongoose = require("mongoose");
const User = require("../models/user");

const authRouter = express.Router();

const DB =
  "mongodb+srv://nova:mongo@cluster0.xsv2c.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });

    if (existingUser) {
      return res.status(400).json({
        msg: "User with this email exists !!",
      });
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);


    let user = new User({
      name,
      email,
      password : hashedPassword,
    });

    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({
      error: e.message,
    });
  }
});

module.exports = authRouter;
