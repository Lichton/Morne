SMODS.Joker {
	key = 'pyromancer',
	config = { extra = { 
          --mult_gain = 1,
          --current_mult = 0,
          --max_per = 5,
} },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 24, y = 0 },
	cost = 7,
    eternal_compat = true,
    blueprint_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = {set = 'Other', key = 'red_seal'}
      return {}
  end,
	calculate = function(self, card, context)
        if context.after and context.full_hand and #context.full_hand > 0 then
            if (hand_chips * mult) > G.GAME.blind.chips then
                local sealableCards = {}
                for _, card_in_hand in ipairs(context.full_hand) do
                    if not context.full_hand[_].debuff and not context.full_hand[_]:get_seal(true) then
                        table.insert(sealableCards, context.full_hand[_])
                    end
                end
                local carder = pseudorandom_element(sealableCards, pseudoseed('pyromancer'))
                if carder then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.5,
                        func = function()
                            card:juice_up(0.5, 0.5)
                            carder:juice_up(0.5, 0.5)
                            carder:set_seal('Red', nil, true)
                            return true
                        end
                    }))
                end
            end
        end
	end
}