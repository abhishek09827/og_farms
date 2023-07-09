const jwt = require('jsonwebtoken')

const auth = async (req,res,next) => {
    try {
        const token = req.headers('x-auth-token');
        if (!token) {
            return res.status(400).json({msg: 'No auth token ! Access Denied'})
        }
        const verified = jwt.verify(token,'passwordkey')
        if(!verified){
            return res.status(401).json({msg: 'Token verification Failed ! Access Denied'})
        }
        req.user = verified.id
        req.token = token
        next()
    } catch (e) {
        return res.status(500).json({e: e.message})
        
    }
}
module.exports = auth