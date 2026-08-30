extends Node

const ALL_NPCS := {
	"vendor": {
		"name": "Salesperson",
		"car": 1,
		"is_anomaly": false,
		"ask_text": "My case is stuck under the seats up front — I can't get it out alone, my back's shot. Help me pull it free and there's a lantern in there that's no use to me anyway. Batteries still good, I checked.",
		"tell_text": "He keeps checking the aisle behind him.",
		"give_item": "lantern",
		"give_key_half": ""
	},
	"twins": {
		"name": "Twins",
		"car": 1,
		"is_anomaly": true,
		"ask_text": "You haven't seen our sister, have you? Small, dark coat, she was three cars back and now she isn't. We keep telling each other she's fine. We don't know why we do that.",
		"tell_text": "They both flinch at the word 'sister', like an echo that didn't line up.",
		"give_item": "",
		"give_key_half": ""
	},
	"conductor_aide": {
		"name": "Office Worker",
		"car": 2,
		"is_anomaly": false,
		"ask_text": "I had a case file with me, my kid's photo, everything. It's back where I was sitting, two rows down, I left it. I know it sounds stupid to go back for a photo right now. Can you get it for me?",
		"tell_text": "He's genuinely wincing, favoring one arm.",
		"give_item": "",
		"give_key_half": "a"
	},
	"whisperer": {
		"name": "????????",
		"car": 2,
		"is_anomaly": true,
		"ask_text": "Come closer. I can't be heard from there.Come closer.",
		"tell_text": "It's never quite in the light.",
		"give_item": "",
		"give_key_half": ""
	},
	"panicking_mother": {
		"name": "Panicking Mother",
		"car": 3,
		"is_anomaly": false,
		"ask_text": "Have you seen a little boy? Blue jacket, he's seven, he was holding my hand. Please, just tell me if you see him.",
		"tell_text": "Nothing seems wrong with her at all. That's the strange part.",
		"give_item": "",
		"give_key_half": ""
	},
	"injured_man": {
		"name": "Injured Man",
		"car": 4,
		"is_anomaly": true,
		"ask_text": "I twisted my ankle back in the last car, I don't think I can walk on it alone. Please, just let me lean on you.",
		"tell_text": "He's sweating. It isn't warm in here.",
		"give_item": "",
		"give_key_half": ""
	},
	"knitting_woman": {
		"name": "Old Woman Knitting",
		"car": 4,
		"is_anomaly": false,
		"ask_text": "Sit with me a moment. Just a moment. I've been on this train forty years and I have never once been afraid of it until tonight. Humor an old woman.",
		"tell_text": "Her needles moves, but her hands aren't quite moving with them.",
		"give_item": "",
		"give_key_half": ""
	},
	"blue_jacket_boy": {
		"name": "Boy in the Blue Jacket",
		"car": 4,
		"is_anomaly": false,
		"ask_text": "...",
		"tell_text": "He matches her description exactly. Too exactly.",
		"give_item": "",
		"give_key_half": ""
	},
	"guard": {
		"name": "The Guard",
		"car": 5,
		"is_anomaly": false,
		"ask_text": "Vouch for me when we reach the gate, I will give you the other half of the key. I'm not a threat.",
		"tell_text": "Tired. Blunt. Nothing hidden that you can see.",
		"give_item": "",
		"give_key_half": "b"
	},
	"smiling_man": {
		"name": "Smiling Man",
		"car": 5,
		"is_anomaly": true,
		"ask_text": "Everything's fine, isn't it? Just say it's fine.",
		"tell_text": "The smile doesn't break. Not even to speak.",
		"give_item": "",
		"give_key_half": ""
	}
}
