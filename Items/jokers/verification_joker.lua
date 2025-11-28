SMODS.Joker {
	key = 'verification_joker',
	config = { extra = {} },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 12, y = 0 },
	cost = 6,
    eternal_compat = true,
	blueprint_compat = true,
	config = {
      extra = {
		repetitions = 1
      }
    },
	loc_vars = function(self, info_queue, card)
		return {
			vars = { 
				localize(G.GAME.current_round.verified_card.suit, 'suits_plural'),
				colours = { G.C.SUITS[G.GAME.current_round.verified_card.suit] } -- sets the colour of the text affected by `{V:1}`
			}
		}
	end,
    calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if context.other_card:is_suit(G.GAME.current_round.verified_card.suit) then
				return {
					message = localize('k_again_ex'),
					repetitions = card.ability.extra.repetitions,
					-- The card the repetitions are applying to is context.other_card
					card = card
				}
			end
		end
	end
}

local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.verified_card = { suit = 'Hearts' }
	return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
	G.GAME.current_round.verified_card = G.GAME.current_round.verified_card or { suit = 'Hearts' }
	local valid_verified_cards = {}
	for _, v in ipairs(G.playing_cards) do
		if not SMODS.has_no_suit(v) then -- Abstracted enhancement check for jokers being able to give cards additional enhancements
			valid_verified_cards[#valid_verified_cards + 1] = v
		end
	end
	if valid_verified_cards[1] then
		local verified_card = pseudorandom_element(valid_verified_cards, pseudoseed('verified_rand' .. G.GAME.round_resets.ante))
		G.GAME.current_round.verified_card.suit = verified_card.base.suit
	end
end
