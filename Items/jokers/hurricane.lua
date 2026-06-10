SMODS.Joker {
	key = 'hurricane',
    config = { extra = 
    {

	} },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 53, y = 0 },
	cost = 6,
	loc_vars = function(self, info_queue, card)
        return {
            vars = 
            {

            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
		 if context.repetition and context.cardarea == G.play then
            local retriggernum = 0
            for _, card_in_hand in ipairs(G.hand) do
                if not SMODS.has_no_rank(card_in_hand) and card_in_hand:get_id() == 6 then
                    retriggernum = retriggernum + 1
                end
            end
            if not SMODS.has_no_rank(context.other_card) then
                if context.other_card:get_id() ~= 6 and retriggernum > 0 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = retriggernum,
                        -- The card the repetitions are applying to is context.other_card
                        card = card
				    }
                end
            end
        end
	end
}