var config
var store
var section

var basketValue = 0
var basket = {}

var ItemPrices = {}

var scaleInterval = 0.05;
var scale = 1;
var Interval;
var targets = 0;
var goalTargets = 10;


function playClickSound() {
    var audio = document.getElementById("clickaudio");
    audio.volume = 0.1;
    audio.play();
}

function cancelTarget() {
$('.target-container').remove();
$('.target').remove();
 clearInterval(Interval);
 $.post('https://core_stores/close', JSON.stringify({}));
}

function clickTarget() {

    playClickSound();
   
    targets = targets + 1;
    $('.target-text2').text(targets + '/' + goalTargets);

    if (targets == goalTargets) {
        cancelTarget();
      $.post('https://core_stores/openCashregister', JSON.stringify({}));
     
    } else {
          relocateTraget();
    }

   
   

}

function relocateTraget() {

if (targets == 0) {
  scaleInterval = 0.007;
} else {
scaleInterval = Math.random() * (0.06 - 0.005) + 0.005;
}


scale = 1;
  
var posx = (Math.random() * (($(document).width() - 200) - 200 ) + 200).toFixed();
var posy = (Math.random() * (($(document).height() - 200) - 200 ) + 200).toFixed();

$('.target').css({
        'position':'absolute',
        'left':posx+'px',
        'top':posy+'px',
    });

}

function openTargets() {


scale = 1;
targets = 0;


$('#cashregister').remove();

var base = '<svg viewBox="0 0 1024 1024" class="target" onclick="clickTarget()">'+
'        <path'+
'          d="M981.333 512c0-129.579-52.565-246.997-137.472-331.861s-202.283-137.472-331.861-137.472-246.997 52.565-331.861 137.472-137.472 202.283-137.472 331.861 52.565 246.997 137.472 331.861 202.283 137.472 331.861 137.472 246.997-52.565 331.861-137.472 137.472-202.283 137.472-331.861zM896 512c0 106.069-42.923 201.984-112.469 271.531s-165.461 112.469-271.531 112.469-201.984-42.923-271.531-112.469-112.469-165.461-112.469-271.531 42.923-201.984 112.469-271.531 165.461-112.469 271.531-112.469 201.984 42.923 271.531 112.469 112.469 165.461 112.469 271.531zM810.667 512c0-82.475-33.493-157.184-87.467-211.2s-128.725-87.467-211.2-87.467-157.184 33.493-211.2 87.467-87.467 128.725-87.467 211.2 33.493 157.184 87.467 211.2 128.725 87.467 211.2 87.467 157.184-33.493 211.2-87.467 87.467-128.725 87.467-211.2zM725.333 512c0 58.923-23.851 112.213-62.464 150.869s-91.947 62.464-150.869 62.464-112.213-23.851-150.869-62.464-62.464-91.947-62.464-150.869 23.851-112.213 62.464-150.869 91.947-62.464 150.869-62.464 112.213 23.851 150.869 62.464 62.464 91.947 62.464 150.869zM640 512c0-35.328-14.379-67.413-37.504-90.496s-55.168-37.504-90.496-37.504-67.413 14.379-90.496 37.504-37.504 55.168-37.504 90.496 14.379 67.413 37.504 90.496 55.168 37.504 90.496 37.504 67.413-14.379 90.496-37.504 37.504-55.168 37.504-90.496zM554.667 512c0 11.776-4.736 22.4-12.501 30.165s-18.389 12.501-30.165 12.501-22.4-4.736-30.165-12.501-12.501-18.389-12.501-30.165 4.736-22.4 12.501-30.165 18.389-12.501 30.165-12.501 22.4 4.736 30.165 12.501 12.501 18.389 12.501 30.165z"'+
'        ></path>'+
'      </svg>'+
'<div class="target-container">'+
'    <span class="target-text">ACCESSING</span>'+
'    <span class="target-text1">CASH REGISTER</span>'+
'    <div class="target-container1">'+
'      <svg viewBox="0 0 1024 1024" class="target-icon">'+
'        <path'+
'          d="M981.333 512c0-129.579-52.565-246.997-137.472-331.861s-202.283-137.472-331.861-137.472-246.997 52.565-331.861 137.472-137.472 202.283-137.472 331.861 52.565 246.997 137.472 331.861 202.283 137.472 331.861 137.472 246.997-52.565 331.861-137.472 137.472-202.283 137.472-331.861zM896 512c0 106.069-42.923 201.984-112.469 271.531s-165.461 112.469-271.531 112.469-201.984-42.923-271.531-112.469-112.469-165.461-112.469-271.531 42.923-201.984 112.469-271.531 165.461-112.469 271.531-112.469 201.984 42.923 271.531 112.469 112.469 165.461 112.469 271.531zM810.667 512c0-82.475-33.493-157.184-87.467-211.2s-128.725-87.467-211.2-87.467-157.184 33.493-211.2 87.467-87.467 128.725-87.467 211.2 33.493 157.184 87.467 211.2 128.725 87.467 211.2 87.467 157.184-33.493 211.2-87.467 87.467-128.725 87.467-211.2zM725.333 512c0 58.923-23.851 112.213-62.464 150.869s-91.947 62.464-150.869 62.464-112.213-23.851-150.869-62.464-62.464-91.947-62.464-150.869 23.851-112.213 62.464-150.869 91.947-62.464 150.869-62.464 112.213 23.851 150.869 62.464 62.464 91.947 62.464 150.869zM640 512c0-35.328-14.379-67.413-37.504-90.496s-55.168-37.504-90.496-37.504-67.413 14.379-90.496 37.504-37.504 55.168-37.504 90.496 14.379 67.413 37.504 90.496 55.168 37.504 90.496 37.504 67.413-14.379 90.496-37.504 37.504-55.168 37.504-90.496zM554.667 512c0 11.776-4.736 22.4-12.501 30.165s-18.389 12.501-30.165 12.501-22.4-4.736-30.165-12.501-12.501-18.389-12.501-30.165 4.736-22.4 12.501-30.165 18.389-12.501 30.165-12.501 22.4 4.736 30.165 12.501 12.501 18.389 12.501 30.165z"'+
'        ></path>'+
'      </svg>'+
'      <span class="target-text2">0/'+goalTargets+'</span>'+
'    </div>'+
'  </div>';
  



  $('#main_container').append(base);

  relocateTraget();

Interval = setInterval(function(){
  if (scale > 0) {
       scale = scale - scaleInterval;
  $('.target').css('transform', 'scale('+scale+')')
  }  else {

     cancelTarget();
      //ban

  }
 
}, 50)


}

function checkOutStatus(success) {


    $('#loader').addClass('disapear');

    if (success) {

  var base =  '    <span class="checkout-text3 scale-down-center">SUCCESSFUL</span>';
  $('#checkout').append(base);

  basket = {};
  basketValue = 0;

   $('.home-text6').text('$' + basketValue);

    } else {

        var base =  '    <span class="checkout-text4 scale-down-center">FAILED</span>';
  $('#checkout').append(base);

  setTimeout(() => {

      $('#checkout').remove();
      openPayment();

  }, 2000);

    }



}

function checkout(method) {

if (basketValue == 0) {
  return;
}

  $.post('https://core_stores/checkout', JSON.stringify({
    basket: basket,
    basketValue: basketValue,
    method: method
  }));

$('.checkout-container5').addClass('disapear');
$('.checkout-container6').addClass('disapear');
$('.checkout-container1').fadeOut();
 $('.checkout-text2').fadeOut();

var base = '<img id="loader" src="loader.svg" class="scale-down-center">';
$('#checkout').append(base);



}

function addToCart(item, price) {
  

playClickSound();

if (basket[item]) {
    basket[item] += 1;
} else {
    basket[item] = 1;
}

basketValue += price;
 $('.home-text6').text('$' + basketValue);
 $('#' + item).find(".home-text3").text( basket[item])
 $('.checkout-text2').text('TOTAL $' + basketValue )

}

function removeFromBasket(item, price) {

if(basket[item]) {

  playClickSound();

    if (basket[item] != 0) {

        basket[item] -= 1;
        basketValue -= price;
         $('.home-text6').text('$' + basketValue);
         $('#' + item).find(".home-text3").text( basket[item])
         $('.checkout-text2').text('TOTAL $' + basketValue )

    }



}

}

function tryCashregister(method) {

     $.post('https://core_stores/tryCashregister', JSON.stringify({

        method: method
  }));

}

function openCashregister() {



var base = '<div id="cashregister">'+
' <div class="home-container01 slide-right">' +
'    <span class="cashregister-text">CASH REGISTER</span>'+
'    <div class="cashregister-container1 scale" onclick="tryCashregister(\'key\')">'+
'      <svg viewBox="0 0 1024 1024" class="cashregister-icon">'+
'        <path'+
'          d="M704 0c-176.73 0-320 143.268-320 320 0 20.026 1.858 39.616 5.376 58.624l-389.376 389.376v192c0 35.346 28.654 64 64 64h64v-64h128v-128h128v-128h128l83.042-83.042c34.010 12.316 70.696 19.042 108.958 19.042 176.73 0 320-143.268 320-320s-143.27-320-320-320zM799.874 320.126c-53.020 0-96-42.98-96-96s42.98-96 96-96 96 42.98 96 96-42.98 96-96 96z"'+
'        ></path>'+
'      </svg>'+
'    </div>'+
'    <div class="cashregister-container2 scale">'+
'      <svg viewBox="0 0 1024 1024" class="cashregister-icon2" onclick="tryCashregister(\'rob\')">'+
'        <path'+
'          d="M554 598v-172h-84v172h84zM554 768v-86h-84v86h84zM42 896l470-810 470 810h-940z"'+
'        ></path>'+
'      </svg>'+
'    </div>'+
'  </div>';
  
$('#main_container').append(base);


}


function openPayment() {

if ($('#checkout').length) {
  $('#checkout').remove();
}

var base = '<div id="checkout">'+
' <div class="home-container01 slide-right">' +
'    <div class="checkout-container1">';


 for (const [key1, value1] of Object.entries(basket)) {

base = base + '      <div class="home-container03 scale-down-ver-bottom" id="'+key1+'">'+
'        <span class="home-text1">$'+ ItemPrices[key1] +'</span>'+
'        <div class="home-container04" style="background: url(img/'+key1+'.png); background-size: cover"></div>'+
'        <div class="home-container05 ripple" onclick="removeFromBasket(\''+key1+'\', '+ItemPrices[key1]+')">'+
'          <span class="home-text2">REMOVE</span>'+
'        </div>'+
'        <div class="home-container06"><span class="home-text3">'+(basket[key1] || 0)+'</span></div>'+
'        <div class="home-container07 scale" onclick="addToCart(\''+key1+'\', '+ItemPrices[key1]+')">'+
'          <svg viewBox="0 0 804.5714285714286 1024" class="home-icon">'+
'            <path'+
'              d="M804.571 420.571v109.714c0 30.286-24.571 54.857-54.857 54.857h-237.714v237.714c0 30.286-24.571 54.857-54.857 54.857h-109.714c-30.286 0-54.857-24.571-54.857-54.857v-237.714h-237.714c-30.286 0-54.857-24.571-54.857-54.857v-109.714c0-30.286 24.571-54.857 54.857-54.857h237.714v-237.714c0-30.286 24.571-54.857 54.857-54.857h109.714c30.286 0 54.857 24.571 54.857 54.857v237.714h237.714c30.286 0 54.857 24.571 54.857 54.857z"'+
'            ></path>'+
'          </svg>'+
'        </div>'+
'        <div class="home-container08 scale" onclick="removeFromBasket(\''+key1+'\', '+ItemPrices[key1]+')">'+
'          <svg viewBox="0 0 804.5714285714286 1024" class="home-icon02">'+
'            <path'+
'              d="M804.571 420.571v109.714c0 30.286-24.571 54.857-54.857 54.857h-694.857c-30.286 0-54.857-24.571-54.857-54.857v-109.714c0-30.286 24.571-54.857 54.857-54.857h694.857c30.286 0 54.857 24.571 54.857 54.857z"'+
'            ></path>'+
'          </svg>'+
'        </div>'+
'      </div>';

}

base = base + '    </div>'+
'    <span class="checkout-text1">CHECKOUT</span>'+
'    <div class="checkout-container5 scale" onclick="checkout(\'bank\')">'+
'      <svg viewBox="0 0 1097.142857142857 1024" class="checkout-icon">'+
'        <path'+
'          d="M1005.714 73.143c50.286 0 91.429 41.143 91.429 91.429v694.857c0 50.286-41.143 91.429-91.429 91.429h-914.286c-50.286 0-91.429-41.143-91.429-91.429v-694.857c0-50.286 41.143-91.429 91.429-91.429h914.286zM91.429 146.286c-9.714 0-18.286 8.571-18.286 18.286v128h950.857v-128c0-9.714-8.571-18.286-18.286-18.286h-914.286zM1005.714 877.714c9.714 0 18.286-8.571 18.286-18.286v-347.429h-950.857v347.429c0 9.714 8.571 18.286 18.286 18.286h914.286zM146.286 804.571v-73.143h146.286v73.143h-146.286zM365.714 804.571v-73.143h219.429v73.143h-219.429z"'+
'        ></path>'+
'      </svg>'+
'    </div>'+
'    <div class="checkout-container6 scale" onclick="checkout(\'cash\')">'+
'      <svg viewBox="0 0 1097.142857142857 1024" class="checkout-icon2">'+
'        <path'+
'          d="M438.857 658.286h219.429v-54.857h-73.143v-256h-65.143l-84.571 78.286 44 45.714c13.714-12 22.286-18.286 31.429-32.571h1.143v164.571h-73.143v54.857zM731.429 512c0 104-62.857 237.714-182.857 237.714s-182.857-133.714-182.857-237.714 62.857-237.714 182.857-237.714 182.857 133.714 182.857 237.714zM1024 658.286v-292.571c-80.571 0-146.286-65.714-146.286-146.286h-658.286c0 80.571-65.714 146.286-146.286 146.286v292.571c80.571 0 146.286 65.714 146.286 146.286h658.286c0-80.571 65.714-146.286 146.286-146.286zM1097.143 182.857v658.286c0 20-16.571 36.571-36.571 36.571h-1024c-20 0-36.571-16.571-36.571-36.571v-658.286c0-20 16.571-36.571 36.571-36.571h1024c20 0 36.571 16.571 36.571 36.571z"'+
'        ></path>'+
'      </svg>'+
'    </div>'+
'    <span class="checkout-text2">TOTAL $'+basketValue+'</span>'+
'  </div>';
  

  


$('#main_container').append(base);


}

function openSection() {

if ($('#section').length) {
  $('#section').remove();
}

var base = '<div id="section">    <div class="home-container01 slide-right"></div>'+
'    <div class="home-container02">';

  for (const [key1, value1] of Object.entries(config.Stores[store].Sections[section].Items)) {

    ItemPrices[key1] = value1;

base = base + '      <div class="home-container03 scale-down-ver-bottom" id="'+key1+'">'+
'        <span class="home-text1">$'+value1+'</span>'+
'        <div class="home-container04" style="background: url(img/'+key1+'.png); background-size: cover"></div>'+
'        <div class="home-container05 ripple" onclick="addToCart(\''+key1+'\', '+value1+')">'+
'          <span class="home-text2">ADD TO CART</span>'+
'        </div>'+
'        <div class="home-container06"><span class="home-text3">'+(basket[key1] || 0)+'</span></div>'+
'        <div class="home-container07 scale" onclick="addToCart(\''+key1+'\', '+value1+')">'+
'          <svg viewBox="0 0 804.5714285714286 1024" class="home-icon">'+
'            <path'+
'              d="M804.571 420.571v109.714c0 30.286-24.571 54.857-54.857 54.857h-237.714v237.714c0 30.286-24.571 54.857-54.857 54.857h-109.714c-30.286 0-54.857-24.571-54.857-54.857v-237.714h-237.714c-30.286 0-54.857-24.571-54.857-54.857v-109.714c0-30.286 24.571-54.857 54.857-54.857h237.714v-237.714c0-30.286 24.571-54.857 54.857-54.857h109.714c30.286 0 54.857 24.571 54.857 54.857v237.714h237.714c30.286 0 54.857 24.571 54.857 54.857z"'+
'            ></path>'+
'          </svg>'+
'        </div>'+
'        <div class="home-container08 scale" onclick="removeFromBasket(\''+key1+'\', '+value1+')">'+
'          <svg viewBox="0 0 804.5714285714286 1024" class="home-icon02">'+
'            <path'+
'              d="M804.571 420.571v109.714c0 30.286-24.571 54.857-54.857 54.857h-694.857c-30.286 0-54.857-24.571-54.857-54.857v-109.714c0-30.286 24.571-54.857 54.857-54.857h694.857c30.286 0 54.857 24.571 54.857 54.857z"'+
'            ></path>'+
'          </svg>'+
'        </div>'+
'      </div>';


}

'    </div></div>';

$('#main_container').append(base);

}

function enterStore() {

basket = {};
basketValue = 0

var base = 

'  <div class="slide-right">'+
'    <span class="home-text slide-right">'+config.Stores[store].Label.toUpperCase()+'</span>'+

'    <div class="home-container09">'+
'      <svg viewBox="0 0 1097.142857142857 1024" class="home-icon04">'+
'        <path'+
'          d="M438.857 658.286h219.429v-54.857h-73.143v-256h-65.143l-84.571 78.286 44 45.714c13.714-12 22.286-18.286 31.429-32.571h1.143v164.571h-73.143v54.857zM731.429 512c0 104-62.857 237.714-182.857 237.714s-182.857-133.714-182.857-237.714 62.857-237.714 182.857-237.714 182.857 133.714 182.857 237.714zM1024 658.286v-292.571c-80.571 0-146.286-65.714-146.286-146.286h-658.286c0 80.571-65.714 146.286-146.286 146.286v292.571c80.571 0 146.286 65.714 146.286 146.286h658.286c0-80.571 65.714-146.286 146.286-146.286zM1097.143 182.857v658.286c0 20-16.571 36.571-36.571 36.571h-1024c-20 0-36.571-16.571-36.571-36.571v-658.286c0-20 16.571-36.571 36.571-36.571h1024c20 0 36.571 16.571 36.571 36.571z"'+
'        ></path>'+
'      </svg>'+
'      <span class="home-text4">$0</span>'+
'      <svg viewBox="0 0 1097.142857142857 1024" class="home-icon06">'+
'        <path'+
'          d="M1005.714 73.143c50.286 0 91.429 41.143 91.429 91.429v694.857c0 50.286-41.143 91.429-91.429 91.429h-914.286c-50.286 0-91.429-41.143-91.429-91.429v-694.857c0-50.286 41.143-91.429 91.429-91.429h914.286zM91.429 146.286c-9.714 0-18.286 8.571-18.286 18.286v128h950.857v-128c0-9.714-8.571-18.286-18.286-18.286h-914.286zM1005.714 877.714c9.714 0 18.286-8.571 18.286-18.286v-347.429h-950.857v347.429c0 9.714 8.571 18.286 18.286 18.286h914.286zM146.286 804.571v-73.143h146.286v73.143h-146.286zM365.714 804.571v-73.143h219.429v73.143h-219.429z"'+
'        ></path>'+
'      </svg>'+
'      <span class="home-text5">$0</span>'+
'      <svg viewBox="0 0 1170.2857142857142 1024" class="home-icon08">'+
'        <path'+
'          d="M1097.143 438.857c40.571 0 73.143 32.571 73.143 73.143s-32.571 73.143-73.143 73.143h-8.571l-65.714 378.286c-6.286 34.857-36.571 60.571-72 60.571h-731.429c-35.429 0-65.714-25.714-72-60.571l-65.714-378.286h-8.571c-40.571 0-73.143-32.571-73.143-73.143s32.571-73.143 73.143-73.143h1024zM277.143 896c20-1.714 35.429-19.429 33.714-39.429l-18.286-237.714c-1.714-20-19.429-35.429-39.429-33.714s-35.429 19.429-33.714 39.429l18.286 237.714c1.714 18.857 17.714 33.714 36.571 33.714h2.857zM512 859.429v-237.714c0-20-16.571-36.571-36.571-36.571s-36.571 16.571-36.571 36.571v237.714c0 20 16.571 36.571 36.571 36.571s36.571-16.571 36.571-36.571zM731.429 859.429v-237.714c0-20-16.571-36.571-36.571-36.571s-36.571 16.571-36.571 36.571v237.714c0 20 16.571 36.571 36.571 36.571s36.571-16.571 36.571-36.571zM932.571 862.286l18.286-237.714c1.714-20-13.714-37.714-33.714-39.429s-37.714 13.714-39.429 33.714l-18.286 237.714c-1.714 20 13.714 37.714 33.714 39.429h2.857c18.857 0 34.857-14.857 36.571-33.714zM272 166.857l-53.143 235.429h-75.429l57.714-252c14.857-66.857 73.714-113.714 142.286-113.714h95.429c0-20 16.571-36.571 36.571-36.571h219.429c20 0 36.571 16.571 36.571 36.571h95.429c68.571 0 127.429 46.857 142.286 113.714l57.714 252h-75.429l-53.143-235.429c-8-33.714-37.143-57.143-71.429-57.143h-95.429c0 20-16.571 36.571-36.571 36.571h-219.429c-20 0-36.571-16.571-36.571-36.571h-95.429c-34.286 0-63.429 23.429-71.429 57.143z"'+
'        ></path>'+
'      </svg>'+
'      <span class="home-text6">$0</span>'+
'    </div>'+
'  </div>';
  

  
$('#main_container').append(base);



}




window.addEventListener('message', function (event) {


  var edata = event.data;

 if (edata.type == 'enterStore') {

  config = edata.config;
  store = edata.store;
  enterStore();


 }
  if (edata.type == 'enterSection') {

  section = edata.section;
  openSection();

 }
 if (edata.type == 'openPayment') {
  openPayment();
 }
 if (edata.type == 'closeStore') {

     $('#main_container').fadeOut();
  setTimeout(() => {
    $('#main_container').html('');
    $('#main_container').fadeIn();
}, 1000);
  

 }
 if (edata.type == 'closeSection') {


   $('#section').fadeOut();
  setTimeout(() => {$('#section').remove();}, 1000);


 }
  if (edata.type == 'closePayment') {

    $('#checkout').fadeOut();
  setTimeout(() => {$('#checkout').remove();}, 1000);


 }
 if (edata.type == 'interactive') {

  if (edata.value) {
        $('.home-container02').css('opacity', 1.0);
         $('#checkout').css('opacity', 1.0);
          $('#cashregister').css('opacity', 1.0);
  } else {
      $('#checkout').css('opacity', 0.5);
       $('.home-container02').css('opacity', 0.5);
        $('#cashregister').css('opacity', 0.5);
  }


 }
  if (edata.type == 'checkoutStatus') {

   checkOutStatus(edata.value);


 }
  if (edata.type == 'updateMoney') {

   $('.home-text4').text('$' + edata.bank);
   $('.home-text5').text('$' + edata.money);


 }
 if (edata.type == 'openTargets') {

  goalTargets = edata.targets;
  openTargets();


 }
 if (edata.type == 'openCashregister') {

  
  openCashregister();


 }
 if (edata.type == 'closeCashregister') {

 
 $('#cashregister').fadeOut();
  setTimeout(() => {$('#cashregister').remove();}, 1000);

 }






});