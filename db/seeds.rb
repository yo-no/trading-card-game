
# Card.create(
#             name: "Calming Breeze",
#             cost: 0,
#             attack: 0,
#             description: "Before the Great War, Earth's atmosphere generated wind naturally.",
#             action_text: "a soothing wind enhances your calm"
#             )

# Card.create(
#             name: "Useless Thought",
#             cost: 0,
#             attack: 0,
#             description: "Mr. Madison, what you’ve just said is one of the most insanely idiotic things I have ever heard. At no point in your rambling, incoherent response were you even close to anything that could be considered a rational thought. Everyone in this room is now dumber for having listened to it. I award you no points, and may God have mercy on your soul.",
#             action_text: "if tomatoes are a fruit, is ketchup a smoothie?"
#             )

# Card.create(
#             name: "Lil Robot",
#             cost: 1,
#             attack: 1,
#             description: "Tiny, but metal.",
#             action_text: "lil robot kicks your shin. ouch."
#             )

# Card.create(
#             name: "Petty Crime",
#             cost: 1,
#             attack: 1,
#             description: "Even though most theft in the net these days, there are still some shady characters scraping by off the chips in your wallet.",
#             action_text: "all your bitcoin are belong to us."
#             )

# Card.create(
#             name: "Resistance Recruit",
#             cost: 2,
#             attack: 2,
#             description: "'We hold this myth to be potential, not self-evident but equational. Another Dimension of another kind of Living Life'",
#             action_text: "if it's war you want, then war you shall have."
#             )

# Card.create(
#             name: "Polymorphic Blob",
#             cost: 2,
#             attack: 2,
#             description: "It's unclear what reality these creatures originate from or how they came to exist in our own.",
#             action_text: "a sticky slap from an ambiguous appendage..."
#             )

# Card.create(
#             name: "D.A.W.G. Catcher",
#             cost: 2,
#             attack: 2,
#             description: "A crooked and lonely man.",
#             action_text: "you're zapped by the electro-net."
#             )

# Card.create(
#             name: "Psychokinesis",
#             cost: 3,
#             attack: 3,
#             description: "In the new times, some children begin bending spoons barely out of pre-conditioning.",
#             action_text: "you're barraged with an assortment of old world cutlery."
#             )

# Card.create(
#             name: "Resistance Major",
#             cost: 3,
#             attack: 3,
#             description: "'Those who will not dance will have to be shot'",
#             action_text: "shots fired."
#             )

# Card.create(
#             name: "Biohacker",
#             cost: 3,
#             attack: 3,
#             description: "A somewhat unhinged hobbiest. Dabbling in the arts of defying god.",
#             action_text: "fake limbs. real pain."
#             )

# Card.create(
#             name: "D.A.W.G.",
#             cost: 3,
#             attack: 3,
#             description: "What began as a mishap in an underground lab has become an indispensable asset to the resistance.",
#             action_text: "there's bites, and then there's bites..."
#             )

# Card.create(
#             name: "D.A.W.G. Glider",
#             cost: 4,
#             attack: 4,
#             description: "We're not flying, we're falling with style.",
#             action_text: "death from above"
#             )

# Card.create(
#             name: "L.O.T.U.S.",
#             cost: 4,
#             attack: 4,
#             description: "They say L.O.T.U.S. was developed in the long-dead language named for a precious gem in the old world.",
#             action_text: "major malfunction"
#             )
# Card.create(
#             name: "Field Bomber",
#             cost: 4,
#             attack: 4,
#             description: "Explosions are my specialty.",
#             action_text: "kobe"
#             )

# Card.create(
#             name: "Cyber Gladiator",
#             cost: 5,
#             attack: 5,
#             description: "A killer who love children. One who is well-skilled in destruction, as well as building",
#             action_text: "mad villainy"
#             )
# Card.create(
#             name: "Resistance Mecha",
#             cost: 5,
#             attack: 5,
#             description: "As man himself becomes more metal, there's something comforting about the ease at which the mecha pilot moves his machine.",
#             action_text: "pew pew pew pew"
#             )
# Card.create(
#             name: "Sgt. Ra",
#             cost: 6,
#             attack: 6,
#             description: "'If death is the absence of life, then death's death is life.'",
#             action_text: "space is the place"
#             )
# Card.create(
#             name: "Dr. Sakamoto",
#             cost: 6,
#             attack: 6,
#             description: "Few men have seen the mad scientist said to be behind the underground labs of Technopolis.",
#             action_text: "it rains a thousand knives"
#             )
# Card.create(
#             name: "Yggdrasil",
#             cost: 7,
#             attack: 7,
#             description: "Here, time is cyclical rather than linear. The present returns to the past, where it retroactively changes the past. The new past, in turn, is reabsorbed into a new present, whose originality is an outgrowth of the give-and-take between the waters of the well and the the waters of the tree.",
#             action_text: "the one who puts to sleep"
#             )
# Card.create(
#             name: "Divine Intervention",
#             cost: 8,
#             attack: 8,
#             description: "Because reasons.",
#             action_text: "giveth and taketh away"
#             )

# cards = Card.all
# cards.each do |card|
#   MyCard.create(
#                 user_id: 1,
#                 card_id: card.id,
#                 deck: true
#                 )
#   MyCard.create(
#                 user_id: 2,
#                 card_id: card.id,
#                 deck: true
#                 )
# end
