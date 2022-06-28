Config = {}

-- General Configuration Section --
Config.configuration_version = 2.4
Config.debug_mode = false -- Only useful for developers and if support asks you to enable it
Config.permission_mode = "framework" -- Available Options: ace, framework, custom

-- Ace Permissions Section --
Config.ace_perms = {
    ace_object_place = "sonoran.trafficcam", -- Select the ace for placing new cameras
    ace_object_notification = "sonoran.police", -- Select the ace for receiving in-game notifications
    ace_object_to_place_bolo = "sonoran.bolo", -- The required ace to add BOLOs when using a framework
    ace_object_to_disable_cameras = "sonoran.disablecam" -- The required ace to disable cameras
}

-- Framework Related Settings --
Config.framework = {
    framework_type = "qb-core", -- This setting controls which framework is in use options are esx or qb-core
    police_job_names = {"police"}, -- An array of job names that should receive notifications
    allowed_to_place_groups = {"admin"}, -- The permission group that should be allowed to place new cameras
    required_grade_to_place_bolo = 4, -- The required grade to add BOLOs when using a framework
    required_grade_to_disable_cameras = 6, -- The required grade to disable cameras
    autofine = { -- This configures the autofine feature of the Speed Camera system
        enable = true,
        fine_method = "immediate", -- Options are immediate or custom(see function below) -- Invoice support is targeting rerelease with version 2.5
        custom_fine = function(speed, speedlimit, playerId, fineTableFine)
            -- Put your code to fine here
        end,
        police_society_account_name = 'society_police', -- The name of the society account to pay invoices into
        -- police_society_account_name = 'police', -- The name of the society account to pay invoices into
        fine_table = { -- Follow the format of the placeholder values, the last value in this table will be use for a speed difference of anything greater than that set value
            [1] = {
                speed_difference = 5,
                fine = 20
            },
            [2] = {
                speed_difference = 10,
                fine = 100
            },
            [3] = {
                speed_difference = 15,
                fine = 400
            },
            [4] = {
                speed_difference = 20,
                fine = 800
            },
            [5] = {
                speed_difference = 35,
                fine = 1200
            }
        }
    }
}

-- Configuration For Custom Permissions Handling --
Config.custom = {
    check_perms_server_side = false, -- If true the permission event will be sent out to the server side resource, this is recommended
    permissionCheck = function(source, type) -- This function will always be called server side.
        if type == 0 then -- Check for admin
            return true or false -- Return true if they have admin, return false if they don't
        elseif type == 1 then -- Check for notification perms
            return true or false -- Return true if they have permissions, return false if they don't
        elseif type == 2 then -- Check for BOLO creation/deletion/view perms
            return true or false -- Return true if they have permissions, return false if they don't
        elseif type == 3 then -- Check for permissions to enable/disable cameras
            return true or false -- Return true if they have permissions, return false if they don't
        end
    end
}

-- Choose Custom Command Names --
Config.command_names = {
    add_bolo_plate = "addplate",
    remove_bolo_plate = "delplate",
    spawn_new_cam = "spawnnewcam",
    cancel_new_spawn = "cancelcamplacement",
    position_debug_display = "position",
    upload_client_log = "uploadnewclientlog",
    upload_server_log = "uploadnewlog",
    change_position_data = "changepositiondata",
    show_cam_id = "showcamid",
    get_position_data = "getpositiondata",
    reload_cameras = "reloadcameras",
    list_bolo_plate = "listplates",
    disable_camera = "disablecam",
    enable_camera = "enablecam"
}

-- Settings Related to Camera Functionality --
Config.camera_settings = {
    ignore_emergency = true, -- Sets whether emergency vehicles should be ignored by the cameras
    only_ignore_on_els = true, -- If the setting above and this one are true emergency vehicles will only be ignored if their lights are on
    show_camera_blips_for_police = false, -- Should the cameras show up as blips for police on the map?
    unit_system = "mph", -- Speed unit options: mph and kph
    time_between_flags = 1, -- This is the number of minutes before a car will ping again, if they pass a different camera it will ping again regardless of whether this time has passed
    alpr_only_mode = false -- If this is true the speed detection system of this script will be disabled
}

-- Feature Settings That Don't Require Other Resources --
Config.standalone_features = {
    show_notification_blips_for_police = true, -- Should police see a blip when a car is pinged?
    blips_expire_after_seconds = 90, -- Number of seconds before the blip type above is removed
    enable_standalone_bolo_system = false, -- Selects whether the built in BOLO system should be used, this must be false for the SonoranCAD BOLO integration to work
    enable_camera_disable = true,
    enable_auto_update = true -- Should the script automatically update itself, it will check for updates regardless
}

--[[
    Placeholder list:
    {{POSTAL}}
    {{EVENT_TYPE}}
    {{PLATE}}
    {{SPEED}}
    {{SPEED_UNIT}}
    {{CAMERA_NAME}}
    {{DIRECTION}}
]]

-- Settings For Integrations With Other Resources --
Config.integration = {
    SonoranCAD_integration = {
        use = true, -- Should any of the options below be used? Integration with this script requires at least a Plus subscription.
        add_live_map_blips = true, -- Should blips for the camera be added to the live map? This requires the Pro SonoranCAD plan
        enable_911_calls = true, -- Should 911 calls be generated in the CAD when a BOLO vehicle or speeder is detected?
        ["911_caller"] = "Automated System", -- Who should the 911 call appear to be from?
        ["911_message"] = "{{EVENT_TYPE}} vehicle with license plate {{PLATE}} was seen doing {{SPEED}} {{SPEED_UNIT}} at camera {{CAMERA_NAME}}", -- Configurable 911 call description
        enable_cad_bolos = true, -- Should CAD BOLO system be used? The standalone BOLO system found above must be disabled to use this system.
        nearest_postal_plugin = "nearest-postal", -- If you want to use postals, what is the exact name of your postals script?
        disable_in_game_with_dispatch = false, -- If true disables in-game notifications when dispatch is online in CAD
        disable_cad_without_dispatch = false -- If true disables CAD notifications when dispatch is offline in CAD
    },
    SpeedLimit_Display_integration = false -- Should the speedlimit set in the SpeedLimit Display script be used? See docs.sonoran.store for more info
}

-- Notification Settings --
Config.notifications = {
    type = "native", -- Available options: native, pNotify, okokNotify, or cadonly
    notification_title = "{{EVENT_TYPE}} Alert", -- Notification Title for methods that support it
    -- Uncomment line below and comment line 87 if you plan to use pNotify
    -- notification_message = "<b>{{EVENT_TYPE}}</b></br>License Plate: {{PLATE}}</br>Speed: {{SPEED}} {{SPEED_UNIT}}</br>Camera: {{CAMERA_NAME}}"
    notification_message = "{{EVENT_TYPE}} Alert\nLicense Plate: {{PLATE}}\nSpeed: {{SPEED}} {{SPEED_UNIT}}\nCamera: {{CAMERA_NAME}}" -- The text of the notification
}
