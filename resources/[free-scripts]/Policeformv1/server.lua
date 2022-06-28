local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/990188647905107978/Y0KmTkY4RIEmNfum6xakW4UeH0fjCnkHfBoqgYIyvsYb5HdpkvYRNxN7tgMZWddKGfZg"


RegisterServerEvent('log')
AddEventHandler('log', function(data)



    local connect = {
        {
            ["color"] = "255",
            ["title"] = "New Form | " ..data.plate.."-"..data.lastname,
            ["description"] = "In Game First Name: \n **"..data.plate.."** \n In Game Last Name: \n **"..data.lastname.."** \n Age: \n **"..data.age.."** \n Why Do You Want To Be On The SAPD: \n**"..data.why.."**\n Gender:\n **"..data.gender.."**\n In Game Phone Number:\n **"..data.Phonenumber.."**\n Discord Name:\n **"..data.DiscordName.."**\n What Can You Bring To The SAPD:\n **"..data.why2.."**\n Why Should We Choose You:\n **"..data.WhyShouldWeChooseYou.."**\n How Long Have You being Playing On BSRP For?:\n **"..data.Howlong.."**\n Have You Ever Being A Police In a server:\n **"..data.whitlist.."**\n Have you had any previous experiences as police and where?:\n **"..data.experiences.."**\n You are alone in your squad car, you hear multiple shots fired in your general area, what do you do and why?:\n**"..data.pd1.."**\n You arrive at the scene of a store robbery and the suspect, who has a gun, has taken a hostage, what do you do and why?:\n**"..data.pd2.."**\n What separates you from others applying?:\n**"..data.pd3.."**",
	        ["footer"] = {
                ["text"] = "New Police Form",
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "Police Forms",  avatar_url = "https://static.wikia.nocookie.net/gta/images/5/5e/Sceau-lspd-gtav.png/revision/latest?cb=20140916194909&path-prefix=fr",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

