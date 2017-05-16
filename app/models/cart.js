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
  cartSum: {
    type: Number,
    required: true
  },
  products: [productSchema]
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, ret, options) {
      const userId = (options.user && options.user._id) || false
      ret.editable = userId && userId.equals(doc._owner)
      return ret
    }
  }
})

// cartSchema.virtual('length').get(function length () {
//   return this.text.length
// })

const Cart = mongoose.model('Cart', cartSchema)

module.exports = Cart
