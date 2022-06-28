
-- SEED USABLE ITEM REGISTER
-- Register every seed only changing the name of it between ''

QBCore.Functions.CreateUseableItem('weed_lemonhaze_seed', function(source, item)
		plant(source, item.name)
end)

QBCore.Functions.CreateUseableItem('coca_seed', function(source, item)
		plant(source, item.name)
end)

-- DRUGS USABLE ITEM REGISTER
-- Register every drug only changing the name of it between ''

QBCore.Functions.CreateUseableItem('weed_lemonhaze', function(source, item)
		drug(source, item.name)
end)

QBCore.Functions.CreateUseableItem('cocaine', function(source, item)
		drug(source, item.name)
end)

-- PROCCESING TABLE ITEM REGISTER
-- Register every proccesing table only changing the name of it between ''

QBCore.Functions.CreateUseableItem('cocaine_processing_table', function(source, item)
		proccesing(source, item.name)
end)

