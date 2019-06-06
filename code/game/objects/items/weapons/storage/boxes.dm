/*
 *	Everything derived from the common cardboard box.
 *	Basically everything except the original is a kit (starts full).
 *
 *	Contains:
 *		Empty box, starter boxes (survival/engineer),
 *		Latex glove and sterile mask boxes,
 *		Syringe, beaker, dna injector boxes,
 *		Blanks, flashbangs, and EMP grenade boxes,
 *		Tracking and chemical implant boxes,
 *		Prescription glasses and drinking glass boxes,
 *		Condiment bottle and silly cup boxes,
 *		Donkpocket and monkeycube boxes,
 *		ID and security PDA cart boxes,
 *		Handcuff, sec/detective gear, mousetrap, and pillbottle boxes,
 *		Snap-pops and matchboxes,
 *		Replacement light boxes.
 *
 *		For syndicate call-ins see uplink_kits.dm
 */

/obj/item/weapon/storage/box
	name = "box"
	desc = "It's just an ordinary box."
	icon = 'icons/obj/storage/smallboxes.dmi'
	icon_state = "box"
	item_state = "syringe_kit"
	foldable = /obj/item/stack/sheet/cardboard	//BubbleWrap
	starting_materials = list(MAT_CARDBOARD = 3750)
	w_type=RECYK_MISC

	autoignition_temperature = 522 // Kelvin
	fire_fuel = 2

/obj/item/weapon/storage/box/large
	name = "large box"
	desc = "You could build a fort with this."
	icon_state = "largebox"
	item_state = "largebox"
	w_class = W_CLASS_LARGE // Big, bulky.
	foldable = /obj/item/stack/sheet/cardboard
	foldable_amount = 4 // Takes 4 to make. - N3X
	starting_materials = list(MAT_CARDBOARD = 15000)
	storage_slots = 21
	max_combined_w_class = 42 // 21*2

	autoignition_temperature = 530 // Kelvin
	fire_fuel = 3

/obj/item/weapon/storage/box/surveillance
	name = "\improper DromedaryCo packet"
	desc = "A packet of six imported DromedaryCo cigarettes. A label on the packaging reads: \"Wouldn't a slow death make a change?\""
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "Dpacket"
	item_state = "Dpacket"
	w_class = W_CLASS_TINY
	foldable = null

/obj/item/weapon/storage/box/surveillance/New()
	..()
	for(var/atom/A in src)
		qdel(A)
	for(var/i = 1 to 5)
		new /obj/item/device/camera_bug(src)

/obj/item/weapon/storage/box/survival
	name = "survival equipment box"
	desc = "Makes braving the hazards of space a little bit easier."
	icon_state = "box_emergency"

/obj/item/weapon/storage/box/survival/New()
	..()
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/weapon/tank/emergency_oxygen(src)
	new /obj/item/stack/medical/bruise_pack/bandaid(src)

/obj/item/weapon/storage/box/survival/vox
	icon_state = "box_vox"

/obj/item/weapon/storage/box/survival/vox/New()
	..()
	for(var/atom/A in src)
		qdel(A)
	new /obj/item/clothing/mask/breath/vox(src)
	new /obj/item/weapon/tank/emergency_nitrogen(src)
	new /obj/item/stack/medical/bruise_pack/bandaid(src)

/obj/item/weapon/storage/box/survival/engineer
	icon_state = "box_eva"

/obj/item/weapon/storage/box/survival/engineer/New()
	..()
	for(var/atom/A in src)
		qdel(A)
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/weapon/tank/emergency_oxygen/engi(src)
	new /obj/item/stack/medical/bruise_pack/bandaid(src)

/obj/item/weapon/storage/box/survival/ert
	icon_state = "box_ERT"

/obj/item/weapon/storage/box/survival/ert/New()
	..()
	for(var/atom/A in src)
		qdel(A)
	new /obj/item/clothing/mask/gas/ert(src)
	new /obj/item/weapon/tank/emergency_oxygen/double(src)
	new /obj/item/stack/medical/bruise_pack/bandaid(src)

/obj/item/weapon/storage/box/priority_care
	name = "priority care parcel"
	desc = "A small parcel of miscellaneous junk Nanotrasen hands out to their most requested employees."
	icon_state = "nt"

/obj/item/weapon/storage/box/priority_care/New()
	..()
	new /obj/item/weapon/spacecash/c100(src)
	new /obj/item/weapon/reagent_containers/food/snacks/donkpocket/self_heating(src)
	for(var/i in 1 to 3)
		var/toSpawn = pick(
			/obj/item/voucher/free_item/donk,
			/obj/item/voucher/free_item/hot_drink,
			/obj/item/voucher/free_item/glowing,
			/obj/item/voucher/free_item/snack,
			/obj/item/mounted/poster,
			/obj/item/weapon/pen/NT,
			/obj/item/clothing/accessory/medal/participation,
			/obj/item/weapon/reagent_containers/food/drinks/americup,
			/obj/item/weapon/lighter/NT,
			25;/obj/item/toy/syndicateballoon/ntballoon,
			25;/obj/item/weapon/reagent_containers/food/snacks/chococoin,
			25;/obj/item/weapon/tank/emergency_oxygen/engi,
			25;/obj/item/weapon/reagent_containers/hypospray/autoinjector,
			25;/obj/item/weapon/reagent_containers/food/drinks/thermos/full
		)
		new toSpawn(src)

/obj/item/weapon/storage/box/gloves
	name = "box of latex gloves"
	desc = "A box containing white latex gloves. gloves. gloves."
	icon_state = "latex"

/obj/item/weapon/storage/box/gloves/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/clothing/gloves/latex(src)

/obj/item/weapon/storage/box/bgloves
	name = "box of black gloves"
	desc = "A box containing black gloves."
	icon_state = "bgloves"

/obj/item/weapon/storage/box/bgloves/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/clothing/gloves/black(src)

/obj/item/weapon/storage/box/sunglasses
	name = "box of sunglasses"
	desc = "A box containing sunglasses."
	icon_state = "sunglass"

/obj/item/weapon/storage/box/sunglasses/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/clothing/glasses/sunglasses(src)

/obj/item/weapon/storage/box/masks
	name = "sterile masks"
	desc = "This box contains sterile masks."
	icon_state = "sterile"

/obj/item/weapon/storage/box/masks/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/clothing/mask/surgical(src)


/obj/item/weapon/storage/box/syringes
	name = "syringes"
	desc = "A box containing syringes. A reminder label warns of syringes becoming potential biohazards when not properly sanitized."
	icon_state = "syringe"

/obj/item/weapon/storage/box/syringes/New()
	..()
	for(var/i = 1 to 6)
		new /obj/item/weapon/reagent_containers/syringe(src)
	new /obj/item/weapon/reagent_containers/syringe/giant(src)

/obj/item/weapon/storage/box/beakers
	name = "beaker box"
	icon_state = "beaker"

/obj/item/weapon/storage/box/beakers/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/reagent_containers/glass/beaker(src)

/obj/item/weapon/storage/box/injectors
	name = "\improper DNA injectors"
	desc = "This box contains injectors it seems."
	icon_state = "box_injector"

/obj/item/weapon/storage/box/injectors/New()
	..()
	for(var/i = 1 to 3)
		new /obj/item/weapon/dnainjector/nofail/h2m(src)
	for(var/i = 1 to 3)
		new /obj/item/weapon/dnainjector/nofail/m2h(src)


/obj/item/weapon/storage/box/blanks
	name = "box of blank shells"
	desc = "It has a picture of a gun and several warning symbols on the front."

/obj/item/weapon/storage/box/blanks/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/ammo_casing/shotgun/blank(src)



/obj/item/weapon/storage/box/flashbangs
	name = "box of flashbangs (WARNING)"
	desc = "<FONT color=red><B>WARNING: Do not use without reading these preautions!</B></FONT>\n<B>These devices are extremely dangerous and can cause blindness or deafness if used incorrectly.</B>\nThe chemicals contained in these devices have been tuned for maximal effectiveness and due to\nextreme safety precuaiotn shave been incased in a tamper-proof pack. DO NOT ATTEMPT TO OPEN\nFLASH WARNING: Do not use continually. Excercise extreme care when detonating in closed spaces.\n\tMake attemtps not to detonate withing range of 2 meters of the intended target. It is imperative\n\tthat the targets visit a medical professional after usage. Damage to eyes increases extremely per\n\tuse and according to range. Glasses with flash resistant filters DO NOT always work on high powered\n\tflash devices such as this. <B>EXERCISE CAUTION REGARDLESS OF CIRCUMSTANCES</B>\nSOUND WARNING: Do not use continually. Visit a medical professional if hearing is lost.\n\tThere is a slight chance per use of complete deafness. Exercise caution and restraint.\nSTUN WARNING: If the intended or unintended target is too close to detonation the resulting sound\n\tand flash have been known to cause extreme sensory overload resulting in temporary\n\tincapacitation.\n<B>DO NOT USE CONTINUALLY</B>\nOperating Directions:\n\t1. Pull detonnation pin. <B>ONCE THE PIN IS PULLED THE GRENADE CAN NOT BE DISARMED!</B>\n\t2. Throw grenade. <B>NEVER HOLD A LIVE FLASHBANG</B>\n\t3. The grenade will detonste 10 seconds hafter being primed. <B>EXCERCISE CAUTION</B>\n\t-<B>Never prime another grenade until after the first is detonated</B>\nNote: Usage of this pyrotechnic device without authorization is an extreme offense and can\nresult in severe punishment upwards of <B>10 years in prison per use</B>.\n\nDefault 3 second wait till from prime to detonation. This can be switched with a screwdriver\nto 10 seconds.\n\nCopyright of Nanotrasen Industries- Military Armnaments Division\nThis device was created by Nanotrasen Labs a member of the Expert Advisor Corporation"
	icon_state = "flashbang"

/obj/item/weapon/storage/box/flashbangs/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/grenade/flashbang(src)

/obj/item/weapon/storage/box/smokebombs
	name = "box of smokebombs"
	icon_state = "smokebomb"

/obj/item/weapon/storage/box/smokebombs/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/grenade/smokebomb(src)

/obj/item/weapon/storage/box/stickybombs
	name = "box of stickybombs"
	icon_state = "stickybomb"

/obj/item/weapon/storage/box/stickybombs/New()
	..()
	for(var/i = 1 to 24)
		new /obj/item/stickybomb(src)

/obj/item/weapon/storage/box/emps
	name = "emp grenades"
	desc = "A box containing emp grenades."
	icon_state = "flashbang"

/obj/item/weapon/storage/box/emps/New()
	..()
	for(var/i = 1 to 5)
		new /obj/item/weapon/grenade/empgrenade(src)

/obj/item/weapon/storage/box/wind
	name = "wind grenades"
	desc = "A box containing wind grenades."
	icon_state = "flashbang"

/obj/item/weapon/storage/box/wind/New()
	..()
	for(var/i = 1 to 3)
		new /obj/item/weapon/grenade/chem_grenade/wind(src)

/obj/item/weapon/storage/box/foam
	name = "metal foam grenades"
	desc = "A box containing metal foam grenades."
	icon_state = "metalfoam"

/obj/item/weapon/storage/box/foam/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/grenade/chem_grenade/metalfoam(src)

/obj/item/weapon/storage/box/boxen
	name = "boxen ranching kit"
	desc = "Everything you need to engage in your own horrific flesh cloning."

/obj/item/weapon/storage/box/boxen/New()
	..()
	new /obj/item/weapon/circuitboard/box_cloner(src)
	new /obj/item/weapon/reagent_containers/food/snacks/meat/box(src)
	new /obj/item/weapon/reagent_containers/food/snacks/meat/box(src)

/obj/item/weapon/storage/box/trackimp
	name = "tracking implant kit"
	desc = "Box full of scum-bag tracking utensils."
	icon_state = "implant"

/obj/item/weapon/storage/box/trackimp/New()
	..()
	for(var/i = 1 to 4)
		new /obj/item/weapon/implantcase/tracking(src)
	new /obj/item/weapon/implanter(src)
	new /obj/item/weapon/implantpad(src)
	new /obj/item/weapon/locator(src)

/obj/item/weapon/storage/box/chemimp
	name = "chemical implant kit"
	desc = "Box of stuff used to implant chemicals."
	icon_state = "implant"

/obj/item/weapon/storage/box/chemimp/New()
	..()
	for(var/i = 1 to 5)
		new /obj/item/weapon/implantcase/chem(src)
	new /obj/item/weapon/implanter(src)
	new /obj/item/weapon/implantpad(src)

/obj/item/weapon/storage/box/bolas
	name = "bolas box"
	desc = "Box of bolases. Make sure to take them out before throwing them."
	icon_state = "bolas"

/obj/item/weapon/storage/box/bolas/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/legcuffs/bolas(src)


/obj/item/weapon/storage/box/rxglasses
	name = "prescription glasses"
	desc = "This box contains nerd glasses."
	icon_state = "glasses"

/obj/item/weapon/storage/box/rxglasses/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/clothing/glasses/regular(src)

/obj/item/weapon/storage/box/drinkingglasses
	name = "box of drinking glasses"
	desc = "It has a picture of drinking glasses on it."

/obj/item/weapon/storage/box/drinkingglasses/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/reagent_containers/food/drinks/drinkingglass(src)

/obj/item/weapon/storage/box/cdeathalarm_kit
	name = "Death Alarm Kit"
	desc = "Box of stuff used to implant death alarms."
	icon_state = "implant"
	item_state = "syringe_kit"

/obj/item/weapon/storage/box/cdeathalarm_kit/New()
	..()
	new /obj/item/weapon/implanter(src)
	for(var/i = 1 to 7)
		new /obj/item/weapon/implantcase/death_alarm(src)

/obj/item/weapon/storage/box/condimentbottles
	name = "box of condiment bottles"
	desc = "It has a large ketchup smear on it."

/obj/item/weapon/storage/box/condimentbottles/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/reagent_containers/food/condiment(src)



/obj/item/weapon/storage/box/cups
	name = "box of paper cups"
	desc = "It has a picture of a paper cup on the front."

/obj/item/weapon/storage/box/cups/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/reagent_containers/food/drinks/sillycup(src)


/obj/item/weapon/storage/box/donkpockets
	name = "box of donk-pockets"
	desc = "<span class='notice'>Instructions: Heat in microwave. Product will cool if not eaten within seven minutes.</span>"
	icon_state = "donk_kit"
	var/pocket_amount = 6

/obj/item/weapon/storage/box/donkpockets/New()
	..()
	for(var/i=0,i<pocket_amount,i++)
		new /obj/item/weapon/reagent_containers/food/snacks/donkpocket(src)

/obj/item/weapon/storage/box/donkpockets/random_amount/New()
	pocket_amount = rand(1,6)

	..()

/obj/item/weapon/storage/box/monkeycubes
	name = "monkey cube box"
	desc = "Drymate brand monkey cubes. Just add water!"
	icon = 'icons/obj/food.dmi'
	icon_state = "monkeycubebox"
	storage_slots = 7
	can_only_hold = list("/obj/item/weapon/reagent_containers/food/snacks/monkeycube")

/obj/item/weapon/storage/box/monkeycubes/New()
	..()
	if(src.type == /obj/item/weapon/storage/box/monkeycubes)
		for(var/i = 1; i <= 6; i++)
			new /obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped(src)

/obj/item/weapon/storage/box/monkeycubes/farwacubes
	name = "farwa cube box"
	desc = "Drymate brand farwa cubes, shipped from Ahdomai. Just add water!"

/obj/item/weapon/storage/box/monkeycubes/farwacubes/New()
	..()
	for(var/i = 1; i <= 5; i++)
		new /obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/farwacube(src)

/obj/item/weapon/storage/box/monkeycubes/stokcubes
	name = "stok cube box"
	desc = "Drymate brand stok cubes, shipped from Moghes. Just add water!"

/obj/item/weapon/storage/box/monkeycubes/stokcubes/New()
	..()
	for(var/i = 1; i <= 5; i++)
		new /obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/stokcube(src)

/obj/item/weapon/storage/box/monkeycubes/neaeracubes
	name = "neaera cube box"
	desc = "Drymate brand neaera cubes, shipped from Jargon 4. Just add water!"

/obj/item/weapon/storage/box/monkeycubes/neaeracubes/New()
	..()
	for(var/i = 1; i <= 5; i++)
		new /obj/item/weapon/reagent_containers/food/snacks/monkeycube/wrapped/neaeracube(src)

/obj/item/weapon/storage/box/ids
	name = "spare IDs"
	desc = "Contains blank identification cards."
	icon_state = "id"

/obj/item/weapon/storage/box/ids/New()
	..()
	for(var/i = 0, i < 7, i++)
		new /obj/item/weapon/card/id(src)

/obj/item/weapon/storage/box/seccarts
	name = "Spare R.O.B.U.S.T. Cartridges"
	desc = "A box full of R.O.B.U.S.T. Cartridges, used by Security."
	icon_state = "pda"

/obj/item/weapon/storage/box/seccarts/New()
	..()
	for(var/i=0,i<7,i++)
		new /obj/item/weapon/cartridge/security(src)


/obj/item/weapon/storage/box/handcuffs
	name = "spare handcuffs"
	desc = "A box full of handcuffs."
	icon_state = "handcuff"

/obj/item/weapon/storage/box/handcuffs/New()
	..()
	for(var/i=0,i<7,i++)
		new /obj/item/weapon/handcuffs(src)

/obj/item/weapon/storage/box/large/securitygear
	name = "security essentials"
	desc = "A box containing essential security officer equipment. It has a piece of paper with the letters SEC written on it taped to one side."
	icon_state = "largebox_sec"

/obj/item/weapon/storage/box/large/securitygear/New()
	..()
	new /obj/item/device/radio/headset/headset_sec(src)
	var/glasses = pick(/obj/item/clothing/glasses/sunglasses/sechud/prescription, /obj/item/clothing/glasses/sunglasses/sechud)
	new glasses(src)
	new /obj/item/clothing/gloves/black(src)
	new /obj/item/weapon/storage/belt/security(src)
	new /obj/item/device/flashlight/tactical(src)
	new /obj/item/clothing/accessory/holster/knife/boot/preloaded/tactical(src)
	new /obj/item/device/gps/secure(src)
	new /obj/item/device/flash(src)
	new /obj/item/weapon/grenade/flashbang(src)
	new /obj/item/weapon/melee/baton/loaded(src)
	new /obj/item/weapon/gun/energy/taser(src)
	new /obj/item/weapon/reagent_containers/spray/pepper(src)
	new /obj/item/taperoll/police(src)
	new /obj/item/device/hailer(src)

/obj/item/weapon/storage/box/large/detectivegear
	name = "detective essentials"
	desc = "A box containing essential detective officer equipment. It has a piece of paper with the letters DET written on it taped to one side."
	icon_state = "largebox_det"

/obj/item/weapon/storage/box/large/detectivegear/New()
	..()
	new /obj/item/device/radio/headset/headset_sec(src)
	var/glasses = pick(/obj/item/clothing/glasses/sunglasses/sechud/prescription, /obj/item/clothing/glasses/sunglasses/sechud)
	new glasses(src)
	new /obj/item/clothing/gloves/black(src)
	new /obj/item/device/gps/secure(src)
	new /obj/item/ammo_storage/box/c38(src)
	new /obj/item/ammo_storage/box/c38(src)
	new /obj/item/ammo_storage/speedloader/c38(src)
	new /obj/item/weapon/storage/box/evidence(src)
	new /obj/item/device/detective_scanner(src)
	new /obj/item/binoculars(src)
	new /obj/item/weapon/storage/box/surveillance(src)
	new /obj/item/device/handtv(src)

/obj/item/weapon/storage/box/mousetraps
	name = "box of Pest-B-Gon Mousetraps"
	desc = "<span class='userdanger'>WARNING: Keep out of reach of children.</span>"
	icon_state = "mousetraps"

/obj/item/weapon/storage/box/mousetraps/New()
	..()
	for(var/i=0,i<6,i++)
		new /obj/item/device/assembly/mousetrap(src)

/obj/item/weapon/storage/box/pillbottles
	name = "box of pill bottles"
	desc = "It has pictures of pill bottles on its front."

/obj/item/weapon/storage/box/pillbottles/New()
	..()
	for(var/i=0,i<7,i++)
		new /obj/item/weapon/storage/pill_bottle(src)

/obj/item/weapon/storage/box/lethalshells
	name = "lethal shells"
	icon_state = "lethal shells"
	storage_slots = 16

/obj/item/weapon/storage/box/lethalshells/New()
	..()
	for(var/i in 1 to 16)
		new /obj/item/ammo_casing/shotgun(src)

/obj/item/weapon/storage/box/beanbagshells
	name = "bean bag shells"
	icon_state = "bean bag shells"
	storage_slots = 16

/obj/item/weapon/storage/box/beanbagshells/New()
	..()
	for(var/i in 1 to 16)
		new /obj/item/ammo_casing/shotgun/beanbag(src)

/obj/item/weapon/storage/box/stunshells
	name = "stun shells"
	icon_state = "stun shells"
	storage_slots = 16

/obj/item/weapon/storage/box/stunshells/New()
	..()
	for(var/i in 1 to 16)
		new /obj/item/ammo_casing/shotgun/stunshell(src)

/obj/item/weapon/storage/box/dartshells
	name = "shotgun darts"
	icon_state = "dart shells"
	storage_slots = 16

/obj/item/weapon/storage/box/dartshells/New()
	..()
	for(var/i in 1 to 16)
		new /obj/item/ammo_casing/shotgun/dart(src)

/obj/item/weapon/storage/box/buckshotshells
	name = "buckshot shells"
	icon_state = "lethal shells"
	storage_slots = 16

/obj/item/weapon/storage/box/buckshotshells/New()
	..()
	for(var/i in 1 to 16)
		new /obj/item/ammo_casing/shotgun/buckshot(src)

/obj/item/weapon/storage/box/labels
	name = "label roll box"
	desc = "A box of refill rolls for a hand labeler."
	icon_state = "labels"

/obj/item/weapon/storage/box/labels/New()
	..()
	for(var/i=1; i <= storage_slots; i++)
		new /obj/item/device/label_roll(src)

/obj/item/weapon/storage/box/labels
	name = "label roll box"
	desc = "A box of refill rolls for a hand labeler."
	icon_state = "labels"

/obj/item/weapon/storage/box/labels/New()
	..()
	for(var/i=1; i <= storage_slots; i++)
		new /obj/item/device/label_roll(src)

/obj/item/weapon/storage/box/wreath/wreath_bow
	name = "wreath (bow) box"
	desc = "Just add hands for Christmas."
	icon_state = "wreath_bow"

/obj/item/weapon/storage/box/wreath/wreath_bow/New()
	..()
	for(var/i=1; i <= storage_slots; i++)
		new /obj/item/mounted/frame/wreath/wreath_bow(src)

/obj/item/weapon/storage/box/wreath/wreath_nobow
	name = "wreath (holly) box"
	desc = "Emergency Christmas supplies."
	icon_state = "wreath_nobow"

/obj/item/weapon/storage/box/wreath/wreath_nobow/New()
	..()
	for(var/i=1; i <= storage_slots; i++)
		new /obj/item/mounted/frame/wreath/wreath_nobow(src)

/obj/item/weapon/storage/box/snappops
	name = "snap pop box"
	desc = "Eight wrappers of fun! Ages 8 and up. Not suitable for children."
	icon = 'icons/obj/toy.dmi'
	icon_state = "spbox"
	storage_slots = 8
	can_only_hold = list("/obj/item/toy/snappop")

/obj/item/weapon/storage/box/snappops/New()
	..()
	for(var/i=1; i <= storage_slots; i++)
		new /obj/item/toy/snappop(src)

/obj/item/weapon/storage/box/syndicatefake/space
	name = "Space Suit and Helmet Replica"
	icon_state = "box_of_doom"

/obj/item/weapon/storage/box/syndicatefake/space/New()
	..()
	new /obj/item/clothing/suit/syndicatefake(src)
	new /obj/item/clothing/head/syndicatefake(src)

/obj/item/weapon/storage/box/syndicatefake/ninja
	name = "Ninja Suit and Hood Replica"
	icon_state = "box_of_doom"

/obj/item/weapon/storage/box/syndicatefake/ninja/New()
	..()
	new /obj/item/clothing/suit/spaceninjafake(src)
	new /obj/item/clothing/head/spaceninjafake(src)

/obj/item/weapon/storage/box/autoinjectors
	name = "box of injectors"
	desc = "Contains autoinjectors."
	icon_state = "syringe"

/obj/item/weapon/storage/box/autoinjectors/New()
	..()
	for (var/i; i < storage_slots; i++)
		new /obj/item/weapon/reagent_containers/hypospray/autoinjector(src)

/obj/item/weapon/storage/box/mugs
	name = "box of mugs"
	desc = "It's a box of mugs."
	icon_state = "box_mug"

/obj/item/weapon/storage/box/mugs/New()
	..()
	for(var/i=0,i<6,i++)
		new /obj/item/weapon/reagent_containers/food/drinks/mug(src)

// TODO Change this to a box/large. - N3X
/obj/item/weapon/storage/box/lights
	name = "replacement bulbs"
	icon_state = "light"
	desc = "This box is shaped on the inside so that only light tubes and bulbs fit."
	item_state = "syringe_kit"
	foldable = /obj/item/stack/sheet/cardboard //BubbleWrap
	storage_slots=21
	can_only_hold = list("/obj/item/weapon/light/tube", "/obj/item/weapon/light/bulb")
	max_combined_w_class = 21
	use_to_pickup = 1 // for picking up broken bulbs, not that most people will try

/obj/item/weapon/storage/box/lights/bulbs/New()
	..()
	for(var/i = 0; i < 21; i++)
		new /obj/item/weapon/light/bulb(src)

/obj/item/weapon/storage/box/lights/tubes
	name = "replacement tubes"
	icon_state = "lighttube"

/obj/item/weapon/storage/box/lights/tubes/New()
	..()
	for(var/i = 0; i < 21; i++)
		new /obj/item/weapon/light/tube(src)

/obj/item/weapon/storage/box/lights/mixed
	name = "replacement lights"
	icon_state = "lightmixed"

/obj/item/weapon/storage/box/lights/mixed/New()
	..()
	for(var/i = 0; i < 14; i++)
		new /obj/item/weapon/light/tube(src)
	for(var/i = 0; i < 7; i++)
		new /obj/item/weapon/light/bulb(src)

/obj/item/weapon/storage/box/lights/tubes/New()
	..()
	for(var/i = 0; i < 21; i++)
		new /obj/item/weapon/light/tube(src)

/obj/item/weapon/storage/box/lights/he
	name = "high efficiency lights"
	icon_state = "lightmixed"

/obj/item/weapon/storage/box/lights/he/New()
	..()
	for(var/i = 0; i < 14; i++)
		new /obj/item/weapon/light/tube/he(src)
	for(var/i = 0; i < 7; i++)
		new /obj/item/weapon/light/bulb/he(src)

/obj/item/weapon/storage/box/inflatables
	name = "inflatable barrier box"
	desc = "Contains inflatable walls and doors. Specially designed for space-efficient packing of deflated structures."
	icon_state = "inf_box"
	can_only_hold = list(
		"/obj/item/inflatable/door",
		"/obj/item/inflatable/wall")
	fits_max_w_class = W_CLASS_MEDIUM
	max_combined_w_class = 21

/obj/item/weapon/storage/box/inflatables/New()
	..()
	for(var/i = 1 to 3)
		new /obj/item/inflatable/door(src)
	for(var/i = 1 to 4)
		new /obj/item/inflatable/wall(src)

/obj/item/weapon/storage/box/ornaments
	name = "box of ornaments"
	desc = "A box of seven glass Christmas ornaments. Color not included."
	icon_state = "ornament_box"
	foldable = null
	starting_materials = list(MAT_GLASS = 2500)		//needed for autolathe production

/obj/item/weapon/storage/box/ornaments/New()
	..()
	for(var/i = 1 to 6)
		new /obj/item/ornament(src)
	if(prob(10))
		new /obj/item/ornament/topper(src)
	else
		new /obj/item/ornament(src)

/obj/item/weapon/storage/box/ornaments/teardrop_ornaments
	name = "box of teardrop ornaments"
	desc = "A box of seven teardrop-shaped glass Christmas ornaments. Color not included."
	icon_state = "teardrop_ornament_box"

/obj/item/weapon/storage/box/ornaments/teardrop_ornaments/New()
	..()
	for(var/atom/A in src)
		qdel(A)
	for(var/i = 1 to 7)
		new /obj/item/ornament/teardrop(src)

/obj/item/weapon/storage/box/botanydisk
	name = "flora disk box"
	desc = "A box of flora data disks."
	icon_state = "botanydisk"

/obj/item/weapon/storage/box/botanydisk/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/disk/botany(src)

/obj/item/weapon/storage/box/holobadge
	name = "holobadge box"
	desc = "A box containing holobadges."
	icon_state = "box_badge"

/obj/item/weapon/storage/box/holobadge/New()
	..()
	for(var/i = 1 to 4)
		new /obj/item/clothing/accessory/holobadge(src)
	new /obj/item/clothing/accessory/holobadge/cord(src)
	new /obj/item/clothing/accessory/holobadge/cord(src)

/obj/item/weapon/storage/box/spellbook
	name = "Spellbook Bundle"
	desc = "High quality discount spells! This bundle is non-refundable. The end user is solely liable for any damages arising from misuse of these products."

/obj/item/weapon/storage/box/spellbook/New()
	..()
	var/list/possible_books = typesof(/obj/item/weapon/spellbook/oneuse)
	possible_books -= /obj/item/weapon/spellbook/oneuse
	possible_books -= /obj/item/weapon/spellbook/oneuse/charge
	for(var/i =1; i <= 7; i++)
		var/randombook = pick(possible_books)
		var/book = new randombook(src)
		src.contents += book
		possible_books -= randombook

/obj/item/weapon/storage/box/spellbook/random/New()
	..()
	var/randomsprite = pick("a","b")
	icon_state = "wizbox-[randomsprite]"

/obj/item/weapon/storage/box/chrono_grenades
	name = "box of chrono grenades"
	desc = "A box of seven experimental chrono grenades."
	icon_state = "chrono_grenade"

/obj/item/weapon/storage/box/chrono_grenades/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/weapon/grenade/chronogrenade(src)

/obj/item/weapon/storage/box/balloons
	name = "box of balloons"
	desc = "A box containing seven balloons of various colors."
	icon_state = "balloon_box"

/obj/item/weapon/storage/box/balloons/New()
	..()
	for(var/i = 1 to 7)
		new /obj/item/toy/balloon(src)

/obj/item/weapon/storage/box/chrono_grenades/future
	icon_state = "future_grenade"

/obj/item/weapon/storage/box/chrono_grenades/future/New()
	..()
	for(var/atom/A in src)
		qdel(A)
	for(var/i = 1 to 7)
		new /obj/item/weapon/grenade/chronogrenade/future(src)

/obj/item/weapon/storage/box/balloons/long
	name = "box of long balloons"
	desc = "A box containing seven long balloons of various colors."
	icon_state = "long_balloon_box"

/obj/item/weapon/storage/box/balloons/long/New()
	..()
	for(var/atom/A in src)
		qdel(A)
	for(var/i = 1 to 7)
		new /obj/item/toy/balloon/long(src)

/obj/item/weapon/storage/box/balloons/long/living/New()
	..()
	for(var/atom/A in src)
		qdel(A)
	for(var/i = 1 to 7)
		new /obj/item/toy/balloon/long/living(src)

/obj/item/weapon/storage/box/chrono_grenades/past
	icon_state = "past_grenade"

/obj/item/weapon/storage/box/chrono_grenades/past/New()
	..()
	for(var/atom/A in src)
		qdel(A)
	for(var/i = 1 to 7)
		new /obj/item/weapon/grenade/chronogrenade/past(src)

// Who organizes this shit?

/obj/item/weapon/storage/box/actionfigure
	name = "box of action figures"
	desc = "The latest set of collectable action figures."
	icon_state = "box"

/obj/item/weapon/storage/box/actionfigure/New()
	..()
	for(var/i in 1 to 4)
		var/randomFigure = pick(subtypesof(/obj/item/toy/figure))
		new randomFigure(src)

/obj/item/weapon/storage/box/mechfigures
	name = "box of mech figurines"
	desc = "An old box of mech figurines"
	icon_state = "box"

/obj/item/weapon/storage/box/mechfigures/New()
	..()
	for(var/i in 1 to 4)
		var/randomFigurine = pick(/obj/item/toy/prize/ripley,
							/obj/item/toy/prize/fireripley,
							/obj/item/toy/prize/deathripley,
							/obj/item/toy/prize/gygax,
							/obj/item/toy/prize/durand,
							/obj/item/toy/prize/honk,
							/obj/item/toy/prize/marauder,
							/obj/item/toy/prize/seraph,
							/obj/item/toy/prize/mauler,
							/obj/item/toy/prize/odysseus,
							/obj/item/toy/prize/phazon)
		new randomFigurine(src)

/obj/item/weapon/storage/box/diy_soda
	name = "Dr. Pecker's DIY soda kit"
	desc = "A trendy and expensive 'DIY' soda that you have to mix yourself. Tastes like a science fair experiment."
	icon_state = "box_DIY_soda"
	vending_cat = "carbonated drinks"

/obj/item/weapon/storage/box/diy_soda/New()
	..()
	new /obj/item/weapon/reagent_containers/glass/beaker/vial/tenwater(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/vial/tencarbon(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/vial/tenantitox(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/erlenmeyer/lemonlime(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/erlenmeyer/sodawater(src)
	new /obj/item/weapon/reagent_containers/glass/beaker/large/erlenmeyer(src)
	new /obj/item/weapon/paper/diy_soda(src)

/obj/item/weapon/storage/japanese_nanites
	name = "kawaii anime bento box of the month"
	desc = "On the back of the box a picture of a scantily dressed female is depicted along with several indecipherable Japanese moon runes."
	icon = 'icons/obj/storage/smallboxes.dmi'
	icon_state = "anime_box"
	item_state = "anime_box"

/obj/item/weapon/storage/japanese_nanites/New() //Having this bundle ought to make you valid. It really should.
	..()
	for(var/i = 1 to 3)
		new /obj/item/weapon/reagent_containers/glass/bottle/japanese_nanites(src)
	var/randomFigurine = pick(/obj/item/toy/gasha/mimiga/sue,
								/obj/item/toy/gasha/mimiga/toroko,
								/obj/item/toy/gasha/mimiga/chaco,
								/obj/item/toy/gasha/cattoy,
								/obj/item/toy/gasha/corgitoy,
								/obj/item/toy/gasha/femsec)
	new randomFigurine(src)
	new /obj/item/clothing/head/kitty(src)
	new /obj/item/clothing/under/schoolgirl(src)
	new /obj/item/weapon/paper/japanese_nanite_bundle(src)
