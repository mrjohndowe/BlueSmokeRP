local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/986339632708988989/D-Qno45wR4mT5vvh3a72RzwBdJnOoFqkudrr7p-MJrgKisjgGEl4cmCPLzaLVfnnKHUK',
    ['testwebhook'] = 'https://discord.com/api/webhooks/986339740972359690/I3GST3r0-_wux3mhjzKZpVX3ByXV91N4rEYhXSx7-aR_qnT9Jk_ZzYkYyOPyYc0cYe-c',
    ['playermoney'] = 'https://discord.com/api/webhooks/986339852251451473/3Wwkce3sKZ-049Q2SWgv1A25wAOI-7SIrXZ6hx_jFDtqEBVzSJP2AHX3nOD_9ObL-zHk',
    ['playerinventory'] = 'https://discord.com/api/webhooks/986339915572850708/v4KKSFI9Yjwyn_w0qr4F6w-Jqwn8E2b9ElTEw1ts0gL3OCaQZY5qsvXueiKqY89N-GH0',
    ['robbing'] = 'https://discord.com/api/webhooks/986340037673222204/gY_GuHZmpP26haXAWRHKsZwttyeZA8pBz4MFqT8fr3ahhX_mSDXSl7jdDXFnFxCdEpQf',
    ['cuffing'] = 'https://discord.com/api/webhooks/986340114290593792/OO51FQXzrR7hdSm9pxo6AZdXPZ3d172tz4-JtO1KsOI783vUckjJUaTmgUH70aCd2Yu8',
    ['drop'] = 'https://discord.com/api/webhooks/986340173027618886/uUnYMCJikmo4V7f9Z8Ucqe1PTgqBujQ8g06muiU3G5d395uxmprs5BFooXBNfIe0HrMH',
    ['trunk'] = 'https://discord.com/api/webhooks/986340258851467285/T6TnpezJUK84T53Ukw8KVichQOxESVcuyWcV9VO7yH8MFonvxgyTGk-Kc3fDD9WgkR7a',
    ['stash'] = 'https://discord.com/api/webhooks/986340343513501746/d2Bv-p1FP8bwUlnGE7_aDvwKSW-o0LRvFhDxdiEScvT9N7MvZfG0ZOEE25hl3GBK_TXW',
    ['glovebox'] = 'https://discord.com/api/webhooks/986340390070284328/D3uXrj1SN1hQsXGfByXvBugPTzrTMbUgfwcuq_JSErVlmkL0HzWNKio98GZD1bbkJbgB',
    ['banking'] = 'https://discord.com/api/webhooks/986340447783911485/ePnWotqOT2t7LWnCYrp_4sP2-DhaIsNYiTXcTXeqrmoXQpsmTbiAFrKqu8Is8OQemv-6',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/986340502632804422/bgeb5pAX5SeyxdLtRLmgzzJ53gvkk_JiDLSwbNl1wJTfTqwGQRLkPgd8TYqyOTemPMA6',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/986340596476174336/J9rkyuNNdYAB3OzyiH3xlBtW-iy3CU3P9rfJeWLzb3mTj0Cdt0ux7yVyJdR3hgZVd-gb',
    ['shops'] = 'https://discord.com/api/webhooks/986340696199954493/6aukc8E791j_ZKpHxqKVl5K_nVqGGUDnxXbqIPNKcs17Xih-6ZpdI2R96YheQeIlrMcv',
    ['dealers'] = 'https://discord.com/api/webhooks/986340743637504060/DYclnxq_uz6L0WA9JonP2XzY4JrD8rSynHqklBdy1MO6WhOtNenB9wfN50WhKjZostSd',
    ['storerobbery'] = 'https://discord.com/api/webhooks/986340815964102766/VZi6n9cREFypQGV67gEEgYRvO7RPBYKqE33Wad6fZI7ZVnk95-AcgaNTynKtP30t9P8-',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/986340871366639656/F9z6_4if1kIqFpFiAUcLW4Fvp2MyBszne5M9aqjb1H95qjv1myApWCBSgkD7-qPCyFWl',
    ['powerplants'] = 'https://discord.com/api/webhooks/986340957375062046/dmMOQdborFFx6lV-uhKnSM_eX4jF1S8jOruxQL1DQnqJVRtuWaFCLpko4rY1N469Kldz',
    ['death'] = 'https://discord.com/api/webhooks/986341014698602626/M1mz28BtlUXs1mm7bqKa1W3LCs-9BfcGGyMyqHt0XtE_sYQ_uX8uItwFn5JbGmoDh5TK',
    ['joinleave'] = 'https://discord.com/api/webhooks/986341063692271686/R0GJ3AUScA4IxfEPHKDdiQLZYFKRkmYpHUWncZY_eK2yqXa6708vwko2LouoRXf3hXAM',
    ['ooc'] = 'https://discord.com/api/webhooks/986341114078457936/ipobsRHxmtZQk2Xtel25wWWb1TpWO5gFUAQrAANWfQxs4Xo1bi8QEfuEtOrg1fkBozif',
    ['report'] = 'https://discord.com/api/webhooks/986341158462586900/tx7ag2-bfMmCtU1i0AH22BsTK52ntTCHdY-nOsJBxBNLfQP6vcM9kUkyg3cTUakepLtg',
    ['me'] = 'https://discord.com/api/webhooks/986341207821135872/5-7oeBH7ZgUda5XReyA5nU6hzzYqzQJd1eNp8Y7-Uj188BnYPyqvNFnrGmhKa2IWWM41',
    ['pmelding'] = 'https://discord.com/api/webhooks/986341316722036867/qOwefFbfwlADA296XVMA1nBsl_l04JXamCOZIeDJRVTQIQyBPRkV-8DCmBtRqto_pj96',
    ['112'] = 'https://discord.com/api/webhooks/986341367464722544/gTAVNZbnJc3PRV4Yb4r3gKdKO1W1hDnBuFLgLY_bBBdPtT34-hQQstCE7UYqa0VJ_bFE',
    ['bans'] = 'https://discord.com/api/webhooks/986341423911669790/vAZLaL80-Vf0U-gVlnbpEyMcvRTIZXSNNemRRMwiojwEvbXKb9ccQHm_Vb5ZUtCX1sjs',
    ['anticheat'] = 'https://discord.com/api/webhooks/986341551565340732/mkC-zwp1eH5IEiHrf4Upd7Wo8UYy8kPz09C7oG-rFHMQ4w3F40KtoNeV7vPT9z-AuTMJ',
    ['weather'] = 'https://discord.com/api/webhooks/986341603012657222/YE8GzvxRBuS-spoBw2ZSplAGwK6nhi-BsHWnT7Xv6735QzpYdi4WVo-C5AKqTwFEA1-H',
    ['moneysafes'] = 'https://discord.com/api/webhooks/986341657530208317/MENvzYSRtVfp3mrMl-C5mP8B9s5wKDwWtj0xsmZI55SQmaWzXVoFa2a_WbXsIFUb57jN',
    ['bennys'] = 'https://discord.com/api/webhooks/986341700203085894/hi3UvaGZN9AOppM4OGSqO_IZqOlo2TXYQkuM079tNeWphthxz0nTQdJOMQK_NuuofJjh',
    ['bossmenu'] = 'https://discord.com/api/webhooks/986341747590303744/awWNyDrbZU-Zhxvjq1NzrkcVWWWAyPqZHVfYMzciI9FK6JzHoxB5-Gx4FVpx0S-v-64U',
    ['robbery'] = 'https://discord.com/api/webhooks/986341789847920771/kVuLYDP_NIaKvBwBn7QB802POYPj6TWmpnlidYq7FGjmMgfYkISLWgxWS0ACAh0CYYWw',
    ['casino'] = 'https://discord.com/api/webhooks/986341834953478206/l9Rxl6VR0iCD5znWF-Lc1rhwoa9-PwCe0-YSIgZumxlz636-ZS_WiYNN02J7nRhNJqE2',
    ['traphouse'] = 'https://discord.com/api/webhooks/986341876061843526/0Y8Hw39pVrp1JzTc3yhcjBRlwz-NRpuZVim-nXKmj-qR9qZ-QyStHoaiBTBKnUJjeTrH',
    ['911'] = 'https://discord.com/api/webhooks/986341924598349824/k05_TWD3QI47zK5-0TiZXW-Xy_egpn1teLLUwLyUBWsIctBTGQb0vpgAGFM7lJyZ0mp7',
    ['palert'] = 'https://discord.com/api/webhooks/986341965241122857/ODsM3zkTRCkBxP0ZcyxBHBplH5GlhiZaQbilI1X0ksG87QWH_vubA8AI98RYuDZU5OL0',
    ['house'] = 'https://discord.com/api/webhooks/986342023353221271/vyXwVb8KrI_U-eW3YGxkaLP5Stg6j1uGp7c4BG44HyARlJDhPUqcgRX9e8lSPRJfeU8-',
	['lavagem'] = 'https://discord.com/api/webhooks/986342111869796372/ghUMxuL3esCs7YfV500s24t4K3jKVc-2UKIqaczUbUrGJEUXURhKPDwiT0Eopq9Le_2a'
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'QBCore Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
