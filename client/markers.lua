local a={}Citizen.CreateThread(function()while true do local b=GetEntityCoords(GetPlayerPed(-1))local c=nil;for d,e in pairs(a)do local f=Config.shops[d]if f then local g=f.position;local h=Config.markers.type;local i=Config.markers.size;local j,k,l,m=table.unpack(Config.markers.color)DrawMarker(6,g.x,g.y,g.z-0.9,0.0,0.0,0.0,-90.0,1.5,1.5,i,i,i,0,234,255,m,false,true,2,false,false,false)local n=#(b-f.position)if n<i*0.8 and not c then c=d end end end;if c and InShopMarker==nil then if Config.shops[c].groups then local o=ESX.GetPlayerData()if Config.shops[c].groups[o.job.name]then ESX.ShowHelpNotification(Config.labels.open)InShopMarker=c end else ESX.ShowHelpNotification(Config.labels.open)InShopMarker=c end elseif not c and InShopMarker~=nil then InShopMarker=nil end;Wait(1)end end)Citizen.CreateThread(function()while true do local b=GetEntityCoords(GetPlayerPed(-1))for p,q in ipairs(Config.shops)do local n=#(b-q.position)a[p]=n<Config.markers.stream_distance and true or nil end;Wait(2000)end end)