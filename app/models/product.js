'use strict'

const mongoose = require('mongoose')

const productSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  price: {
    type: Number,
    required: true
  },
  inventory: {
    type: Number,
    required: true
  },
  image: {
    type: String
  }
},
  {
    timestamp: true,
    toObject: { virtuals: true },
    toJSON: { virtuals: true }
  })

productSchema.virtual('inStock').get(function length () {
  return this.inventory !== 0
})

const Product = mongoose.model('Product', productSchema)

module.exports = Product
