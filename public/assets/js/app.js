/*
 * Created by Artyom Manchenkov
 * Copyright © 2015-2018 [DeepSide Interactive]
 */

console.log('GeekShop MVC Loaded...');


function loadItem() {
  $.getJSON('/product/view', {id: dataset})
          .done(function (response) {
            console.log(response);
          })
}

let button = $('#btnAddToCart').bind('click', addToCart);
let button = $('#btnAddToCart').bind('click', addToCart);


function addToCart() {
  let id = $('[data-id]').data('id');
  let quantity = $('[data-quantity]')[0].value;
  let price = $('[data-price]').data('price');
  let name = $('[data-name]').data('name');
  let description = $('[data-description]').data('description');
  let category = $('[data-category]').data('category');
  
  $('.alert').show();
  
  $('.close').bind('click', function() {
    $('.alert').hide();
  });
  
  setTimeout(function () {
    $('.alert').hide();
  }, 500);
  
  $.post('/cart/add', {
    id: id,
    quantity: quantity,
    price: price,
    name: name,
    description: description,
    category: category,
  })
          .done(function (response) {
            // alert('Product has been added to cart successfully!');
            console.log(response);
          })
  
}


