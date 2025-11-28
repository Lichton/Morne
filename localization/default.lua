return {
    misc = {
        dictionary = {
            b_inactive = '(Inactive)',
            b_active = '(Active)',
            b_snooze = 'Zzz...',
            b_retrigger = 'Retrigger',
            b_retriggers = 'Retriggers',
            b_grotesque_joker = 'Grotesque Joker',
            b_really_sad_joker = 'Really Sad Joker',
            b_dopple = 'Dopple!',
            b_dead_weight = 'Steeled!',
            b_cardboard = 'Copied?',
            b_stain = 'Splat!',
            b_impractical = 'Impractical!'
        },
    },
    descriptions = {
        Joker = {
            j_morne_camo_joker = { 
                name = "Camo Joker", 
                text = { 
                    "All {C:attention}Flushes{} can be made with up to two",
                    "cards of a {C:attention}different{} suit",
                } 
            },
            j_morne_blind_joker = { 
                name = "Blind Joker", 
                text = { 
                    "{C:green,}#1# in #2#{} cards are drawn {C:attention}face down{}",
                    "Gains {C:chips}+#4#{} Chips when {C:attention}face-down{} card is drawn",
                    "{C:inactive}(Currently{} {C:chips}+#3#{} {C:inactive}Chips){}"
                } 
            },
            j_morne_tentajoker = { 
                name = "Tentajoker", 
                text = { 
                    "Gains {C:chips}+#2#{} Chips if sum of",
                    "all played cards' ranks is {C:attention}8{}",
                    "{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips){}"
                } 
            },
             j_morne_verification_joker = { 
                name = "Captcha", 
                text = { 
                    "Retrigger all played {V:1}#1#{},",
			        "suit changes every round"
                } 
            },

            j_morne_egomaniac = { 
                name = "Egomaniac", 
                text = { 
                    "{X:mult,C:white}X#1#{} Mult until a {C:attention}Joker{} is bought,",
			        "resets upon defeating a {C:attention}Blind{}",
                    "{C:inactive}#2#{}"
                } 
            },

             j_morne_iceberg = { 
                name = "Iceberg", 
                text = { 
                    "{X:chips,C:white}X#1#{} Chips if scored hand contains",
			        "no cards with a rank greater than {C:attention}7{}",
                } 
            },

            
             j_morne_photophobe = { 
                name = "Photophobe", 
                text = { 
                    "{X:mult,C:white}X#1#{} Mult",
			        "{C:green,}#2# in #3#{} cards are drawn",
                    "{C:attention}face down{} after discarding",
                laugh = "Ha-ha!",
                }
            },

              j_morne_snoozefest = { 
                name = "Snoozefest", 
                text = { 
			        "Gains {C:attention}+#2#{} hand size when defeating a",
                    "{C:attention}Boss Blind{} without using discards",
                    "{C:inactive}(Currently{} {C:attention}+#1#{} {C:inactive}hand size){}"
                },
                snooze = '+1 Hand Size'
            },

             j_morne_dumpster_diving = { 
                name = "Dumpster Diver", 
                text = { 
			        "{C:attention}Enhanced{} cards in {C:attention}first discard{} of round",
                    "add their {C:attention}enhancement{} to a card in your hand",
                },
            },

            j_morne_grotesque_joker = { 
                name = "#4#", 
                text = { 
			        "{C:mult}+#1#{} Mult",
                    "{C:mult}-1{} Mult for every {C:money}$1{} you have",
                    "{C:inactive}(Currently{} {C:mult}#3##2#{} {C:inactive}Mult){}"
                },
            },

             j_morne_forbidden_schematic = { 
                name = "Forbidden Schematic", 
                text = { 
			        "Played {C:attention}4s{} and {C:attention}9s{} give their",
                    "{C:chips}+Chips{} as {C:mult}+Mult{} instead",
                },
            },

              j_morne_smog = { 
                name = 'Smog',
		        text = {
			        "Gains {C:mult}+#2#{} Mult per {C:attention}unscored{} card played,",
                    "Loses all Mult if all played cards {C:attention}score{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
		        },
            },

            j_morne_dopplejoker = { 
                name = 'Dopple-Joker',
		        text = {
			        "After hand is finished scoring,",
			
			        "give {C:attention}first{} scored card",

			        "{C:attention}last{} scored card's suit"
		        },
            },

            j_morne_cardboard_cutout = { 
                name = 'Cardboard Cutout',
		        text = {
			        --[["{C:green,}#1# in #2#{} chance to create a {C:tarot}Tarot{} card",

			        "when a {C:tarot}Tarot{} card is used",

			        "{C:inactive}(Must have room){}"]]
                    "The next {C:attention}#1#{} Jokers {C:attention}sold{} or {C:attention}destroyed{} create an",
                    "{C:uncommon}Uncommon Joker{} with the same {C:attention}Stickers{} and {C:attention}Edition{}",
		        },
            },

            j_morne_eruption = { 
                name = 'Eruption',
		        text = {
			        "Scored cards give {X:mult,C:white}X#1#{} Mult",
			
			        "if there are no {C:attention}other{} cards of the",

                    "same {C:attention}rank{} and {C:attention}suit{} in your full deck",
		        },
            },

            j_morne_apples_to_oranges = { 
                name = 'Apples to Oranges',
		        text = {
			        "Cards scored with {C:diamonds}Diamond{} suit",
			
			        "directly after scored {C:hearts}Heart{} suit" ,
			
			        "give {X:mult,C:white}X#1#{} Mult",
		        },
            },

            j_morne_cyclist = { 
                name = 'Cyclist',
		        text = {
			        "Increase rank of all scored cards",
			
			        "if played hand contains a {C:attention}Straight{}",
		        },
            },


            j_morne_pyromancer = { 
                name = 'Pyromancer',
		        text = {
			        --"Gains {C:mult}+#1#{} Mult per times score {C:attention}exceeds{} the",
			
			        --"{C:attention}Blind{} requirement, max of {C:mult}+#3#{} Mult can be gained at once",

                    --"max {C:mult}+#3#{} Mult per {C:attention}Blind{}",
                    --"capped at {C:attention}five{} times the {C:attention}Blind{} requirement",

                    --"{C:inactive}(Currently {}{C:mult}+#2#{}{C:inactive} Mult){}", 

                    "If played hand exceeds {C:attention}Blind{} requirement,",

                    "apply {C:mult}Red Seal{} to a random played card"


		        },
            },

            j_morne_tenancy = { 
                name = 'Tenancy',
		        text = {

                    --[["{C:attention}Retrigger{} a random scored card",

                    "once for every {C:money}$#1#{} you have",

                    "{C:inactive}(Currently{} {C:attention}#2#{}{C:inactive} #3#){}"]]

                    --[["Earn {C:money}$#1#{} at end of round",

                    "for each empty {C:attention}Joker{} slot",

                    "{s:0.8}Tenancy included{}",

                     "{C:inactive}(Currently {C:money}$#2#{C:inactive})"]]

                    "Scored cards have a",
                    "{C:green,}#1# in #2#{} chance to {C:attention}retrigger{}"



		        },
            },

            j_morne_impractical_joker = { 
                name = "Tonight's Biggest Joker",
		        text = {

                    "Entering the {C:attention}shop{} with {C:money}$#1#{} or less makes",

                    "a random initial {C:attention}card{} or {C:attention}booster pack{} free",


		        },
            },

            j_morne_chuckling_clown = { 
                name = "Chuckling Clown",
		        text = 
                {
                    "{C:attention}Ranks{} that have not scored",
                    "this {C:attention}Blind{} give {C:mult}+#1#{} Mult when scored",
                    "{C:inactive}(Scored: #2#){}"
		        },
            },

            j_morne_dead_weight = { 
                name = "Dead Weight",
		        text = {
                    "If played hand contains a {C:attention}Straight{} the",
                    "{C:attention}lowest-ranked{} scored card becomes a {C:attention}Steel{} card",
		        },
            },

            j_morne_ad_infinitum = { 
                name = "Ad Infinitum",
		        text = {
                    "{C:green,}#1# in #2#{} chance to create a",
                    "{C:spectral}Spectral{} card at the end of round",
                     "{C:inactive}(Chance is the number of 8s scored){}"
		        },
            },

             j_morne_one_armed_bandit = { 
                name = "One-Armed Bandit",
		        text = {
                    "Playing a hand increases {C:attention}listed{} {C:green}probabilities{} by #1#,",
                    "discarding decreases {C:attention}listed{} {C:green}probabilities{} by #1#",
                    "{C:inactive}(Currently {}{C:green}+#2#{}{C:inactive}, resets at the start of Blind){}"
		        },
            },

            j_morne_lone_pawn = { 
                name = "Lone Pawn",
		        text = {
                    "{X:mult,C:white}X#2#{} Mult for each",
                    "{C:attention}#1#{} played this round",
                     "{C:inactive}(Currently {}{X:mult,C:white}X#3#{}{C:inactive} Mult){}"
		        },
            },

            j_morne_nickel_and_dime = { 
                name = "Nickel & Dime",
		        text = {
                    "Played {C:attention}5s{} and {C:attention}10s{} give",
                    "{X:mult,C:white}X#1#{} Mult but cost {C:money}$#2#{}",
		        },
            },

            j_morne_stained_joker = { 
                name = "Stained Joker",
		        text = {
                     "Jokers apply their {C:attention}Edition{} to a",
                    "Joker {C:attention}without{} one when {C:attention}sold{}",
                    "{C:inactive}(Prioritizes other Jokers){}"
		        },
            },

            j_morne_contact_binary = { 
                name = "Contact Binary",
		        text = {
                    "Scored {C:attention}8s{}, {C:attention}4s{}, and {C:attention}2s{} give",
                    "{C:mult}+#1#{} Mult per {C:attention}level{} of played hand",
		        },
            },
            j_morne_sinking_feeling = { 
                name = "Sinking Feeling",
		        text = {
                    "If scored card's {C:chips}+Chips{} is {C:attention}lower{} than",
                    "the {C:attention}previous{} scored card's {C:chips}+Chips{},",
                    "grant the {C:attention}difference{} as {C:mult}+Mult{}"
		        },
            },

            j_morne_striped_paint = { 
                name = "Striped Paint",
		        text = {
                    "{C:hearts}Hearts{} and {C:diamonds}Diamonds{} held in hand",
                    "give {C:mult}+#1#{} Mult",
		        },
            },
        },
        Voucher = {
             v_morne_bushel = { 
                name = "Bushel",
		        text = {
                    "All {C:attention}booster packs{}",
                    "contain an {C:attention}additional{} card",
                    
		        },
            },
            v_morne_cornucopia = { 
                name = "Cornucopia",
		        text = {
                    "Take an {C:attention}additional{} card",
                    "from each {C:attention}booster pack{}",
		        },
            }
        },
        Blind = {
             bl_morne_sift = { 
                name = "The Sift",
		        text = {
                    "#1#, #2#, and #3# are debuffed,",
                    "randomizes after playing hand",
		        },
            },

            bl_morne_morph = { 
                name = "The Morph",
		        text = {
                    "-1 Hand when discarding,",
                    "-1 Discard when playing hand",
                    
		        },
            },

            bl_morne_myriad = { 
                name = "The Myriad",
		        text = {
                    "Hand must contain two",          
                    "or more unique suits to score"
		        },
            },

            bl_morne_smudge = { 
                name = "The Smudge",
		        text = {
                    "{V:1}#1#{} are debuffed,",          
                    "randomizes after playing hand"
		        },
            },

            bl_morne_drab = { 
                name = "The Drab",
		        text = {
                    "Remove enhancements, editions, and seals",          
                    "from played hand before scoring"
		        },
            },

            bl_morne_bile= { 
                name = "The Bile",
		        text = {
                    "Jokers cost {C:money}$1{} when triggered"
		        },
            }
        },
    }
}