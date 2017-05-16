const Product = require('../../app/models/product')
const prod = new Product({name: 'chair', price: 20, inventory: 400, image: 'url'})
const Cart = require('../../app/models/cart')
const cart = new Cart({userId: 'van', cartSum: 45, products: prod})
cart.products[0].quantity = 1

console.log(cart)
