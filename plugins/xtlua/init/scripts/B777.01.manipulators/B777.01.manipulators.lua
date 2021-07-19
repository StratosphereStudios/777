--[[
*****************************************************************************************
* Script Name: manipulators
* Author Name: crazytimtimtim
* Script Description: functions for cockpit switches
*****************************************************************************************
--]]

function null_command(phase, duration)
end
--replace create_command
function deferred_command(name,desc,nilFunc)
	c = XLuaCreateCommand(name,desc)
	--print("Deferred command: "..name)
	--XLuaReplaceCommand(c,null_command)
	return nil --make_command_obj(c)
end
--replace create_dataref
function deferred_dataref(name,type,notifier)
	--print("Deffereed dataref: "..name)
	dref=XLuaCreateDataRef(name, type,"yes",notifier)
	return wrap_dref_any(dref,type)
end

--*************************************************************************************--
--**                             CREATE CUSTOM COMMANDS                              **--
--*************************************************************************************--

B777CMD_mcp_ap_engage_1                   = deferred_command("Strato/B777/button_switch/mcp/ap/engage_1", "Engage A/P 1", B777_ap_engage_switch_1_CMDhandler)
B777CMD_mcp_ap_engage_2                   = deferred_command("Strato/B777/button_switch/mcp/ap/engage_2", "Engage A/P 2", B777_ap_engage_switch_2_CMDhandler) --might need a non switch one too
--[[B777CMD_mcp_ap_disengage_switch           = deferred_command("Strato/B777/button_switch/mcp/ap/disengage", "Disengage A/P", B777_ap_disengage_switch_CMDhandler)

B777CMD_mcp_flightdirector_capt           = deferred_command("Strato/B777/button_switch/mcp/fd/capt", "Captain Flight Director Switch", B777_fd_capt_CMDhandler)
B777CMD_mcp_flightdirector_fo             = deferred_command("Strato/B777/button_switch/mcp/fd/fo", "F/O Flight Director Switch", B777_fd_fo_CMDhandler)

B777CMD_mcp_autothrottle_switch_1         = deferred_command("Strato/B777/button_switch/mcp/autothrottle/switch_1", "Autothrottle Switch 1", B777_autothrottle_switch_1_CMDhandler)
B777CMD_mcp_autothrottle_switch_2         = deferred_command("Strato/B777/button_switch/mcp/autothrottle/switch_2", "Autothrottle Switch 2", B777_autothrottle_switch_2_CMDhandler)
B777CMD_mcp_autothrottle_arm_1            = deferred_command("Strato/B777/autothrottle/arm_1", "Autothrottle Arm 1", B777_autothrottle_arm_1_CMDhandler)
B777CMD_mcp_autothrottle_arm_2            = deferred_command("Strato/B777/autothrottle/arm_2", "Autothrottle Arm 2", B777_autothrottle_arm_2_CMDhandler)
B777CMD_mcp_autothrottle_disarm_1         = deferred_command("Strato/B777/autothrottle/disarm_1", "Autothrottle Disarm 1", B777_autothrottle_disarm_1_CMDhandler)
B777CMD_mcp_autothrottle_disarm_2         = deferred_command("Strato/B777/autothrottle/disarm_2", "Autothrottle Disarm 2", B777_autothrottle_disarm_2_CMDhandler)]]

B777CMD_mcp_ap_loc                        = deferred_command("Strato/B777/button_switch/mcp/ap/loc", "Localizer A/P Mode", B777_ap_loc_switch_CMDhandler)
B777CMD_mcp_ap_app                        = deferred_command("Strato/B777/button_switch/mcp/ap/app", "Approach A/P Mode", B777_ap_app_switch_CMDhandler)
B777CMD_mcp_ap_altHold                    = deferred_command("Strato/B777/button_switch/mcp/ap/altHold", "Altitude Hold A/P Mode", B777_ap_altHold_switch_CMDhandler)
B777CMD_mcp_ap_vs                         = deferred_command("Strato/B777/button_switch/mcp/ap/vs", "Vertical Speed A/P Mode", B777_ap_vs_switch_CMDhandler)
B777CMD_mcp_ap_hdgHold                    = deferred_command("Strato/B777/button_switch/mcp/ap/hdgHold", "Heading Hold A/P Mode", B777_ap_hdgHold_switch_CMDhandler)
B777CMD_mcp_ap_hdgSel                     = deferred_command("Strato/B777/button_switch/mcp/ap/hdgSel", "Heading Select A/P Mode", B777_ap_hdgSel_switch_CMDhandler)
B777CMD_mcp_ap_lnav                       = deferred_command("Strato/B777/button_switch/mcp/ap/lnav", "LNAV A/P Mode", B777_ap_lnav_switch_CMDhandler)
B777CMD_mcp_ap_vnav                       = deferred_command("Strato/B777/button_switch/mcp/ap/vnav", "VNAV A/P Mode", B777_ap_vnav_switch_CMDhandler)
B777CMD_mcp_ap_flch                       = deferred_command("Strato/B777/button_switch/mcp/ap/flch", "FLCH A/P Mode", B777_ap_flch_switch_CMDhandler)

---FMS L----------

--[[B777CMD_fms_l_a                           = deferred_command("Strato/B777/button_switch/fms_l/a", "A", B777_fms_l_a_CMDhandler)
B777CMD_fms_l_b                           = deferred_command("Strato/B777/button_switch/fms_l/b", "B", B777_fms_l_b_CMDhandler)
B777CMD_fms_l_c                           = deferred_command("Strato/B777/button_switch/fms_l/c", "C", B777_fms_l_c_CMDhandler)
B777CMD_fms_l_d                           = deferred_command("Strato/B777/button_switch/fms_l/d", "D", B777_fms_l_d_CMDhandler)
B777CMD_fms_l_e                           = deferred_command("Strato/B777/button_switch/fms_l/e", "E", B777_fms_l_e_CMDhandler)
B777CMD_fms_l_f                           = deferred_command("Strato/B777/button_switch/fms_l/f", "F", B777_fms_l_f_CMDhandler)
B777CMD_fms_l_g                           = deferred_command("Strato/B777/button_switch/fms_l/g", "G", B777_fms_l_g_CMDhandler)
B777CMD_fms_l_h                           = deferred_command("Strato/B777/button_switch/fms_l/h", "H", B777_fms_l_h_CMDhandler)
B777CMD_fms_l_i                           = deferred_command("Strato/B777/button_switch/fms_l/i", "I", B777_fms_l_i_CMDhandler)
B777CMD_fms_l_j                           = deferred_command("Strato/B777/button_switch/fms_l/j", "J", B777_fms_l_j_CMDhandler)
B777CMD_fms_l_k                           = deferred_command("Strato/B777/button_switch/fms_l/k", "K", B777_fms_l_k_CMDhandler)
B777CMD_fms_l_l                           = deferred_command("Strato/B777/button_switch/fms_l/l", "L", B777_fms_l_l_CMDhandler)
B777CMD_fms_l_m                           = deferred_command("Strato/B777/button_switch/fms_l/m", "M", B777_fms_l_m_CMDhandler)
B777CMD_fms_l_n                           = deferred_command("Strato/B777/button_switch/fms_l/n", "N", B777_fms_l_n_CMDhandler)
B777CMD_fms_l_o                           = deferred_command("Strato/B777/button_switch/fms_l/o", "O", B777_fms_l_o_CMDhandler)
B777CMD_fms_l_p                           = deferred_command("Strato/B777/button_switch/fms_l/p", "P", B777_fms_l_p_CMDhandler)
B777CMD_fms_l_q                           = deferred_command("Strato/B777/button_switch/fms_l/q", "Q", B777_fms_l_q_CMDhandler)
B777CMD_fms_l_r                           = deferred_command("Strato/B777/button_switch/fms_l/r", "R", B777_fms_l_r_CMDhandler)
B777CMD_fms_l_s                           = deferred_command("Strato/B777/button_switch/fms_l/s", "S", B777_fms_l_s_CMDhandler)
B777CMD_fms_l_t                           = deferred_command("Strato/B777/button_switch/fms_l/t", "T", B777_fms_l_t_CMDhandler)
B777CMD_fms_l_u                           = deferred_command("Strato/B777/button_switch/fms_l/u", "U", B777_fms_l_u_CMDhandler)
B777CMD_fms_l_v                           = deferred_command("Strato/B777/button_switch/fms_l/v", "V", B777_fms_l_v_CMDhandler)
B777CMD_fms_l_w                           = deferred_command("Strato/B777/button_switch/fms_l/w", "W", B777_fms_l_w_CMDhandler)
B777CMD_fms_l_x                           = deferred_command("Strato/B777/button_switch/fms_l/x", "X", B777_fms_l_x_CMDhandler)
B777CMD_fms_l_y                           = deferred_command("Strato/B777/button_switch/fms_l/y", "Y", B777_fms_l_y_CMDhandler)
B777CMD_fms_l_z                           = deferred_command("Strato/B777/button_switch/fms_l_z", "Z", B777_fms_l_z_CMDhandler)
B777CMD_fms_l_space                       = deferred_command("Strato/B777/button_switch/fms_l/space", "FMS L space", B777_fms_l_space_CMDhandler)
B777CMD_fms_l_delete                      = deferred_command("Strato/B777/button_switch/fms_l/delete", "FMS L delete", B777_fms_l_delete_CMDhandler)
B777CMD_fms_l_slash                       = deferred_command("Strato/B777/button_switch/fms_l/slash", "FMS L slash", B777_fms_l_slash_CMDhandler)
B777CMD_fms_l_clear                       = deferred_command("Strato/B777/button_switch/fms_l/clear", "FMS L clear", B777_fms_l_clear_CMDhandler)

B777CMD_fms_l_lsk_L1                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/L1", "LSK L1", B777_fms_l_lsk_L1_CMDhandler)
B777CMD_fms_l_lsk_L2                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/L2", "LSK L2", B777_fms_l_lsk_L2_CMDhandler)
B777CMD_fms_l_lsk_L3                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/L3", "LSK L3", B777_fms_l_lsk_L3_CMDhandler)
B777CMD_fms_l_lsk_L4                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/L4", "LSK L4", B777_fms_l_lsk_L4_CMDhandler)
B777CMD_fms_l_lsk_L5                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/L5", "LSK L5", B777_fms_l_lsk_L5_CMDhandler)
B777CMD_fms_l_lsk_L6                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/L6", "LSK L6", B777_fms_l_lsk_L6_CMDhandler)
B777CMD_fms_l_lsk_R1                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/R1", "LSK R1", B777_fms_l_lsk_R1_CMDhandler)
B777CMD_fms_l_lsk_R2                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/R2", "LSK R2", B777_fms_l_lsk_R2_CMDhandler)
B777CMD_fms_l_lsk_R3                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/R3", "LSK R3", B777_fms_l_lsk_R3_CMDhandler)
B777CMD_fms_l_lsk_R4                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/R4", "LSK R4", B777_fms_l_lsk_R4_CMDhandler)
B777CMD_fms_l_lsk_R5                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/R5", "LSK R5", B777_fms_l_lsk_R5_CMDhandler)
B777CMD_fms_l_lsk_R6                      = deferred_command("Strato/B777/button_switch/fms_l/lsk/R6", "LSK R6", B777_fms_l_lsk_R6_CMDhandler)

B777CMD_fms_l_initref                     = deferred_command("Strato/B777/button_switch/fms_l/initref", "Init Ref button", B777_fms_l_initref_CMDhandler)
B777CMD_fms_l_rte                         = deferred_command("Strato/B777/button_switch/fms_l/rte", "RTE button", B777_fms_l_rte_CMDhandler)
B777CMD_fms_l_deparr                      = deferred_command("Strato/B777/button_switch/fms_l/deparr", "DEP ARR button", B777_fms_l_deparr_CMDhandler)
B777CMD_fms_l_altn                        = deferred_command("Strato/B777/button_switch/fms_l/altn", "ALTN button", B777_fms_l_altn_CMDhandler)
B777CMD_fms_l_vnav                        = deferred_command("Strato/B777/button_switch/fms_l/vnav", "VNAV button", B777_fms_l_vnav_CMDhandler)
B777CMD_fms_l_fix                         = deferred_command("Strato/B777/button_switch/fms_l/fix", "FIX button", B777_fms_l_fix_CMDhandler)
B777CMD_fms_l_legs                        = deferred_command("Strato/B777/button_switch/fms_l/legs", "LEGS button", B777_fms_l_legs_CMDhandler)
B777CMD_fms_l_hold                        = deferred_command("Strato/B777/button_switch/fms_l/hold", "HOLD button", B777_fms_l_hold_CMDhandler)
B777CMD_fms_l_fmccomm                     = deferred_command("Strato/B777/button_switch/fms_l/fmccom", "FMC COMM button", B777_fms_l_fmccomm_CMDhandler)
B777CMD_fms_l_prog                        = deferred_command("Strato/B777/button_switch/fms_l/prog", "PROG button", B777_fms_l_prog_CMDhandler)
B777CMD_fms_l_menu                        = deferred_command("Strato/B777/button_switch/fms_l/menu", "MENU button", B777_fms_l_menu_CMDhandler)
B777CMD_fms_l_navrad                      = deferred_command("Strato/B777/button_switch/fms_l/navrad", "NAV RAD button", B777_fms_l_initref_CMDhandler)
B777CMD_fms_l_prevpage                    = deferred_command("Strato/B777/button_switch/fms_l/prevpage", "PREF PAGE button", B777_fms_l_prevpage_CMDhandler)
B777CMD_fms_l_nextpage                    = deferred_command("Strato/B777/button_switch/fms_l/nextpage", "NEXT PAGE button", B777_fms_l_nextpage_CMDhandler)
B777_CMD_fms_l_exec                       = deferred_command("Strato/B777/button_switch/fms_l/exec", "EXEC button", B777_fms_l_exec_CMDhandler)

B777CMD_fms_l_1                           = deferred_command("Strato/B777/button_switch/fms_l/1", "1", B777_fms_l_1_CMDhandler)
B777CMD_fms_l_2                           = deferred_command("Strato/B777/button_switch/fms_l/2", "2", B777_fms_l_2_CMDhandler)
B777CMD_fms_l_3                           = deferred_command("Strato/B777/button_switch/fms_l/3", "3", B777_fms_l_3_CMDhandler)
B777CMD_fms_l_4                           = deferred_command("Strato/B777/button_switch/fms_l/4", "4", B777_fms_l_4_CMDhandler)
B777CMD_fms_l_5                           = deferred_command("Strato/B777/button_switch/fms_l/5", "5", B777_fms_l_5_CMDhandler)
B777CMD_fms_l_6                           = deferred_command("Strato/B777/button_switch/fms_l/6", "6", B777_fms_l_6_CMDhandler)
B777CMD_fms_l_7                           = deferred_command("Strato/B777/button_switch/fms_l/7", "7", B777_fms_l_7_CMDhandler)
B777CMD_fms_l_8                           = deferred_command("Strato/B777/button_switch/fms_l/8", "8", B777_fms_l_8_CMDhandler)
B777CMD_fms_l_9                           = deferred_command("Strato/B777/button_switch/fms_l/9", "9", B777_fms_l_9_CMDhandler)
B777CMD_fms_l_0                           = deferred_command("Strato/B777/button_switch/fms_l/0", "0", B777_fms_l_0_CMDhandler)
B777CMD_fms_l_period                      = deferred_command("Strato/B777/button_switch/fms_l/period", "period", B777_fms_l_period_CMDhandler)
B777CMD_fms_l_plusminus                   = deferred_command("Strato/B777/button_switch/fms_l/plusminus", "+/- button", B777_fms_l_plusminus_CMDhandler)]]

--*************************************************************************************--
--**                             CREATE CUSTOM DATAREFS                              **--
--*************************************************************************************--

B777DR_mcp_button_positions               = deferred_dataref("Strato/777/cockpit/mcp/buttons/position", "array[25]")	-- DATAREF FOR MCP BUTTON ANIMATIONS
B777DR_fms_l_button_positions_letters     = deferred_dataref("Strato/777/cockpit/fms_l/buttons/letters/position", "array[30]")	-- DATAREF FOR FMS L BUTTON ANIMATIONS
B777DR_fms_l_button_positions_lsk         = deferred_dataref("Strato/777/cockpit/fms_l/buttons/lsk/position", "array[12]")
B777DR_fms_l_button_positions             = deferred_dataref("Strato/777/cockpit/fms_l/buttons/position", "array[15]")
B777DR_fms_l_button_positions_numbers     = deferred_dataref("Strato/777/cockpit/fms_l/buttons/position/numbers", "array[12]")
B777DR_button_cover_positions             = deferred_dataref("Strato/777/cockpit/buttons/position", "array[10]")	-- DATAREF FOR BUTTON COVER ANIMATIONS