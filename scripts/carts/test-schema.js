const Product = require('../../app/models/product')
const prod = new Product({name: 'chair', price: 2000, inventory: 400, image: 'url'})
const prod2 = new Product({name: 'table', price: 4000, inventory: 100, image: 'url'})
const Cart = require('../../app/models/cart')
const cart = new Cart({userId: 'van', products: [prod, prod2]})
cart.products[0].quantity = 2
cart.products[1].quantity = 3

console.log(cart)
