const express = require("express")
const auth = require('../middlewares/auth')
const bcrypt = require('bcryptjs');
const authRouter = express.Router()
const User = require('../models/user')
const jwt = require('jsonwebtoken')
authRouter.post("/api/signup", async (req,res) => {
    try {
    const {name,email,password} = req.body
    const existingUser = await User.findOne({email})
    if(existingUser){
        return res.status(400).json({msg: "User already exists !!"})
    }
    const hashedPassword = await bcrypt.hash(password,8)
    let user = new User({
        email,
        name,
        password : hashedPassword
    })
    user = await user.save()
    res.json(user)
    } catch (e) {
        res.status(500).json({error: e.message}) 
        
    }
    
})

authRouter.post("/api/signin", async (req,res) =>{
    try {
        const {name,email,password} = req.body
        const user = await User.findOne({email})
        if(!user){
            return res.status(400).json({msg: "User don't exists !!"})
        }
        const isMatch = await bcrypt.compare(password,user.password)
        const token = jwt.sign({id: user._id}, "passwordKey")
        res.json({token, ...user._doc})

        if(!isMatch){
            return res.status(400).json({msg: "Incorrect Password !!"})
        }
        
    } catch (e) {
        res.status(500).json({error: e.message}) 
    }
})

authRouter.post("/isTokenValid", async (req,res) =>{
    try {
       const token = req.header('x-auth-token')
       if(!token) return res.json(false)
       const isVerified = jwt.verify(token,'passwordKey')      
       if(!isVerified)  return res.json(false)

       const user = User.findById(isVerified.id)
       if(!user) return res.json(false)
       res.json(true)
    } catch (e) {
        res.status(500).json({error: e.message}) 
    }
})
//get user data

authRouter.get('/', auth, async(req,res) => {
    const user = await User.findById(req.user)
    req.json(...user._doc);
});
module.exports = authRouter;