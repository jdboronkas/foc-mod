-- $Id: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/AI/SpaceMode/TacticalMultiplayerBuildSpaceUnitsGeneric.lua#5 $
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
-- (C) Petroglyph Games, Inc.
--
--
--  *****           **                          *                   *
--  *   **          *                           *                   *
--  *    *          *                           *                   *
--  *    *          *     *                 *   *          *        *
--  *   *     *** ******  * **  ****      ***   * *      * *****    * ***
--  *  **    *  *   *     **   *   **   **  *   *  *    * **   **   **   *
--  ***     *****   *     *   *     *  *    *   *  *   **  *    *   *    *
--  *       *       *     *   *     *  *    *   *   *  *   *    *   *    *
--  *       *       *     *   *     *  *    *   *   * **   *   *    *    *
--  *       **       *    *   **   *   **   *   *    **    *  *     *   *
-- **        ****     **  *    ****     *****   *    **    ***      *   *
--                                          *        *     *
--                                          *        *     *
--                                          *       *      *
--                                      *  *        *      *
--                                      ****       *       *
--
--/////////////////////////////////////////////////////////////////////////////////////////////////
-- C O N F I D E N T I A L   S O U R C E   C O D E -- D O   N O T   D I S T R I B U T E
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
--              $File: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/AI/SpaceMode/TacticalMultiplayerBuildSpaceUnitsGeneric.lua $
--
--    Original Author: James Yarrow
--
--            $Author: James_Yarrow $
--
--            $Change: 54441 $
--
--          $DateTime: 2006/09/13 15:08:39 $
--
--          $Revision: #5 $
--
--/////////////////////////////////////////////////////////////////////////////////////////////////

require("pgevents")


function Definitions()
	
	Category = "Tactical_Multiplayer_Build_Space_Units_Generic"
	IgnoreTarget = true
	TaskForce = {
		{
		"ReserveForce"
," CS_Level_Two_Starbase_Upgrade | CS_Level_Three_Starbase_Upgrade | CS_Level_Four_Starbase_Upgrade | CS_Level_Five_Starbase_Upgrade,= 0,1"

," PS_Level_Two_Starbase_Upgrade | PS_Level_Three_Starbase_Upgrade | PS_Level_Four_Starbase_Upgrade | PS_Level_Five_Starbase_Upgrade, = 0,1"


		
,"  RS_Level_Two_Starbase_Upgrade | RS_Level_Three_Starbase_Upgrade | RS_Level_Four_Starbase_Upgrade | RS_Level_Five_Starbase_Upgrade | RS_Enhanced_Shielding_L1_Upgrade | RS_Enhanced_Shielding_L2_Upgrade | RS_Enhanced_Shielding_L3_Upgrade | RS_Improved_Weapons_L1_Upgrade | RS_Improved_Weapons_L2_Upgrade | RS_Improved_Weapons_L3_Upgrade | RS_Improved_Defenses_L1_Upgrade | RS_Improved_Defenses_L2_Upgrade | RS_Improved_Defenses_L3_Upgrade | RS_Ion_Cannon_Use_Upgrade, = 0,1"
		
,"ES_Level_Two_Starbase_Upgrade | ES_Level_Three_Starbase_Upgrade | ES_Level_Four_Starbase_Upgrade | ES_Level_Five_Starbase_Upgrade | ES_Enhanced_Reactors_L1_Upgrade | ES_Enhanced_Reactors_L2_Upgrade | ES_Enhanced_Reactors_L3_Upgrade | ES_Reinforced_Armor_L1_Upgrade | ES_Reinforced_Armor_L2_Upgrade | ES_Reinforced_Armor_L3_Upgrade | ES_Improved_Weapons_L1_Upgrade | ES_Improved_Weapons_L2_Upgrade | ES_Improved_Weapons_L3_Upgrade | ES_Improved_Defenses_L1_Upgrade | ES_Improved_Defenses_L2_Upgrade | ES_Improved_Defenses_L3_Upgrade | ES_Hypervelocity_Gun_Use_Upgrade, = 0,1"
		
,"US_Level_Two_Starbase_Upgrade | US_Level_Three_Starbase_Upgrade | US_Level_Four_Starbase_Upgrade | US_Level_Five_Starbase_Upgrade | US_Targeting_Systems_L1_Upgrade | US_Targeting_Systems_L2_Upgrade | US_Targeting_Systems_L3_Upgrade | US_Magnetically_Sealed_Armor_L1_Upgrade | US_Magnetically_Sealed_Armor_L2_Upgrade | US_Magnetically_Sealed_Armor_L3_Upgrade | US_BlackMarket_Reactors_L1_Upgrade | US_BlackMarket_Reactors_L2_Upgrade | US_BlackMarket_Reactors_L3_Upgrade | US_Carbonite_Coolant_Systems_L1_Upgrade | US_Carbonite_Coolant_Systems_L2_Upgrade | US_Reinforced_Structure_L1_Upgrade | US_Reinforced_Structure_L2_Upgrade | US_Reinforced_Structure_L3_Upgrade | US_Cloaking_Generator_L1_Upgrade | US_Cloaking_Generator_L2_Upgrade | US_Plasma_Cannon_Use_Upgrade = 0,1"
		
,"Pirate_Fighter_Squadron | IPV1_SYSTEM_PATROL_CRAFT | PIRATE_FRIGATE = 0,2"
		
,"Rebel_X-Wing_Squadron | Y-Wing_Squadron | A_Wing_Squadron | Corellian_Corvette | Corellian_Gunboat | Jedi_Acclamator_Assault_Ship | Republic_light_assault_cruiser | Nebulon_B_Frigate | Alliance_Assault_Frigate | Calamari_Cruiser | Republic_light_frigate | B-Wing_Squadron | MC30_Frigate | MC_40 | MC75 | Assault_Frigate2 | Jedi_Y-Wing_Squadron | Rebel_Dreadnaught | MC75 | Naboo_Fighter_Squadron | MC80 | MC90_Calamari_Cruiser | Eta_2_Squadron | Delta_7_Squadron | E_Wing_Squadron | K_Wing_Squadron | Mediator_Cruiser Viscount_Star_Defender = 0,3"
		
,"Tie_Fighter_Squadron | Tie_Bomber_Squadron | Tartan_Patrol_Cruiser | Victory_Destroyer_2 | Acclamator_Assault_Ship | Victory_Destroyer | Interdictor_Cruiser | Star_Destroyer | Star_Destroyer_Mk1 | TIE_Defender_Squadron | TIE_Interceptor_Squadron | TIE_Phantom_Squadron | TIE_Avenger_Squadron | Assault_Gunboat_Squadron | Carrack_Cruiser | Lancer_Frigate | Imperial_Strike_Cruiser | Imperial_Escort_Carrier | TIE_Droid_Squadron | Missile_Gunboat_Squadron | Venator_Empire | TIE_Bizarro_Squadron | TIE_Booster_Squadron | TIE_Biggun_Squadron | TIE_Warhead_Squadron | Eclipse_Skirm | Executor_Super_Star_Destroyer = 0,3"
		
,"Crusader_Gunship | Interceptor4_Frigate | Kedalbe_Battleship | Sabaoth_Destroyer | Skipray_Squadron | StarViper_Squadron | Vengeance_Frigate | Sabaoth_Fighter_Squadron | Sabaoth_Bomber_Squadron | Munificent_Frigate | Vulture_Droid_Squadron | CIS_Bomber_Squadron | CIS_Carrier | Cis_Patrol_Frigate | Providence_Class_Carrier | Lucrehulk_Battleship | Tri_Droid_Squadron | Technounion_Frigate | Krayt_Class_Destroyer = 0,3"

,"V19_Squadron | NTB_630_Squadron | Delta_7_Squadron | Old_Y-Wing_Squadron | Eta_2_Squadron | Naboo_Fighter_Squadron | Republic_VWing_Squadron | Arc_170_Squadron | Republic_light_frigate | Republic_light_assault_cruiser | Carrack | Rep_Acclamator_Assault_Ship | Rep_Centax_Heavy_Frigate | Republic_Interdictor_Cruiser | Thranta | Dreadnaught_Cruiser | Venator | Legacy_Star_Destroyer | Procurator | Republic_Victory_Destroyer | Republic_Star_Destroyer | Mandator | Mandator_Super_Star_Destroyer | Tiin_Fighter_Squadron | Fisto_Team_Space_MP | Anakin_Skywalker_Team_Space_MP | Obiwan_Team_Space_MP | Mace_Windu_Team_Space_MP | Razor_Squadron_Space = 0,3"

,"Vulture_Droid_Squadron | Tri_Droid_Squadron | CIS_Bomber_Squadron | CIS_Scarab_Squadron | Hyena_Squadron | Mankvim_Squadron | Nantex_Squadron | Cis_Patrol_Frigate | Hammer_Class_Picket | CIS_Missile_Frigate | CIS_Carrier | Recusant_Frigate | Technounion_Frigate | Munificent_Frigate | Providence_Class_Carrier | Lucrehulk_Battleship | Malevolence = 0,3"

		,"Rogue_Squadron_Space | Red_Squadron | Han_Solo_Team_Space_MP | Home_One = 0,1"
		,"Boba_Fett_Team_Space_MP | Accuser_Star_Destroyer | Darth_Team_Space_MP | Executor_Super_Star_Destroyer | Admonitor_Star_Destroyer | Nemesis_Star_Destroyer | One_Eighty_First_Squadron = 0,1"
		,"Bossk_Team_Space_MP | IG88_Team_Space_MP | The_Peacebringer = 0,1"
		}
	}
	RequiredCategories = {"Fighter | Bomber | Corvette | Frigate | Capital | SpaceHero"}
	AllowFreeStoreUnits = false

end

function ReserveForce_Thread()
			
	BlockOnCommand(ReserveForce.Produce_Force())
	ReserveForce.Set_Plan_Result(true)
	ReserveForce.Set_As_Goal_System_Removable(false)
		
	-- Give some time to accumulate money.
	tech_level = PlayerObject.Get_Tech_Level()
	min_credits = 0
	max_sleep_seconds = 30
	if tech_level == 2 then
		min_credits = 0
		max_sleep_seconds = 50
	elseif tech_level >= 3 then
		min_credits = 0
		max_sleep_seconds = 80
	end
	
	current_sleep_seconds = 0
	while (PlayerObject.Get_Credits() < min_credits) and (current_sleep_seconds < max_sleep_seconds) do
		current_sleep_seconds = current_sleep_seconds + 1
		Sleep(1)
	end

	ScriptExit()
end