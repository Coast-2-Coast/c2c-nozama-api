'use strict'

const mongoose = require('mongoose')

const productSchema = new mongoose.Schema({
  name: String,
  price: Number,
  quantity: Number,
  image: String
})

const orderSchema = new mongoose.Schema({
  products: [productSchema]
},
  {
    timestamp: true,
    toObject: { virtuals: true },
    toJSON: { virtuals: true }
  })

orderSchema.virtual('totalCost').get(function getTotalCost () {
  let totalCost = 0
  for (let prodIndex = 0; prodIndex < this.products.length; prodIndex++) {
    totalCost += this.products[prodIndex].quantity * this.products[prodIndex].price
  }
  return totalCost
})

const Order = mongoose.model('Order', orderSchema)

module.exports = Order
