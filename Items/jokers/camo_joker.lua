SMODS.Joker {
	key = 'camo_joker',
	config = { extra = {} },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 11, y = 0 },
	cost = 5,
    eternal_compat = true,
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
		--[[if context.before and next(context.poker_hands['Flush']) then
			for _, card_in_hand in ipairs(context.scoring_hand) do
				local percent = 1.15 - (0.001) / (#G.play.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        context.scoring_hand[_]:flip()
                        play_sound('card1', percent)
                        context.scoring_hand[_]:juice_up(0.3, 0.3)
                        return true
					end
                }))
				G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.3,
                    func = function()
                        context.scoring_hand[_]:change_suit(G.GAME.current_round.camojoker_card.suit)
						card:juice_up(0.3, 0.3)

                        return true
					end
				}))
				

				G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.35,
                    func = function()
                        context.scoring_hand[_]:flip()
                        play_sound('tarot2', percent, 0.6)
                        context.scoring_hand[_]:juice_up(0.3, 0.3)
                        return true
					end
                }))
			end
		end]]
	end
}

--[[local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.camojoker_card = { suit = 'Clubs' }
	return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
	G.GAME.current_round.camojoker_card = G.GAME.current_round.camojoker_card or { suit = 'Clubs' }
	local camo_suits = {}
	for _, suit in ipairs({'Spades', 'Hearts', 'Clubs', 'Diamonds' }) do
        if not (suit == G.GAME.current_round.camojoker_card.suit) then 
			camo_suits[#camo_suits + 1] = suit 
		end
    end
	local camojoker_select = pseudorandom_element(camo_suits, pseudoseed('camojoke' .. G.GAME.round_resets.ante))
	G.GAME.current_round.camojoker_card.suit = camojoker_select
end]]
