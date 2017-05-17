'use strict'

const mongoose = require('mongoose')

const productSchema = new mongoose.Schema({
  name: String,
  price: Number,
  quantity: Number,
  image: String
})

const cartSchema = new mongoose.Schema({
  userId: {
    type: String,
    required: true
  },
  products: [productSchema]
},
  {
    timestamp: true,
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
