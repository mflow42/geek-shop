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


function addToCart() {
  let html = $('[data-id], [data-name], [data-product], [data-category], [data-description], [data-price], [data-quantity]');
  let productData = html.map((i, item) => $(item).data());
  let productObject = {};
  productData.map((i, item) => Object.assign(productObject, item));
  
  
  let id = $('[data-id]').data('id');
  // console.log(find);
  // $.post('/cart/add', {product: productObject})
  //         .done(function (response) {
  //           console.log(response);
  //         });
  
  $.post('/cart/add', {id: id})
    .done(function (response) {
      alert('Product has been added to cart succesfully!');
      console.log(response);
  })
  
}

