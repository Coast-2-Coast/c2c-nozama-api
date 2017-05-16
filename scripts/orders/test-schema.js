const Product = require('../../app/models/product')
const prod1 = new Product({name: 'chair', price: 2000, inventory: 400, image: 'url-chair'})
const prod2 = new Product({name: 'table', price: 20000, inventory: 50, image: 'url-table'})
const Order = require('../../app/models/order')
const order = new Order({products: [prod1, prod2]})
order.products[0].quantity = 3
order.products[1].quantity = 2

console.log('Order is: ', order)
