Config = {}

-- General Configuration Section --
Config.configuration_version = 1.0
Config.debug_mode = false -- Only useful for developers and if support asks you to enable it
Config.permission_mode = "ace" -- Available Options: ace, framework, custom

-- Ace Permissions Section --
Config.ace_perms = {
    ace_object_place = "sonoran.powersystems", -- Select the ace for placing new power systems and using admin repair
    ace_object_notification = "sonoran.police", -- Select the ace for receiving in-game notifications
    ace_object_can_hack = "sonoran.hacker", -- Select the ace for being allowed to hack power systems
    ace_object_can_repair = "sonoran.repairman" -- Select the ace for being allowed to repair power systems
}

-- Framework Related Settings --
Config.framework = {
    framework_type = "qb-core", -- This setting controls which framework is in use options are esx or qb-core
    police_job_names = {"police"}, -- An array of job names that should receive notifications
    allowed_to_place_groups = {"admin"}, -- The permission group that should be allowed to place new systems
    hacker_job_names = {"unemployed", "banker", "it"}, -- An array of job names that should receive notification_message
    repairman_job_names = {"repairman"}, -- An array of job names that should receive notifications
    use_hacker_job_list_as_blacklist = false -- This will treat the hacker job list as a blacklist rather than a whitelist
}

-- Configuration For Custom Permissions Handling --
Config.custom = {
    check_perms_server_side = true, -- If true the permission event will be sent out to the server side resource, this is recommended
    permissionCheck = function(source, type) -- This function will always be called server side.
        if type == 0 then -- Check for admin
            return true or false -- Return true if they have admin, return false if they don't
        elseif type == 1 then -- Check for notification perms
            return true or false -- Return true if they have permissions, return false if they don't
        elseif type == 2 then -- Check for hacker perms
            return true or false -- Return true if they have permissions, return false if they don't
        elseif type == 3 then -- Check for repair perms
            return true or false -- Return true if they have permissions, return false if they don't
        end
    end
}

-- Choose Custom Command Names --
Config.command_names = {
    spawn_new_system = "spawnnewsystem",
    cancel_new_spawn = "cancelsystemplacement",
    position_debug_display = "showdebugposition",
    upload_client_log = "uploadpowerclientlogs",
    upload_server_log = "uploadpowerserverlogs",
    show_system_id = "showsystemids",
    get_position_data = "getsystemposdata",
    change_position_data = "changesystemdata",
    reload_systems = "reloadpowersystems",
    cancel_new_link = "cancelpslink",
    start_new_link = "pslink"
}

Config.power_system_settings = {
    show_system_blips_for_police = false
}

-- Feature Settings That Don't Require Other Resources --
Config.standalone_features = {
    show_notification_blips_for_police = true, -- Should police see a blip when a car is pinged?
    blips_expire_after_seconds = 90, -- Number of seconds before the blip type above is removed
    enable_auto_update = true, -- Should the script automatically update itself, it will check for updates regardless
    notify_on_failed_disable = true, -- Should the script notify police when someone attempts and fails to disable a power system
    use_minigame_for_disable = true, -- Set to false to not require a minigame and enable instant hacking
    notify_on_hack_success = true, -- Set to false to disable notification about successful power system hacks
    delay_for_notifying_successful_hack = 10 -- Time in seconds between a successful hack and notification going out, set to 0 to disable delay
}

--[[
    Placeholder list:
    {{POSTAL}}
    {{EVENT_TYPE}}
    {{SYSTEM_NAME}}
]]

-- Settings For Integrations With Other Resources --
Config.integration = {
    SonoranCAD_integration = {
        use = true, -- Should any of the options below be used? Integration with this script requires at least a Plus subscription.
        add_live_map_blips = true, -- Should blips for the power systems be added to the live map? This requires the Pro SonoranCAD plan
        enable_911_calls = true, -- Should 911 calls be generated in the CAD when a BOLO vehicle or speeder is detected?
        ["911_caller"] = "Automated Powergrid Alerts", -- Who should the 911 call appear to be from?
        ["911_message"] = "{{EVENT_TYPE}} Alert at power system with name {{SYSTEM_NAME}}", -- Configurable 911 call description
        nearest_postal_plugin = "nearest-postal", -- If you want to use postals, what is the exact name of your postals script?
        disable_in_game_with_dispatch = true, -- If true disables in-game notifications when dispatch is online in CAD
        disable_cad_without_dispatch = true -- If true disables CAD notifications when dispatch is offline in CAD
    }
}

-- Notification Settings --
Config.notifications = {
    type = "native", -- Available options: native, pNotify, okokNotify, or cadonly
    notification_title = "{{EVENT_TYPE}}", -- Notification Title for methods that support it
    -- Uncomment line below and comment line 105 if you plan to use pNotify
    -- notification_message = "<b>{{EVENT_TYPE}} Alert</b></br>Power System Name: {{SYSTEM_NAME}}"
    notification_message = "{{EVENT_TYPE}} Alert\nPower System Name: {{SYSTEM_NAME}}", -- The text of the notification
    notification_repaired_title = "Power System Repaired",
    notification_repaired_message = "Power System repaired successfully: {{SYSTEM_NAME}}"
}
