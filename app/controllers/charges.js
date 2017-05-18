'use strict'

const authenticate = require('./concerns/authenticate')

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Charge = models.charge

const create = (req, res) => {
  const charge = Object.assign(req.body, {
    _owner: req.user._id
  })
  console.log('(controllers/charges.js) create ran!  Charge to be created is :', charge)

  Charge.create(charge)
    .then(() => {
      // successful charge created
      res.sendStatus(201)
    })
    .catch(() => {
      // send back error status on creation of charge attempt
      res.sendStatus(401)
    })
}

module.exports = controller({
  create
}, { before: [
  { method: authenticate, only: ['create'] }
] }
)
