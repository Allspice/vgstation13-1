/datum/role/time_cop
	name = TIMECOP
	id = TIMECOP
	required_pref = TIMECOP
	special_role = TIMECOP
	logo_state = "timecop-logo"
	wikiroute = TIMECOP
	disallow_job = TRUE
	restricted_jobs = list()

	// stat_datum_type = /datum/stat/role/time_cop

/datum/role/time_cop/OnPostSetup()
	. =..()
	if(!.)
		return
	antag.current.forceMove(pick(timecopstart))
	if(ishuman(antag.current))
		antag.current << sound('sound/misc/timesuit_activate.ogg')
		equip_timecop(antag.current)
		name_timecop(antag.current)

/datum/role/time_cop/ForgeObjectives()
	if(!antag.current.client.prefs.antag_objectives)
		AppendObjective(/datum/objective/freeform/timecop)
		return

	AppendObjective(/datum/objective/target/delayed/assassinate)
	AppendObjective(/datum/objective/target/steal)

/datum/role/time_cop/Greet(var/greeting,var/custom)
	if(!greeting)
		return

	var/icon/logo = icon('icons/logos.dmi', logo_state)
	switch(greeting)
		if(GREET_CUSTOM)
			to_chat(antag.current, "<img src='data:image/png;base64,[icon2base64(logo)]' style='position: relative; top: 10;'/> <span class='danger'>[custom]</span>")
		else
			to_chat(antag.current, "<img src='data:image/png;base64,[icon2base64(logo)]' style='position: relative; top: 10;'/> <span class='danger'>You are a Time Cop.</br>Do things to mend the timeline with your time-bending suit and chronogrenades.</span>")
			to_chat(antag.current, "<span class='danger'>Jump to the future to hide in place, invisible and intangible, for ten seconds.</span>")
			to_chat(antag.current, "<span class='danger'>Jump to the past to return to where you activated the ability after ten seconds pass, with any injury taken during that ten seconds reverted.</span>")
			to_chat(antag.current, "<span class='danger'>Stop time to freeze anyone and anything in an area around you in place...excluding yourself.</span>")

	to_chat(antag.current, "<span class='info'><a HREF='?src=\ref[antag.current];getwiki=[wikiroute]'>(Wiki Guide)</a></span>")

/**********************************
****                           ****
****             GEAR          ****
****                           ****
**********************************/


// -- Time Cop procs --


/proc/equip_timecop(var/mob/living/carbon/human/H)
	if(!istype(H))
		return 0
	H.delete_all_equipped_items()

	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/time, slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat, slot_wear_mask)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/space/time, slot_wear_suit)
	if(H.gender == FEMALE)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/color/blackf, slot_w_uniform)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/color/black, slot_w_uniform)
	disable_suit_sensors(H)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/magboots, slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/messenger/black, slot_back)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/chrono_grenades/carbon, slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/chrono_grenades/past, slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/chrono_grenades/future, slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/weapon/tank/emergency_oxygen/double(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/device/radio/headset, slot_ears)
	H.equip_to_slot_or_del(new /obj/item/weapon/card/id/syndicate, slot_wear_id)

/proc/name_timecop(var/mob/living/carbon/human/H)
	if(!isjusthuman(H))
		H.set_species("Human", 1)
	var/timecop_name = pick(timecop_names)
	H.fully_replace_character_name(H.real_name, "[timecop_name]")
	mob_rename_self(H, "time cop")
