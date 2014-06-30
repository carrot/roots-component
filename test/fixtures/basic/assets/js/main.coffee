
moment = require 'moment-moment'

document.getElementById('main').innerHTML = "It is #{moment().format("dddd, MMMM Do YYYY, h:mm a")}"
console.log 'hello'
console.log "The current time is #{moment()}"
