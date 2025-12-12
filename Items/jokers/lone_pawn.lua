SMODS.Joker {
	key = 'lone_pawn',
    config = { extra = {
        poker_hand = 'High Card',
		gain = 0.25,
        basemult = 1,
        xmult = 0,
	} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 29, y = 0 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.poker_hand,
                card.ability.extra.gain,
                (card.ability.extra.basemult + card.ability.extra.xmult),
            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
        if context.before then
            if not context.blueprint then 
                if context.scoring_name == card.ability.extra.poker_hand then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
                    --[[return {
                        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.basemult + card.ability.extra.xmult } }
                    }]]
                end
            end
        end
        if context.joker_main then
            return {
                xmult = (card.ability.extra.basemult + card.ability.extra.xmult)
            }
        end
        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint and context.beat_boss then
            card.ability.extra.xmult = 0
            return {
                message = localize('k_reset')
            }
        end
	end
}