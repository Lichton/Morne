SMODS.Joker {
	key = 'sinking_feeling',
	config = { },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 35, y = 0 },
	cost = 5,
    eternal_compat = true,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {

            }
    }
    end,
	calculate = function(self, card, context)
        local my_index = 1
		if context.individual and context.cardarea == G.play and context.other_card and not context.repetition then
            my_cards = {}
            for _, card_in_hand in ipairs(context.scoring_hand) do
                if card_in_hand == context.other_card then
                    my_index = _
                end
                table.insert(my_cards, card_in_hand)
            end
            if my_index > 1 then
                chipsPrev = my_cards[my_index - 1]:get_chip_bonus()
                chipsNow = my_cards[my_index]:get_chip_bonus()
                if #my_cards > 1 and my_index > 1 and chipsPrev > chipsNow then
                    return {
                        mult = chipsPrev - chipsNow,
                    }
                end
            end
		end
	end
}