'use strict'

const mongoose = require('mongoose')

const cartSchema = new mongoose.Schema({
  userId: String,
  cartSum: Number
})

const orderSchema = new mongoose.Schema({
  orderDate: {
    type: Date,
    required: true
  },
  carts: [cartSchema]
},
  {
    timestamp: true,
    toObject: { virtuals: true },
    toJSON: { virtuals: true }
  })

const Order = mongoose.model('Order', orderSchema)

module.exports = Order
