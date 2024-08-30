const mongoose = require('mongoose')

const userSchema = mongoose.Schema({
    name : {
        required : true,
        type : String,
        trim : true
    },
    email : {
        required : true,
        type : String,
        trim : true,
        validate : {
            validator : (value)=>{
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return value.match(emailRegex);
            },
            message : "Email entered is not valid",
        }
    },
    password : {
        required : true,
        type : String,
        trim : true
    },
    address : {
        type : String,
        default : '',
    },
    type : {
        type:String,
        default : "user"
    }
});


const user = mongoose.model('User' , userSchema);

module.exports= user;