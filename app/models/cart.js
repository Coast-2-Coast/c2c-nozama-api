'use strict'

const mongoose = require('mongoose')

const cartSchema = new mongoose.Schema({
  products: {
    type: Array,
    default: [],
    required: true
  },
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true }
},
  {
    timestamps: true,
    toObject: {virtuals: true},
    toJSON: {virtuals: true}
  })

cartSchema.virtual('cartSum').get(function cartSum () {
  let sum = 0
  for (let i = 0; i < this.products.length; i++) {
    sum += this.products[i].quantity * this.products[i].price
  }
  return sum
})

const Cart = mongoose.model('Cart', cartSchema)

module.exports = Cart
