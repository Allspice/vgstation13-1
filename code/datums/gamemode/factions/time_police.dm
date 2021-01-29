/datum/faction/time_police
	name = "Time Police"
	desc = "For honor, for revengeance, or just to train by ruining someone's day."
	ID = TIMEPOLICE
	required_pref = TIMECOP
	initial_role = TIMECOP
	late_role = TIMECOP
	roletype = /datum/role/time_cop
	initroletype = /datum/role/time_cop
	logo_state = "timecop-logo"
	hud_icons = list("timecop-logo")

/datum/faction/time_police/New()
	..()
	load_dungeon(/datum/map_element/dungeon/timepolice_academy)


/datum/faction/time_police/forgeObjectives()
	return //nothing logical to put here just yet


/datum/map_element/dungeon/timepolice_academy //small room for the time cop to get oriented
	file_path = "maps/misc/academy.dmm"
	unique = TRUE

/obj/structure/button/time_cop
	activate_id = "0"
	global_search = 0
	reset_name = 0

/obj/structure/button/time_cop/attack_hand(mob/user)

	visible_message("<span class='info'>[user] presses \the [src].</span>")
	activate(user)

/obj/structure/button/time_cop/launcher
	name = "launcher button"
	desc = "Pressing this button will activate your space protection and launch you to the target station from a random direction."

/obj/structure/button/time_cop/launcher/activate(mob/user)
	var/mob/living/carbon/human/cop = user
	cop.ThrowAtStation()

/obj/structure/button/time_cop/teleporter
	name = "teleporter button"
	desc = "Pressing this button will teleport you into a dark secluded place on the target station."

/obj/structure/button/time_cop/teleporter/activate(mob/user)
	usr.spawn_rand_maintenance()

/obj/effect/decal/timecopporter
	name = "time cop teleporter"
	desc = "Teleports you at the press of a button!"
	icon = 'icons/mecha/mecha_equipment.dmi' //placeholder until someone sprites something better
	icon_state = "mecha_teleport"  // much like the acoustic floors instead of tatami mats
