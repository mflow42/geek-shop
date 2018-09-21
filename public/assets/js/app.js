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

let buttonAdd = $('#btnAddToCart').bind('click', addToCart);
let buttonDelete = $('.btnDeleteFromCart').bind('click', deleteFromCart);

function addToCart() {
  let id = $('[data-id]').data('id');
  let quantity = $('[data-quantity]')[0].value;
  let price = $('[data-price]').data('price');
  let name = $('[data-name]').data('name');
  let description = $('[data-description]').data('description');
  let category = $('[data-category]').data('category');
  
  $('.alert,.add').show();
  
  $('.close,.add').bind('click', function() {
    $('.alert,.add').hide();
  });
  
  setTimeout(function () {
    $('.alert,.add').hide();
  }, 1000);
  
  $.post('/cart/add', {
    id: id,
    quantity: quantity,
    price: price,
    name: name,
    description: description,
    category: category,
  })
          .done(function (response) {
            console.log('Product has been added to cart successfully!');
            console.log(response);
          })
  
}

function deleteFromCart(event) {
  let id = $(event.target.closest('td')).siblings('th').data('id');
  let row = $(event.target.closest('tr'));
  
  $('.alert,.delete').show();
  
  $('.close,.delete').bind('click', function() {
    $('.alert,.delete').hide();
  });
  
  setTimeout(function () {
    $('.alert,.delete').hide();
  }, 2000);
  
  $.post('/cart/delete', {
    id: id,
  })
          .done(function (response) {
            console.log('Product has been deleted!');
            row.remove();
          })
  
}


