const Cart = require('../../app/models/cart')
const cart1 = new Cart({userId: 'Van', cartSum: 2000})
const cart2 = new Cart({userId: 'Ron', cartSum: 20000})
const Order = require('../../app/models/order')
const order = new Order({carts: [cart1, cart2]})

const today = new Date()
order.orderDate = today

console.log('Order is: ', order)
