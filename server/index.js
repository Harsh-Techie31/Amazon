const express = require('express')

const authRouter = require('./routes/auth.js')

///init api
const PORT = 3000
const app = express()


//middleware
app.use(express.json())
app.use(authRouter);



app.listen(PORT ,"0.0.0.0" , ()=>{
    console.log(`conected at port  ${PORT}`)
})

