// const Cart = require('../../app/models/cart')
// const cart1 = new Cart({userId: 'Van', cartSum: 2000})
// const cart2 = new Cart({userId: 'Ron', cartSum: 20000})

const Order = require('../../app/models/order')
const order = new Order({items: [
  {name: 'apple', price: 100, qty: 2},
  {name: 'orange', price: 200, qty: 1},
  {name: 'banana', price: 300, qty: 1}],
  total: 600})

const today = new Date()
console.log(today)
order.orderDate = today

order.save()
console.log('Order is: ', order)
