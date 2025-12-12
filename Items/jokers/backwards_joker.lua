SMODS.Joker {
	key = 'backwards_joker',
	config = { extra = {} },
	rarity = 3,
	atlas = 'Jokers',
	pos = { x = 36, y = 0 },
	cost = 6,
    eternal_compat = false,
	blueprint_compat = false,
	loc_vars = function(self, info_queue, card)
		return {
			vars = { -- gets the localized name of the suit
				--localize(G.GAME.current_round.camojoker_card.suit, 'suits_plural'),
				--colours = { G.C.SUITS[G.GAME.current_round.camojoker_card.suit] } -- sets the colour of the text affected by `{V:1}`
			}
		}
	end,
    calculate = function(self, card, context)
		if context.selling_self and not context.blueprint then
			valid_jokers = {}
			if G.shop_jokers and G.shop_jokers.cards then 
				for i = 1, #G.shop_jokers.cards do
					if G.shop_jokers.cards[i].ability.set == "Joker" then
						if not G.shop_jokers.cards[i].edition then
							table.insert(valid_jokers, G.shop_jokers.cards[i])
						elseif G.shop_jokers.cards[i].edition.type ~= 'negative' then
							table.insert(valid_jokers, G.shop_jokers.cards[i])
						end
					end
				end
				if #valid_jokers > 0 then
					randJoker = pseudorandom_element(valid_jokers, pseudoseed('backwards'))
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.1,
						func = function()
							if not randJoker.edition then
								newCost = randJoker.base_cost - 5
							else
								newCost = (randJoker.base_cost + randJoker.extra_cost) - 5
								--[[if randJoker.edition.holo then
									newCost = randJoker.base_cost - 3
								end
								if randJoker.edition.foil then
									newCost = randJoker.base_cost - 2
								end
								if randJoker.edition.polychrome then
									newCost = randJoker.base_cost - 5
								end
								if randJoker.edition.extra_cost then
									newCost = randJoker.base_cost - randJoker.edition.extra_cost
								end]]
							end
							randJoker.base_cost = newCost
							randJoker:set_edition({negative = true}, true, true)
							play_sound('negative', 1.5, 0.4)
                            randJoker:juice_up()
							return true
						end
					}))
				end
			end
			if G.pack_cards then
				valid_jokers = {}
				if G.pack_cards.cards then
					for i = 1, #G.pack_cards.cards do
						if G.pack_cards.cards[i].ability.set == "Joker" then
							if not G.pack_cards.cards[i].edition then
								table.insert(valid_jokers, G.pack_cards.cards[i])
							elseif G.pack_cards.cards[i].edition.type ~= 'negative' then
								table.insert(valid_jokers, G.pack_cards.cards[i])
							end
						end
					end
					if #valid_jokers > 0 then
						randJoker = pseudorandom_element(valid_jokers, pseudoseed('backwards'))
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.1,
							func = function()
								oldPrice = randJoker.ability.cost
								oldExtra = randJoker.ability.extra_cost
								randJoker:set_edition({negative = true}, true, true)
								randJoker.ability.cost = oldPrice
								randJoker.ability.extra_cost = randJoker.ability.extra_cost
								play_sound('negative', 1.5, 0.4)
                                randJoker:juice_up()
								return true
							end
						}))
					end
				end
			end
		end
	end
}
