SMODS.Voucher {
    key = 'cornucopia',
    pos = { x = 1, y = 0 },
    config = { extra = { add = 1 } },
	atlas = 'Vouchers',
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.add } }
    end,
	requires = {
		'v_morne_bushel'
	},
    redeem = function(self)
        if G.GAME.modifiers.booster_choice_mod == nil then
            G.GAME.modifiers.booster_choice_mod = 0
        end
    	G.GAME.modifiers.booster_choice_mod = G.GAME.modifiers.booster_choice_mod + 1
  	end
}
