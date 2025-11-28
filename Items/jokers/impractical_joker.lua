SMODS.Joker {
	key = 'impractical_joker',
	config = { extra = {
		--mult_gain = 1,
		--current_mult = 0,
		--max_per = 5,
		money_max = 8,
	} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 21, y = 0 },
	cost = 4,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
			card.ability.extra.money_max
			}
		}
	end,
	calculate = function(self, card, context)
		if context.starting_shop and G.GAME.dollars <= card.ability.extra.money_max then
			local myShopItems = {}
			if G.shop_jokers then
				for _, joker in ipairs(G.shop_jokers.cards) do
					if joker.cost > 0 then
						table.insert(myShopItems, joker)
					end
				end
			end
			if G.shop_booster then
				for _, booster in ipairs(G.shop_booster.cards) do
					if booster.cost > 0 then
						table.insert(myShopItems, booster)
					end
				end
			end
			if #myShopItems > 0 then
				G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.75,
                    func = function()
                        carder = pseudorandom_element(myShopItems, pseudoseed('impractical'))
						carder.ability.couponed = true
            			carder:set_cost()
						carder:juice_up(0.3, 0.3)
						card:juice_up(0.3, 0.3)
						card.ability.extra.active = false
                        return true
					end
				}))
				return {
				    message = localize('b_impractical'),
					colour =  G.C.MONEY,
			    }
                
			end
		end
	end
}
