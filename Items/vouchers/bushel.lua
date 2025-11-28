SMODS.Voucher {
	key = 'bushel',
	pos = { x = 0, y = 0 },
	config = { extra = { add = 1 } },
	atlas = 'Vouchers',
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.add } }
	end,
	redeem = function(self)
		if G.GAME.modifiers.booster_size_mod == nil then
            G.GAME.modifiers.booster_size_mod = 0
        end
    	G.GAME.modifiers.booster_size_mod = G.GAME.modifiers.booster_size_mod + 1
  	end
}
