SMODS.Atlas {
	-- Key for code to find it with
	key = "Jokers",
	-- The name of the file, for the code to pull the atlas from
	path = "Jokers.png",
	-- Width of each sprite in 1x size
	px = 71,
	-- Height of each sprite in 1x size
	py = 95
}

SMODS.Atlas {
  key = "Vouchers",
  path = "Vouchers.png",
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = 'modicon',
  px = 32,
  py = 32,
  path = 'modicon.png'
}

SMODS.Atlas { 
    key = 'Blinds', 
    path = 'Blinds.png', 
    px = 34, 
    py = 34, 
    frames = 21, 
    atlas_table = 'ANIMATION_ATLAS' 
}

SMODS.current_mod.optional_features = {
  post_trigger = true
}

--JOKERS

--Commons
assert(SMODS.load_file('Items/jokers/grotesque_joker.lua'))()
assert(SMODS.load_file('Items/jokers/dopplejoker.lua'))()
assert(SMODS.load_file('Items/jokers/tentajoker.lua'))()
assert(SMODS.load_file('Items/jokers/blind_joker.lua'))()
assert(SMODS.load_file('Items/jokers/chuckling_clown.lua'))()
assert(SMODS.load_file('Items/jokers/impractical_joker.lua'))()
assert(SMODS.load_file('Items/jokers/iceberg.lua'))()
assert(SMODS.load_file('Items/jokers/lone_pawn.lua'))()
assert(SMODS.load_file('Items/jokers/forbidden_schematic.lua'))()
assert(SMODS.load_file('Items/jokers/striped_paint.lua'))()
assert(SMODS.load_file('Items/jokers/contact_binary.lua'))()
assert(SMODS.load_file('Items/jokers/sinking_feeling.lua'))()
--Uncommons
assert(SMODS.load_file('Items/jokers/cardboard_cutout.lua'))()
assert(SMODS.load_file('Items/jokers/camo_joker.lua'))()
assert(SMODS.load_file('Items/jokers/verification_joker.lua'))()
assert(SMODS.load_file('Items/jokers/pyromancer.lua'))()
assert(SMODS.load_file('Items/jokers/photophobe.lua'))()
assert(SMODS.load_file('Items/jokers/cyclist.lua'))()
assert(SMODS.load_file('Items/jokers/snoozefest.lua'))()
assert(SMODS.load_file('Items/jokers/apples_to_oranges.lua'))()
assert(SMODS.load_file('Items/jokers/egomaniac.lua'))()
assert(SMODS.load_file('Items/jokers/dead_weight.lua'))()
assert(SMODS.load_file('Items/jokers/nickel_and_dime.lua'))()
assert(SMODS.load_file('Items/jokers/ad_infinitum.lua'))()
assert(SMODS.load_file('Items/jokers/tenancy.lua'))()
--Rares
assert(SMODS.load_file('Items/jokers/stained_joker.lua'))()
assert(SMODS.load_file('Items/jokers/smog.lua'))()
assert(SMODS.load_file('Items/jokers/dumpster_diving.lua'))()
assert(SMODS.load_file('Items/jokers/eruption.lua'))()
assert(SMODS.load_file('Items/jokers/one_armed_bandit.lua'))()

--VOUCHERS

assert(SMODS.load_file('Items/vouchers/bushel.lua'))()
assert(SMODS.load_file('Items/vouchers/cornucopia.lua'))()

--BOSS BLINDS
assert(SMODS.load_file('Items/blinds/sift.lua'))()
assert(SMODS.load_file('Items/blinds/smudge.lua'))()
assert(SMODS.load_file('Items/blinds/myriad.lua'))()
assert(SMODS.load_file('Items/blinds/morph.lua'))()
assert(SMODS.load_file('Items/blinds/drab.lua'))()
assert(SMODS.load_file('Items/blinds/bile.lua'))()