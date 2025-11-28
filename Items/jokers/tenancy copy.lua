SMODS.Joker {
	key = 'tenancy',
	config = { extra = { retrigger_increase = 1, dollar_increase = 10, repetitions = 1, repetitionCards = {}} },
	rarity = 3,
	atlas = 'Jokers',
	pos = { x = 25, y = 0 },
	cost = 6,
    eternal_compat = true,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        local message = ""
        if math.floor(G.GAME.dollars / card.ability.extra.dollar_increase) == 1 then
            message = localize('b_retrigger')
        else
            message = localize('b_retriggers')
        end
        return {
            vars = {
                card.ability.extra.dollar_increase,
                math.max(0, math.floor(G.GAME.dollars / card.ability.extra.dollar_increase)),
                message
            }
    }
    end,
	calculate = function(self, card, context)
        --if context.repetition and context.cardarea == G.play and not context.repetition_only then
        if context.before then
            card.ability.extra.repetitionCards = {}
            money = math.floor(G.GAME.dollars / card.ability.extra.dollar_increase)
            if money > 0 then
                for i = 1, money do
                    carder = pseudorandom_element(context.scoring_hand, pseudoseed('tenancy'))
                    table.insert(card.ability.extra.repetitionCards, carder)
                end
            end
        end
        if context.repetition and context.cardarea == G.play then
            count_retriggers = 0
            for _, cardOfType in ipairs(card.ability.extra.repetitionCards) do
                if context.other_card == card.ability.extra.repetitionCards[_] then
                    count_retriggers = count_retriggers + card.ability.extra.repetitions
                end
            end
            if count_retriggers > 0 then
                card:juice_up(0.3, 0.3)
                return {
                    message = localize('k_again_ex'),
                    repetitions = count_retriggers,
                    card = context.other_card
                }
            end
        end
    end
}