SMODS.Enhancement {
    key = 'recycled',
    atlas = 'Enhancements',
    order = 3,
    pos = { x = 0, y = 0 },
    config = {
        extra = {
        handsize = 1
	}
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars = {
            card.ability.extra.handsize
        }
    }
	end,
}