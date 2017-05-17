'use strict'

const mongoose = require('mongoose')

// const cartSchema = new mongoose.Schema({
//   userId: String,
//   cartSum: Number
// })

const orderSchema = new mongoose.Schema({
  orderDate: {
    type: Date,
    required: true
  },
  items: {
    type: Array,
    required: true
  },
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  total: {
    type: Number,
    default: 1,
    required: true
  },
  paid: {
    type: Boolean
  },
  rating: {
    type: Number
  }
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

const Order = mongoose.model('Order', orderSchema)

module.exports = Order
