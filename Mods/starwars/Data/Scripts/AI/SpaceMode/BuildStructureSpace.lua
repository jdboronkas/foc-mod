-- $Id: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/AI/SpaceMode/BuildStructureSpace.lua#2 $
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
--              $File: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/AI/SpaceMode/BuildStructureSpace.lua $
--
--    Original Author: Steve Copeland
--
--            $Author: James_Yarrow $
--
--            $Change: 46312 $
--
--          $DateTime: 2006/06/15 13:55:40 $
--
--          $Revision: #2 $
--
--/////////////////////////////////////////////////////////////////////////////////////////////////

require("pgevents")


function Definitions()
	
	Category = "Build_Structure_Space"
	IgnoreTarget = true
	TaskForce = {
	{
		"MainForce"
		,"UC_Empire_Defense_Satellite_Laser | UC_Empire_Defense_Satellite_Missile | UC_Empire_Defense_Satellite_Tractor | UC_Empire_Build_Republic_Open_Circle_Fleet | UC_Empire_Build_Republic_Lok_Revenants | UC_Empire_Build_Republic_High_Command = 0,1"
		,"UC_Rebel_Defense_Satellite_Laser | UC_Rebel_Defense_Satellite_Missile | UC_Rebel_Defense_Satellite_Repair | UC_Rebel_Build_Cis_High_Command | UC_Rebel_Build_Cis_Sabaoth_Squadron | UC_Rebel_Build_Cis_Mercenary_Relay = 0,1"
		,"UC_Underworld_Defense_Satellite_Plasma | UC_Underworld_Defense_Satellite_DBM | UC_Underworld_Defense_Satellite_Sensor = 0,1"
		,"UC_cis_Defense_Satellite_Laser | UC_cis_Defense_Satellite_Missile | UC_cis_Defense_Satellite_Sensor | UC_cis_Mineral_Extractor = 0,1"
		,"UC_Republic_Defense_Satellite_Laser | UC_Republic_Defense_Satellite_Missile | UC_Republic_Defense_Satellite_Repair | UC_Republic_Mineral_Extractor = 0,1"



}
	}
	RequiredCategories = {"Structure"}
	AllowFreeStoreUnits = false

end

function MainForce_Thread()

	BlockOnCommand(MainForce.Build_All())
	MainForce.Set_Plan_Result(true)
	ScriptExit()
end


