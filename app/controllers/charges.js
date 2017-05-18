'use strict'

const stripe = require('stripe')('sk_test_Z2UYtEQ82ZlrPIAnRAvniJ7f')

const authenticate = require('./concerns/authenticate')

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Charge = models.charge

const index = (req, res, next) => {
  Charge.find()
    .then(examples => res.json({
      examples: examples.map((e) =>
        e.toJSON({ virtuals: true, user: req.user }))
    }))
    .catch(next)
}

const create = (req, res) => {
  console.log('req is', req)
  const charge = Object.assign(req.body, {
    _owner: req.user._id
  })
  console.log('(controllers/charges.js) create ran!  Charge to be created is : ', charge)

  // Create new charge on Charge collection
  Charge.create(charge)
    .then(() => {
      // successful charge created
      res.sendStatus(201)
      chargeUserCard(req)
    })
    .catch(() => {
      // send back error status on creation of charge attempt
      res.sendStatus(401)
    })
}

const chargeUserCard = function (request) {
  // Token is created using Stripe.js or Checkout!
  // Get the payment token submitted by the form:
  console.log('request.body is', request.body)
  const token = request.body.id   // Using Express

  console.log('(controllers/charges.js) chargeUserCard  Token: ', token)

  // Charge the user's card
  const charge = stripe.charges.create({
    amount: 1000,
    currency: 'usd',
    description: 'Example charge',
    source: token
  }, function (err, charge) {
    console.error(err)
    console.log('charge is', charge)
    // asynchronously called
  })

  console.log('(controllers/charges.js) chargeUserCard  Charge (after CB): ', charge)
}

module.exports = controller({
  index,
  create
}, { before: [
  { method: authenticate, only: ['create'] }
] }
)
