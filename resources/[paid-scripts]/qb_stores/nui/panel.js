window.addEventListener('message', function (event) {
	var item = event.data;
	if (item.price){
		$('#modal-p').empty();
		$('#modal-p').append(`
		Do you really want to buy this store? Price: ` + new Intl.NumberFormat(item.format.location, { style: 'currency', currency: item.format.currency }).format(item.price) + `
		`);
		$("body").css("display", "");
		$(".main").css("display", "none");
		$(document).ready(function(){
			$("#buyModal").modal({show: true});
		});
	} else if (item.showmenu){
		var config = item.dados.config;
		var store_jobs = item.dados.store_jobs;
		var store_business = item.dados.store_business;
		var store_balance = item.dados.store_balance;

		if(item.update != true){
			$(".pages").css("display", "none");
			$("body").css("display", "");
			$(".main").css("display", "");
			$(".main-page").css("display", "block");
			$('.sidebar-navigation ul li').removeClass('active');
			$('#sidebar-1').addClass('active');
			openPage(0);
		}
		/*
		 * NAV BAR
		 */
		$('#nav-bar').empty();
		if(item.isMarket == true){
			if(item.update != true){
				$(".pages").css("display", "none");
				$("body").css("display", "");
				$(".market-page").css("display", "block");
				$('.sidebar-navigation ul li').removeClass('active');
				$('#sidebar-5').addClass('active');
				openPage(5);
			}
			$('#nav-bar').append(`
				` + getPagination(config.market_types.pagination) + `
				<li onclick="closeUI()">
					<i class="fas fa-times"></i>
					<span class="tooltip">Close</span>
				</li>
			`);
		}else{
			$('#nav-bar').append(`
				<li id="sidebar-1" onclick="openPage(0)">
					<i class="fas fa-store-alt"></i>
					<span class="tooltip">Your Store</span>
				</li>
				<li onclick="openPage(1)">
					<i class="fas fa-pallet"></i>
					<span class="tooltip">Buy goods</span>
				</li>
				<li onclick="openPage(2)">
					<i class="fas fa-users"></i>
					<span class="tooltip">Hire deliveryman</span>
				</li>
				<li onclick="openPage(3)">
					<i class="fas fa-chart-line"></i>
					<span class="tooltip">Upgrades</span>
				</li>
				<li onclick="openPage(4)">
					<i class="fas fa-cash-register"></i>
					<span class="tooltip">Cashier</span>
				</li>
				<li href="#myModal" data-toggle="modal" >
					<i class="fas fa-times"></i>
					<span class="tooltip">Sell store</span>
				</li>
			`);
		}

		/*
		 * STATISTICS PAGE
		 */
		$('#store-name').empty();
		if (store_business.market_name) {
			$('#store-name').append('(' + store_business.market_name + ')');
		}
		$('#profile-money-earned').empty();
		$('#profile-money-earned').append(new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency }).format(store_business.total_money_earned));
		$('#profile-money-spent').empty();
		$('#profile-money-spent').append(new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency }).format(store_business.total_money_spent));
		$('#profile-goods').empty();
		$('#profile-goods').append(new Intl.NumberFormat(config.format.location).format(store_business.goods_bought));
		$('#profile-distance-traveled').empty();
		$('#profile-distance-traveled').append(new Intl.NumberFormat(config.format.location).format(store_business.distance_traveled) + 'km');
		$('#profile-total-visits').empty();
		$('#profile-total-visits').append(new Intl.NumberFormat(config.format.location).format(store_business.total_visits));
		$('#profile-customers').empty();
		$('#profile-customers').append(new Intl.NumberFormat(config.format.location).format(store_business.customers));
		var stock_capacity = config.market_types.stock_capacity + config.market_types.upgrades.stock.level_reward[store_business.stock_upgrade];
		var stock_capacity_percent = ((store_business.stock_amount * 100)/stock_capacity).toFixed(1);
		$('#profile-stock-1').empty();
		var str_low_stock = '';
		if(config.warning == 1){
			str_low_stock = '<small class="red"><b>Staying with LOW STOCK will make you lose your store!</b></small>';
		}else if(config.warning == 2){
			str_low_stock = '<small class="red"><b>You need to increase your store\'s PRODUCT VARIETY or you will lose it!</b></small>';
		}
		$('#profile-stock-1').append(stock_capacity_percent + '% ' + str_low_stock);
		$('#profile-stock-2').empty();
		$('#profile-stock-2').append('Stock Capacity (Max: ' + stock_capacity + ')');
		$('#profile-stock-3').empty();
		$('#profile-stock-3').append('<div class="progress-bar bg-amber accent-4" role="progressbar" style="width: ' + stock_capacity_percent + '%" aria-valuenow="' + stock_capacity_percent + '" aria-valuemin="0" aria-valuemax="100"></div>');
		$('#stock-amount').empty();
		$('#stock-amount').append('(' + store_business.stock_amount + ')');
		$('#stock-products').empty();
		

		/*
		 * JOBS PAGE
		 */
		$('#job-page-list').empty();
		$('#market-products0').empty();
		$('#market-products1').empty();
		$('#market-products2').empty();
		$('#market-products3').empty();
		$('#market-products4').empty();
		$('#market-products5').empty();
		$('#form_product').empty();
		$('#form_product').append(`
			<option value="" selected disabled>Select the product</option>
		`);
		
		var arr_stock = JSON.parse(store_business.stock);
		var arr_stock_prices = JSON.parse(store_business.stock_prices);

		if (arr_stock_prices == false) {
			arr_stock_prices = {};
		}
		for (const key in config.market_types.market_items) {
			var fkey = key.replace("|", "-x-");
			var item = config.market_types.market_items[key];
			var amount = (item.amount_to_owner + Math.floor(item.amount_to_owner*(config.market_types.upgrades.truck.level_reward[store_business.truck_upgrade]/100)));
			var price = item.price_to_owner
			var discount = Math.floor((price * config.market_types.upgrades.relationship.level_reward[store_business.relationship_upgrade])/100);
			$('#job-page-list').append(`
				<li class="d-flex justify-content-between">
					<div class="d-flex flex-row align-items-center"><img class="font-large-2 mr-2 " src="img/` + item.img + `" width="30">
						<div class="ml-2">
							<h6 class="mb-0">` + item.name + `</h6>
							<div class="d-flex flex-row mt-1 text-black-50 small">
								<div><i class="fas fa-coins"></i><span class="ml-2">Unit cost: ` + new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency }).format(price-discount) + `</span></div>
								<div class="ml-3"><i class="fas fa-boxes"></i><span class="ml-2">Max amount: ` + amount + `</span></div>
							</div>
						</div>
					</div>
					<form class="mb-0 mt-1" id="jobs-form" role="form">
						<div class="d-flex flex-row">
							<input id="input-job-` + fkey + `" class="job-amount mr-3" min="1" max="` + amount + `" type="number" name="amount" required="required" placeholder="Amount" oninput="InvalidMsg(this,1,` + amount + `);" oninvalid="InvalidMsg(this,1,` + amount + `);">
							<button onclick="startJob('` + fkey + `')" class="btn btn-blue btn-darken-2 white mr-3">Start Job</button>
							<button onclick="storeProduct('` + fkey + `')" class="btn btn-blue btn-darken-2 white mr-3">Store from inventory</button>
						</div>
					</form>
				</li>
			`);

			// Select box (contracts page)
			$('#form_product').append(`
				<option item_id="` + key + `" amount="` + item.amount_to_delivery + `" >` + item.name + `</option>
			`);

			if (store_business.stock === false) {
				stock_value = "Full";
			} else if(arr_stock[key] == undefined) {
				stock_value = new Intl.NumberFormat(config.format.location).format(0);
			} else {
				stock_value = new Intl.NumberFormat(config.format.location).format(arr_stock[key]);
			}
			if(arr_stock_prices[key] == undefined) {
				arr_stock_prices[key] = item.price_to_customer;
			}
			
			// Stock amount (statistics page)
			$('#stock-products').append(`
				<div class="col-12">
					<div class="card overflow-hidden w-auto">
						<div class="card-content">
							<div class="card-body cleartfix">
								<div class="media align-items-stretch">
									<div class="align-self-center">
										<img class="font-large-2 mr-2 " src="img/` + item.img + `" width="60">
									</div>
									<div class="media-body">
										<h4>` + item.name + `</h4>
										<span> Price: ` + new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency }).format((arr_stock_prices[key]))  + `</span>
									</div>
									<div class="d-flex align-self-center">
									<h1 class="h1-center mb-0 ml-3">` + stock_value + `</h1>
										<span class="textbox ml-3"> 
											` + getCurrencySymbol (config.format.location, config.format.currency) + `
											<input id="input-price-` + fkey + `" min="1" type="number" name="amount" required="required" placeholder="Price"/>
										</span>
										<button onclick="setPrice('` + fkey + `')" class="stock-btn btn btn-blue btn-darken-2 white ml-3 mt-0">Set Price</button>
										<button onclick="startJob2('` + fkey + `')" class="stock-btn btn btn-blue btn-darken-2 white ml-3 mt-0">Export All</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			`);

			// Market itens
			
			$('#market-products'+item.page).append(`
				<div class="col-6">
					<div class="card overflow-hidden w-auto">
						<div class="card-content">
							<div class="card-body cleartfix">
								<div class="media align-items-stretch">
									<div class="align-self-center">
										<img class="font-large-2 mr-2 " src="img/` + item.img + `" width="60">
									</div>
									<div class="media-body">
										<h4>` + item.name + ` <small>Stock (` + stock_value + `)</small> </h4>
										<input id="input-` + fkey + `" class="deposit-money pr-0 pl-0 col-6" type="number" min="1" max="` + stock_value + `" placeholder="Amount" name="amount" required="required">
										<button onclick="buyItem('` + fkey + `')" class="btn btn-blue btn-darken-2 white deposit-money-btn col-6">Buy Item</button>
									</div>
									<div class="align-self-center">
										<h1>` + new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency, maximumFractionDigits: 0, minimumFractionDigits: 0 }).format(arr_stock_prices[key])  + `</h1>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			`);
		}

		/*
		 * CONTRACTS PAGE
		 */
		$('#contracts-page-list').empty();
		for (const store_job of store_jobs) {
			var price = (config.market_types.market_items[store_job.product].price_to_owner * store_job.amount)
			var discount = Math.floor((price * config.market_types.upgrades.relationship.level_reward[store_business.relationship_upgrade])/100);
			var total_cost = store_job.reward + price-discount
			$('#contracts-page-list').append(`
				<li class="d-flex justify-content-between">
					<div class="d-flex flex-row align-items-center"><img class="font-large-2 mr-2 " src="img/` + config.market_types.market_items[store_job.product].img + `" width="30">
						<div class="ml-2">
							<h6 class="mb-0">` + store_job.name + `</h6>
							<div class="d-flex flex-row mt-1 text-black-50 small">
								<div><i class="fas fa-coins"></i><span class="ml-2">Reward: ` + new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency }).format(store_job.reward) + `</span></div>
								<div class="ml-3"><i class="fas fa-coins"></i><span class="ml-2">Total cost: ` + new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency }).format(total_cost) + `</span></div>
								<div class="ml-3"><i class="fas fa-dolly-flatbed"></i><span class="ml-2">Item: ` + config.market_types.market_items[store_job.product].name + `</span></div>
								<div class="ml-3"><i class="fas fa-boxes"></i><span class="ml-2">Amount: ` + store_job.amount + `</span></div>
							</div>
						</div>
					</div>
					<div class="d-flex flex-row align-items-center">
						<button onclick="deleteJob(` + store_job.id + `)" class="btn btn-red btn-accent-4 white">Delete Contract</button>
					</div>
				</li>
			`);
		}

		/*
		 * UPGRADES PAGE
		 */
		$('#upgrades-page').empty();
		$('#upgrades-page').append(`
			<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
				<div class="card rounded shadow-sm border-0">
					<div class="card-body p-4"><img src="https://cdn.discordapp.com/attachments/533398980428693550/804898333192880128/shop.png" alt="" class="img-fluid d-block mx-auto mb-3">
						<h5> <a href="#" class="text-dark">Stock capacity</a></h5>
						<p style="height: 65px;" class="small text-muted font-italic">Upgrade your stock capacity to get more room to store your products. Your products will be sold only when someone comes to your store.</p>
						<ul class="small text-muted font-italic">
							<li> Level 1: +` + config.market_types.upgrades.stock.level_reward[1] + ` units.</li>
							<li> Level 2: +` + config.market_types.upgrades.stock.level_reward[2] + ` units. </li>
							<li> Level 3: +` + config.market_types.upgrades.stock.level_reward[3] + ` units. </li>
							<li> Level 4: +` + config.market_types.upgrades.stock.level_reward[4] + ` units. </li>
							<li> Level 5: +` + config.market_types.upgrades.stock.level_reward[5] + ` units. </li>
						</ul>
						<ul class="justify-content-center d-flex list-inline small">
							` + getStarsHTML(store_business.stock_upgrade) + `
						</ul>
						<button onclick="buyUpgrade('stock')" class="btn btn-blue btn-darken-2 white btn-block">Upgrade ` + new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency, maximumFractionDigits: 0, minimumFractionDigits: 0 }).format(config.market_types.upgrades.stock.price) + `</button>
					</div>
				</div>
			</div>
			
			<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
				<div class="card rounded shadow-sm border-0">
					<div class="card-body p-4"><img src="https://cdn.discordapp.com/attachments/533398980428693550/804898331159298078/delivery-truck.png" alt="" class="img-fluid d-block mx-auto mb-3">
						<h5> <a href="#" class="text-dark">Truck capacity</a></h5>
						<p style="height: 65px;" class="small text-muted font-italic">Upgrade your truck capacity to get a better truck to transport a larger amount of products. You'll get this bonus amount when you finish the delivery.</p>
						<ul class="small text-muted font-italic">
							<li> Level 1: +` + config.market_types.upgrades.truck.level_reward[1] + ` % capacity.</li>
							<li> Level 2: +` + config.market_types.upgrades.truck.level_reward[2] + ` % capacity. </li>
							<li> Level 3: +` + config.market_types.upgrades.truck.level_reward[3] + ` % capacity. </li>
							<li> Level 4: +` + config.market_types.upgrades.truck.level_reward[4] + ` % capacity. </li>
							<li> Level 5: +` + config.market_types.upgrades.truck.level_reward[5] + ` % capacity. </li>
						</ul>
						<ul class="justify-content-center d-flex list-inline small">
							` + getStarsHTML(store_business.truck_upgrade) + `
						</ul>
						<button onclick="buyUpgrade('truck')" class="btn btn-blue btn-darken-2 white btn-block">Upgrade ` + new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency, maximumFractionDigits: 0, minimumFractionDigits: 0 }).format(config.market_types.upgrades.truck.price) + `</button>
					</div>
				</div>
			</div>
			
			<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
				<div class="card rounded shadow-sm border-0">
					<div class="card-body p-4"><img src="https://cdn.discordapp.com/attachments/533398980428693550/804898332371189780/manager.png" alt="" class="img-fluid d-block mx-auto mb-3">
						<h5> <a href="#" class="text-dark">Relationship</a></h5>
						<p style="height: 65px;" class="small text-muted font-italic"> The better is your relationship with suppliers the better will be the purchase prices. You'll get the dicount when you start a new job.</p>
						<ul class="small text-muted font-italic">
							<li> Level 1: ` + config.market_types.upgrades.relationship.level_reward[1] + `% discount. </li>
							<li> Level 2: ` + config.market_types.upgrades.relationship.level_reward[2] + `% discount. </li>
							<li> Level 3: ` + config.market_types.upgrades.relationship.level_reward[3] + `% discount. </li>
							<li> Level 4: ` + config.market_types.upgrades.relationship.level_reward[4] + `% discount. </li>
							<li> Level 5: ` + config.market_types.upgrades.relationship.level_reward[5] + `% discount. </li>
						</ul>
						<ul class="justify-content-center d-flex list-inline small">
							` + getStarsHTML(store_business.relationship_upgrade) + `
						</ul>
						<button onclick="buyUpgrade('relationship')" class="btn btn-blue btn-darken-2 white btn-block">Upgrade ` + new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency, maximumFractionDigits: 0, minimumFractionDigits: 0 }).format(config.market_types.upgrades.relationship.price) + `</button>
					</div>
				</div>
			</div>
		`);

		/*
		 * BANK PAGE
		 */
		$('#bank-money').empty();
		$('#bank-money').append(new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency }).format(store_business.money));
		$('#balance-list').empty();
		for (const balance of store_balance) {
			if(balance.income == 0){
				$('#balance-list').append(`
					<li class="d-flex justify-content-between">
						<div class="d-flex flex-row align-items-center"><i class="fa fa-plus-circle checkicon"></i>
							<div class="ml-2">
								<h6 class="mb-0">` + balance.title + `</h6>
								<div class="d-flex flex-row mt-1 text-black-50 small">
									<div><i class="fas fa-coins"></i></i><span class="ml-2">Amount: ` + new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency }).format(balance.amount) + `</span></div>
									<div class="ml-3"><i class="fas fa-calendar-alt"></i></i><span class="ml-2">Date: ` + timeConverter(balance.date,config.format.location) + `</span></div>
								</div>
							</div>
						</div>
					</li>
				`);
			}else{
				$('#balance-list').append(`
					<li class="d-flex justify-content-between">
						<div class="d-flex flex-row align-items-center"><i class="fa fa-minus-circle redicon"></i>
							<div class="ml-2">
								<h6 class="mb-0">` + balance.title + `</h6>
								<div class="d-flex flex-row mt-1 text-black-50 small">
									<div><i class="fas fa-coins"></i></i><span class="ml-2">Amount: ` + new Intl.NumberFormat(config.format.location, { style: 'currency', currency: config.format.currency }).format(balance.amount) + `</span></div>
									<div class="ml-3"><i class="fas fa-calendar-alt"></i></i><span class="ml-2">Date: ` + timeConverter(balance.date,config.format.location) + `</span></div>
								</div>
							</div>
						</div>
					</li>
				`);
			}
		}
		$("form").submit(function(e){
			e.preventDefault();
		});
	}
	if (item.hidemenu){
		$("body").css("display", "none");
	}
});

/*=================
	FUNCTIONS
=================*/

function getCurrencySymbol (locale, currency) {
	return (0).toLocaleString(
	  locale,
	  {
		style: 'currency',
		currency: currency,
		minimumFractionDigits: 0,
		maximumFractionDigits: 0
	  }
	).replace(/\d/g, '').trim()
  }

function openPage(pageN){
	if(pageN == 0){
		$(".pages").css("display", "none");
		$(".main-page").css("display", "block");
	}
	if(pageN == 1){
		$(".pages").css("display", "none");
		$(".goods-page").css("display", "block");
	}
	if(pageN == 2){
		$(".pages").css("display", "none");
		$(".hire-page").css("display", "block");
	}
	if(pageN == 3){
		$(".pages").css("display", "none");
		$(".upgrades-page").css("display", "block");
	}
	if(pageN == 4){
		$(".pages").css("display", "none");
		$(".bank-page").css("display", "block");
	}
	
	if(pageN == 5){
		$(".pages").css("display", "none");
		$(".market-page0").css("display", "block");
	}
	if(pageN == 6){
		$(".pages").css("display", "none");
		$(".market-page1").css("display", "block");
	}
	if(pageN == 7){
		$(".pages").css("display", "none");
		$(".market-page2").css("display", "block");
	}
	if(pageN == 8){
		$(".pages").css("display", "none");
		$(".market-page3").css("display", "block");
	}
	if(pageN == 9){
		$(".pages").css("display", "none");
		$(".market-page4").css("display", "block");
	}
	if(pageN == 10){
		$(".pages").css("display", "none");
		$(".market-page5").css("display", "block");
	}
}

function setMaxAmount(item_id,amount){
	$('#form_amount').empty();
	$('#form_amount').append(`
		<input type="number" min="1" max="` + amount + `" name="amount" class="form-control" placeholder="Product amount" required="required" oninput="InvalidMsg(this,1,` + amount + `);" oninvalid="InvalidMsg(this,1,` + amount + `);"> 
	`);
}

function getStarsHTML(value){
	var html = "";
	for (var i = 1; i <= 5; i++) {
		if(i <= value){
			html += '<li class="list-inline-item m-1"><i class="fa fa-star amber font-large-1"></i></li>';
		}else{
			html += '<li class="list-inline-item m-1"><i class="fa fa-star-o amber font-large-1"></i></li>';
		}
	}
	return html;
}

function getPagination(pagination){
	var html = "";
	for (var i = 0; i <= 5; i++) {
		if(pagination[i] == undefined){
			return html;
		}
		html +=`
		<li onclick="openPage(` + (5+i) + `)">
			<i class="fas fa-store"></i>
			<span class="tooltip">` + pagination[i] + `</span>
		</li>`;
	}
	return html;
}

document.onkeyup = function(data){
	if (data.which == 27){
		if ($("body").is(":visible")){
			post("close","")
		}
	}
};

$('.sidebar-navigation ul li').on('click', function() {
	$('li').removeClass('active');
	$(this).addClass('active');
});


function timeConverter(UNIX_timestamp,locale){
	var a = new Date(UNIX_timestamp * 1000);
	var time = a.toLocaleString(locale);
	return time;
}

function InvalidMsg(textbox,min,max) {
	
	if (textbox.value == '') {
		textbox.setCustomValidity('Fill this field');
	}
	else if(textbox.validity.typeMismatch){
		textbox.setCustomValidity('Invalid value');
	}
	else if(textbox.validity.rangeUnderflow){
		textbox.setCustomValidity('Must be greater than or equal to ' + min);
	}
	else if(textbox.validity.rangeOverflow){
		textbox.setCustomValidity('Must be less than or equal to ' + max);
	}
	else {
		textbox.setCustomValidity('');
	}
	return true;
}

function log(d){
	console.log(JSON.stringify(d));
}

$('#buyModal').on('hidden.bs.modal', function () {
	closeUI();
})

/*=================
	CALLBACKS
=================*/

function closeUI(){
	post("close","")
}
function startJob(item_id){
	var amount = $("#input-job-"+item_id).val();
	var item_id = item_id.replace("-x-", "|");
	post("startJob",{item_id:item_id,amount:amount})
}
function startJob2(item_id){
	var amount = $("#input-job-"+item_id).val();
	var item_id = item_id.replace("-x-", "|");
	post("startJob2",{item_id:item_id,amount:amount})
}
function storeProduct(item_id){
	var amount = $("#input-job-"+item_id).val();
	var item_id = item_id.replace("-x-", "|");
	post("storeProduct",{item_id:item_id,amount:amount})
}
function setPrice(item_id){
	var price = $("#input-price-"+item_id).val();
	var item_id = item_id.replace("-x-", "|");
	post("setPrice",{item_id:item_id,price:price})
}
$(document).ready( function() { // Submitted create job form
	$("#contact-form").on('submit', function(e){
		e.preventDefault();
		var form = $('#contact-form').serializeArray();
		var e = document.getElementById("form_product");
		var item_id = e.options[e.selectedIndex].getAttribute('item_id');
		post("createJob",{name:form[0].value,reward:form[1].value,product:item_id,amount:form[3].value})
	});

	$("#rename-form").on('submit', function(e){
		e.preventDefault();
		var form = $('#rename-form').serializeArray();
		var e = document.getElementById("form_blip_color");
		var color_id = e.options[e.selectedIndex].getAttribute('color_id');
		var e = document.getElementById("form_blip_id");
		var blip_id = e.options[e.selectedIndex].getAttribute('blip_id');
		post("renameMarket",{name:form[0].value,color:color_id,blip:blip_id})
	});
})
function buyItem(item_id){
	var amount = $("#input-"+item_id).val();
	var item_id = item_id.replace("-x-", "|");
	post("buyItem",{item_id:item_id,amount:amount})
}
function deleteJob(job_id){
	post("deleteJob",{job_id:job_id})
}
function buyUpgrade(id){
	post("buyUpgrade",{id:id})
}
function depositMoney(){
	var amount = document.getElementById('input-deposit-money').value;
	document.getElementById('input-deposit-money').value = null;
	post("depositMoney",{amount:amount})
}
function withdrawMoney(){
	post("withdrawMoney",{})
}
function sellMarket(){
	post("sellMarket",{})
}
function buyMarket(){
	post("buyMarket",{})
}

function post(name,data){
	$.post("http://qb_stores/"+name,JSON.stringify(data),function(datab){
		if (datab != "ok"){
			console.log(datab);
		}
	});
}
