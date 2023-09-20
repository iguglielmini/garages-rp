-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Creative = {}
Tunnel.bindInterface("garages",Creative)
vCLIENT = Tunnel.getInterface("garages")
vKEYBOARD = Tunnel.getInterface("keyboard")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local Spawn = {}
local Signal = {}
local Searched = {}
local Propertys = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBALSTATE
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Plates"] = {}

GlobalState["Nitro"] = {}

exports('getPlates', function()
	return GlobalState["Plates"]
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVERVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.ServerVehicle(Model,x,y,z,Heading,Plate,Nitrox,Doors,Body,Fuel)
	local Vehicle = CreateVehicle(Model,x,y,z,Heading,true,true)

	while not DoesEntityExist(Vehicle) do
		Wait(100)
	end

	if DoesEntityExist(Vehicle) then
		if Plate ~= nil then
			SetVehicleNumberPlateText(Vehicle,Plate)
		else
			Plate = vRP.GeneratePlate()
			SetVehicleNumberPlateText(Vehicle,Plate)
		end

		SetVehicleBodyHealth(Vehicle,Body + 0.0)

		if not Fuel then
			TriggerEvent("engine:tryFuel",Plate,100)
		end

		if Doors then
			local Doors = json.decode(Doors)
			if Doors ~= nil then
				for Number,Status in pairs(Doors) do
					if Status then
						SetVehicleDoorBroken(Vehicle,parseInt(Number),true)
					end
				end
			end
		end

		local Network = NetworkGetNetworkIdFromEntity(Vehicle)

		if Model ~= "wheelchair" then
			local Network = NetworkGetEntityFromNetworkId(Network)
			SetVehicleDoorsLocked(Network,2)

			local Nitro = GlobalState["Nitro"]
			Nitro[Plate] = Nitrox or 0
			GlobalState:set("Nitro",Nitro,true)
		end

		return true,Network,Vehicle
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES
-----------------------------------------------------------------------------------------------------------------------------------------
local Garages = {
	["1"] = { name = "Garage", payment = false },
	["2"] = { name = "Garage", payment = true },
	["3"] = { name = "Garage", payment = false },
	["4"] = { name = "Garage", payment = true },
	["5"] = { name = "Garage", payment = true },
	["6"] = { name = "Garage", payment = true },
	["7"] = { name = "Garage", payment = true },
	["8"] = { name = "Garage", payment = true },
	["9"] = { name = "Garage", payment = true },
	["10"] = { name = "Garage", payment = true },
	["11"] = { name = "Garage", payment = true },
	["12"] = { name = "Garage", payment = true },
	["13"] = { name = "Garage", payment = true },
	["14"] = { name = "Garage", payment = true },
	["15"] = { name = "Garage", payment = true },
	["16"] = { name = "Garage", payment = true },
	["17"] = { name = "Garage", payment = true },
	["18"] = { name = "Garage", payment = true },
	["19"] = { name = "Garage", payment = true },
	["20"] = { name = "Garage", payment = true },
	["21"] = { name = "Garage", payment = true },
	["22"] = { name = "Garage", payment = true },
	["23"] = { name = "Garage", payment = false },
	["24"] = { name = "Garage", payment = true },
	["25"] = { name = "Garage", payment = true },

	-- Paramedic
	["41"] = { name = "Paramedic", payment = false, perm = "Paramedic" },
	["42"] = { name = "heliParamedic", payment = false, perm = "Paramedic" },

	["43"] = { name = "Paramedic", payment = false, perm = "Paramedic" },
	["44"] = { name = "heliParamedic", payment = false, perm = "Paramedic" },

	["45"] = { name = "Paramedic", payment = false, perm = "Paramedic" },

	-- Police
	["61"] = { name = "got", payment = false, perm = "Police" },
	["62"] = { name = "heliPolice", payment = false, perm = "Police" },

	["63"] = { name = "GRAER", payment = false, perm = "Police" },
	["64"] = { name = "heliGRAER", payment = false, perm = "Police" },

	["65"] = { name = "BPM", payment = false, perm = "Police" },
	["66"] = { name = "heliPolice", payment = false, perm = "Police" },

	["67"] = { name = "Police", payment = false, perm = "Police" },
	["68"] = { name = "busPolice", payment = false, perm = "Police" },

	["69"] = { name = "Police", payment = false, perm = "Police" },

	["70"] = { name = "Police", payment = false, perm = "Police" },
	["71"] = { name = "heliPolice", payment = false, perm = "Police" },
	["72"] = { name = "busPolice", payment = false, perm = "Police" },

	["91"] = { name = "Ballas", payment = true, perm = "Ballas" },
	["92"] = { name = "Families", payment = true, perm = "Families" },
	["93"] = { name = "Vagos", payment = true, perm = "Vagos" },
	["94"] = { name = "Aztecas", payment = true, perm = "Aztecas" },
	["95"] = { name = "Bloods", payment = true, perm = "Bloods" },
	["96"] = { name = "Triads", payment = true, perm = "Triads" },
	["97"] = { name = "Razors", payment = true, perm = "Razors" },

	-- Boats
	["121"] = { name = "Boats", payment = false },
	["122"] = { name = "Boats", payment = false },
	["123"] = { name = "Boats", payment = false },
	["124"] = { name = "Boats", payment = false },
	["125"] = { name = "Boats", payment = false },
	["126"] = { name = "Boats", payment = false },

	-- Works
	["141"] = { name = "Lumberman", payment = false },
	["142"] = { name = "Driver", payment = false },
	["143"] = { name = "Garbageman", payment = false },
	["144"] = { name = "Transporter", payment = false },
	["145"] = { name = "Taxi", payment = false },
	["146"] = { name = "TowDriver", payment = false },
	["147"] = { name = "Garbageman", payment = false },
	["148"] = { name = "Garbageman", payment = false },
	["149"] = { name = "Taxi", payment = false },
	["150"] = { name = "Trucker", payment = false },
	["151"] = { name = "caminhoneiro", payment = false },
	["152"] = { name = "initial", payment = false },
	["153"] = { name = "eletricista", payment = false },
	["154"] = { name = "laranja", payment = false },
	["155"] = { name = "tomate", payment = false },
	["156"] = { name = "uva", payment = false },
	["157"] = { name = "graos", payment = false },
	["158"] = { name = "lixeiro", payment = false },
	["159"] = { name = "minerador", payment = false },
	["160"] = { name = "motorista", payment = false },
	["161"] = { name = "Policepm", payment = false, perm = "Police" },
	["162"] = { name = "Policecivil", payment = false, perm = "Police" },
	["163"] = { name = "Policepm", payment = false, perm = "Police" },
	["164"] = { name = "Policecivil", payment = false, perm = "Police" },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SIGNALREMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("signalRemove",function(Plate)
	if not Signal[Plate] then
		Signal[Plate] = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATEREVERYONE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("plateReveryone",function(Plate)
	if GlobalState["Plates"][Plate] then
		local Plates = GlobalState["Plates"]
		Plates[Plate] = nil
		GlobalState:set("Plates",Plates,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATEEVERYONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("plateEveryone")
AddEventHandler("plateEveryone",function(Plate)
	local Plates = GlobalState["Plates"]
	Plates[Plate] = true
	GlobalState:set("Plates",Plates,true)
end)

RegisterServerEvent("RegisterPlate")
AddEventHandler("RegisterPlate",function(Plate)
	local source = source
	local Passport = vRP.Passport(source)
	local Plates = GlobalState["Plates"]
	if Passport and Plate then
		Plates[Plate] = Passport
		GlobalState:set("Plates",Plates,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATEPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("platePlayers",function(Plate,Passport)
	if not vRP.PassportPlate(Plate) then
		local Plates = GlobalState["Plates"]
		Plates[Plate] = Passport
		GlobalState:set("Plates",Plates,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WORKS
-----------------------------------------------------------------------------------------------------------------------------------------
local Works = {
	["Paramedic"] = {
		"WRspeedoems",
		"WRurus",
		"WRvolito"
	},
	["caminhoneiro"] = {
		"phantom",
		"tanker"
	},
	["eletricista"] = {
		"utillitruck"
	},
	["laranja"] = {
		"rebel"
	},
	["motorista"] = {
		"bus"
	},
	["graos"] = {
		"tractor2"
	},
	["lixeiro"] = {
		"trash2"
	},
	["minerador"] = {
		"rebel"
	},
	["tomate"] = {
		"rebel"
	},
	["uva"] = {
		"rebel"
	},
	["heliParamedic"] = {
		"maverick2"
	},
	["Policepm"] = {
		"pcromeomil",
		"pcrammil",
		"pcblindadomil",
		"pcramciv",
		"pc2000civ",
		"pcblindadociv",
		"pcmaverickciv"
		-- "TFPMclassx",
		-- "TFPMgtr",
		-- "TFPMbmwm8",
		-- "TFPMm5",
		-- "TFPMram2500",
		-- "TFPMsubaru",
		-- "TFPMsxr",
		-- "TFPMtiger",
		-- "TFPMvelar",
		-- "TFSPEEDbmwi8",
		-- "TFSPEEDbmwm1",
		-- "TFSPEEDbmwm4",
		-- "TFSPEEDbmwm8",
		-- "TFSPEEDsubaru"
	},

	["Policecivil"] = {
		"pcramciv",
		"pc2000civ",
		"pcblindadociv",
		"pcmaverickciv"
	},
	["initial"] = {
		"bmx",
		"faggio"
	},
	["heliGRAER"] = {
		"pcmaverickgraer"
	},
	["busPolice"] = {
		"pbus",
		"riot"
	},
	["Driver"] = {
		"bus"
	},
	["Boats"] = {
		"dinghy",
		"jetmax",
		"marquis",
		"seashark",
		"speeder",
		"squalo",
		"suntrap",
		"toro",
		"tropic"
	},
	["Transporter"] = {
		"stockade"
	},
	["Lumberman"] = {
		"ratloader"
	},
	["TowDriver"] = {
		"flatbed",
		"towtruck",
		"towtruck2"
	},
	["Garbageman"] = {
		"trash"
	},
	["Taxi"] = {
		"taxi"
	},
	["Trucker"] = {
		"hauler",
		"hauler2",
		"packer",
		"phantom"
	},
	["got"] = {
		"pcramcoe",
		"pcmaverickcoe",
		"pcblindadocoe"
	},

	["COE"] = {
		"pcramcoe",
		"pcmaverickcoe",
		"pcblindadocoe"
	},

	["GRAER"] = {
		"pcromeograer"
		--"pcmaverickgraer"
	},

	["BPM"] = {
		"pcromeomil",
		"pcrammil",
		"pcblindadomil"
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Vehicles(Number)
	local source = source
	local Passport = vRP.Passport(source)
--	if Passport and not exports["hud"]:Wanted(Passport) then
		if Garages[Number]["perm"] then
			if not vRP.HasService(Passport,Garages[Number]["perm"]) then
				return false
			end
		end

		if string.sub(Number,1,9) == "Propertys" then
			local Consult = vRP.Query("propertys/Exist",{ name = Number })
			if Consult[1] then
				if parseInt(Consult[1]["Passport"]) == Passport or vRP.InventoryFull(Passport,"propertys-"..Consult[1]["Serial"]) then
					if os.time() > Consult[1]["Tax"] then
						TriggerClientEvent("Notify",source,"amarelo","Aluguel atrasado, procure um <b>Corretor de Imóveis</b>.",5000)
						return false
					end
				else
					return false
				end
			end
		end

		local Vehicle = {}
		local Garage = Garages[Number]["name"]
		if Works[Garage] then
			for _,v in pairs(Works[Garage]) do
				local vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = v })
				if VehicleExist(v) then
					if vehicle[1] then
						Vehicle[#Vehicle + 1] = { 
							["model"] = v,
							["name"] = VehicleName(v),
	
							["type"] = VehicleMode(v),
	
							["engine"] = vehicle[1]["engine"],
							["chassi"] = vehicle[1]["health"],
							["body"] = vehicle[1]["body"],
							["gas"] = vehicle[1]["fuel"],
	
							["chest"] = VehicleChest(v),
							["tax"] = VehiclePrice(v) * 0.10
						}
					else
						Vehicle[#Vehicle + 1] = { 
							["model"] = v,
							["name"] = VehicleName(v),
	
							["type"] = VehicleMode(v),
	
							["engine"] = 1000,
							["chassi"] = 1000,
							["body"] = 1000,
							["gas"] = 100,
	
							["chest"] = VehicleChest(v),
							["tax"] = VehiclePrice(v) * 0.10
						}
					end
				end
			end
		else
			local Consult = vRP.Query("vehicles/UserVehicles",{ Passport = Passport })
			for _,v in pairs(Consult) do
				if VehicleExist(v["vehicle"]) then
					if v["work"] == "false" and v['status'] == 0 then
						Vehicle[#Vehicle + 1] = { 
							["model"] = v["vehicle"],
							["name"] = VehicleName(v["vehicle"]),

							["type"] = VehicleMode(v["vehicle"]),

							["engine"] = v["engine"],
							["chassi"] = v["health"],
							["body"] = v["body"],
							["gas"] = v["fuel"],

							["chest"] = VehicleChest(v["vehicle"]),
							["tax"] = VehiclePrice(v["vehicle"]) * 0.10
						}
					end
				end
			end
		end

		return Vehicle
	--end


end
-----------------------------------------------------------------------------------------------------------------------------------------
-- IMPOUND
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Impound()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Vehicles = {}
		local Vehicle = vRP.Query("vehicles/UserVehicles",{ Passport = Passport })

		for Number,v in ipairs(Vehicle) do
			if v["arrest"] >= os.time() then
				Vehicles[#Vehicles + 1] = { ["Model"] = Vehicle[Number]["vehicle"], ["name"] = VehicleName(Vehicle[Number]["vehicle"]) }
			end
		end

		return Vehicles
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:IMPOUND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("garages:Impound")
AddEventHandler("garages:Impound",function(vehName)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local VehiclePrice = VehiclePrice(vehName)
		TriggerClientEvent("dynamic:closeSystem",source)

		if vRP.Request(source,"A liberação do veículo tem o custo de <b>$"..parseFormat(VehiclePrice * 0.25).."</b> dólares, deseja prosseguir com a liberação do mesmo?","Sim, efetuar o pagamento","Não, decido depois") then
			if vRP.PaymentBank(Passport,VehiclePrice * 0.25, true) or vRP.PaymentFull(Passport,VehiclePrice * 0.25, true) then
				vRP.Query("vehicles/paymentArrest",{ Passport = Passport, vehicle = vehName })
				TriggerClientEvent("Notify",source,"verde","Veículo liberado.",5000)
			else
				TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:TAX
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterServerEvent("garages:Tax")
-- AddEventHandler("garages:Tax",function(Name)

function Creative.Tax(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Consult = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
		if Consult[1] and Consult[1]["tax"] <= os.time() then
			local Price = VehiclePrice(Name) * 0.10

			if vRP.PaymentBank(Passport,Price, true) or vRP.PaymentFull(Passport,Price, true) then
				vRP.Query("vehicles/updateVehiclesTax",{ Passport = Passport, vehicle = Name })
				TriggerClientEvent("Notify",source,"verde","Pagamento concluído.",5000)
			else
				TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:SELL
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterServerEvent("garages:Sell")
-- AddEventHandler("garages:Sell",function(Name)

function Creative.Sell(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Mode = VehicleMode(Name)
		if Mode == "rental" or Mode == "work" then
			return
		end

		local Consult = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
		if Consult[1] then
			local Price = VehiclePrice(Name) * 0.5
			if vRP.Request(source,"Vender o veículo <b>"..VehicleName(Name).."</b> por <b>$"..parseFormat(Price).."</b>?","Sim, concluír venda","Não, mudei de ideia") then
				local Consult = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
				if Consult[1] then
					vRP.GiveBank(Passport,Price)
					vRP.Query("vehicles/removeVehicles",{ Passport = Passport, vehicle = Name })
					vRP.Query("entitydata/RemoveData",{ dkey = "Mods:"..Passport..":"..Name })
					vRP.Query("entitydata/RemoveData",{ dkey = "Chest:"..Passport..":"..Name })
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:TRANSFER
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterServerEvent("garages:Transfer")
-- AddEventHandler("garages:Transfer",function(Name)

function Creative.Transfer(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Mode = VehicleMode(Name)
		if Mode == "rental" or Mode == "work" then
			return
		end
		
		local myVehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
		if myVehicle[1] then
			TriggerClientEvent("dynamic:closeSystem",source)

			local Keyboard = vKEYBOARD.keySingle(source,"Passaporte:")
			if Keyboard then
				local OtherPassport = parseInt(Keyboard[1])
				local Identity = vRP.Identity(OtherPassport)
				if Identity then
					if vRP.Request(source,"Transferir o veículo <b>"..VehicleName(Name).."</b> para <b>"..Identity["name"].." "..Identity["name2"].."</b>?","Sim, transferir","Não, mudei de ideia") then
						local Vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = parseInt(OtherPassport), vehicle = Name })
						if Vehicle[1] then
							TriggerClientEvent("Notify",source,"amarelo","<b>"..Identity["name"].." "..Identity["name2"].."</b> já possui este modelo de veículo.",5000)
						else
							vRP.Query("vehicles/moveVehicles",{ Passport = Passport, OtherPassport = parseInt(OtherPassport), vehicle = Name })

							local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..Passport..":"..Name })
							if parseInt(#Datatable) > 0 then
								vRP.Query("entitydata/SetData",{ dkey = "Mods:"..OtherPassport..":"..Name, dvalue = Datatable[1]["dvalue"] })
								vRP.Query("entitydata/RemoveData",{ dkey = "Mods:"..Passport..":"..Name })
							end

							local Datatable = vRP.GetSrvData("Chest:"..Passport..":"..Name)
							vRP.SetSrvData("Chest:"..OtherPassport..":"..Name,Datatable)
							vRP.RemSrvData("Chest:"..Passport..":"..Name)

							TriggerClientEvent("Notify",source,"verde","Transferência concluída.",5000)
						end
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:SPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterServerEvent("garages:Spawn")
-- AddEventHandler("garages:Spawn",)

function Creative.Spawn(Name, Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		-- local Gemstone = VehicleGems
		local Coins = VehicleCoins
		local vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })

		if not vehicle[1] then
			-- if parseInt(Gemstone) > 0 then
			if parseInt(VehicleCoins) > 0 then
				-- if vRP.Request(source,"Alugar o veículo <b>"..VehicleName(Name).."</b> por <b>"..Gemstone.."</b> gemas?","Sim, concluír aluguel","Não, mudei de ideia") then
				if vRP.Request(source,"Alugar o veículo <b>"..VehicleName(Name).."</b> por <b>"..VehicleCoins.."</b> gemas?","Sim, concluír aluguel","Não, mudei de ideia") then
					-- if vRP.PaymentGems(Passport,VehicleGems) then
					if vRP.PaymentCoins(Passport,VehicleCoins) then
						vRP.Query("vehicles/rentalVehicles",{ Passport = Passport, vehicle = Name, plate = vRP.GeneratePlate(), work = "true" })
						TriggerClientEvent("Notify",source,"verde","Aluguel do veículo <b>"..VehicleName(Name).."</b> concluído.",5000)
						vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
					else
						TriggerClientEvent("Notify",source,"vermelho","<b>Gemas</b> insuficientes.",5000)
						return
					end
				else
					return
				end
			else
				local VehiclePrice = VehiclePrice(Name)
				if parseInt(VehiclePrice) > 0 then
					if vRP.Request(source,"Comprar <b>"..VehicleName(Name).."</b> por <b>$"..parseFormat(VehiclePrice).."</b> dólares?","Sim, concluír pagamento","Não, mudei de ideia") then
						if vRP.PaymentBank(Passport,VehiclePrice, true) or  vRP.PaymentFull(Passport,VehiclePrice, true) then
							vRP.Query("vehicles/addVehicles",{ Passport = Passport, vehicle = Name, plate = vRP.GeneratePlate(), work = "true" })
							vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
						else
							TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
						end
					else
						return
					end
				else
					vRP.Query("vehicles/addVehicles",{ Passport = Passport, vehicle = Name, plate = vRP.GeneratePlate(), work = "true" })
					vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = Name })
				end
			end
		end

		if vehicle[1] then
			local Plates = GlobalState["Plates"]
			local Plate = vehicle[1]["plate"]

			if Spawn[Plate] then
				if not Signal[Plate] then
					if not Searched[Passport] then
						Searched[Passport] = os.time()
					end

					if os.time() >= parseInt(Searched[Passport]) then
						Searched[Passport] = os.time() + 60

						local Network = Spawn[Plate][3]
						local Network = NetworkGetEntityFromNetworkId(Network)
						if DoesEntityExist(Network) and not IsPedAPlayer(Network) and GetEntityType(Network) == 2 then
							vCLIENT.SearchBlip(source,GetEntityCoords(Network))
							TriggerClientEvent("Notify",source,"amarelo","Rastreador do veículo foi ativado por <b>30</b> segundos, lembrando que se o mesmo estiver em movimento a localização pode ser imprecisa.",10000)
						else
							if Spawn[Plate] then
								Spawn[Plate] = nil
							end

							if Plates[Plate] then
								Plates[Plate] = nil
								GlobalState:set("Plates",Plates,true)
							end

							TriggerClientEvent("Notify",source,"verde","A seguradora efetuou o resgate do seu veículo e o mesmo já se encontra disponível para retirada.",5000)
						end
					else
						TriggerClientEvent("Notify",source,"amarelo","Rastreador só pode ser ativado a cada <b>60</b> segundos.",5000)
					end
				else
					TriggerClientEvent("Notify",source,"amarelo","Rastreador está desativado.",5000)
				end
			else
				if vehicle[1]["tax"] <= os.time() then
					TriggerClientEvent("Notify",source,"amarelo","Taxa do veículo atrasada.",5000)
				elseif vehicle[1]["arrest"] >= os.time() then
					TriggerClientEvent("Notify",source,"amarelo","Veículo apreendido, dirija-se até o <b>Impound</b> e efetue o pagamento da liberação do mesmo.",5000)
				else
					if vehicle[1]["rental"] ~= 0 then
						if vehicle[1]["rental"] <= os.time() then
							-- if vRP.Request(source,"Atualizar o aluguel do veículo <b>"..VehicleName(Name).."</b> por <b>"..Gemstone.." gemas</b>?","Sim, concluír pagamento","Não, mudei de ideia") then
							if vRP.Request(source,"Atualizar o aluguel do veículo <b>"..VehicleName(Name).."</b> por <b>"..VehicleCoins.." gemas</b>?","Sim, concluír pagamento","Não, mudei de ideia") then
								-- if vRP.PaymentGems(Passport,Gemstone) then
								if vRP.PaymentCoins(Passport,VehicleCoins) then
									vRP.Query("vehicles/rentalVehiclesUpdate",{ Passport = Passport, vehicle = Name })
									TriggerClientEvent("Notify",source,"verde","Aluguel do veículo <b>"..VehicleName(Name).."</b> atualizado.",5000)
								else
									TriggerClientEvent("Notify",source,"vermelho","<b>Gemas</b> insuficientes.",5000)
									return
								end
							else
								return
							end
						end
					end

					local Coords = vCLIENT.SpawnPosition(source,Number)
					if Coords then
						local Mods = nil
						local Datatable = vRP.Query("entitydata/GetData",{ dkey = "Mods:"..Passport..":"..Name })
						if parseInt(#Datatable) > 0 then
							Mods = Datatable[1]["dvalue"]
						end

						if Garages[Number]["payment"] then
							if vRP.UserPremium(Passport) then
								TriggerClientEvent("dynamic:closeSystem",source)
								local Exist,Network = Creative.ServerVehicle(Name,Coords[1],Coords[2],Coords[3],Coords[4],Plate,vehicle[1]["nitro"],vehicle[1]["doors"],vehicle[1]["body"])

								if Exist then
									vCLIENT.CreateVehicle(-1,Name,Network,vehicle[1]["engine"],vehicle[1]["health"],Mods,vehicle[1]["windows"],vehicle[1]["tyres"])
									TriggerClientEvent("Notify",source,"azul",CompleteTimers(vehicle[1]["tax"] - os.time()),1000)
									TriggerEvent("engine:tryFuel",Plate,vehicle[1]["fuel"])
									Spawn[Plate] = { Passport,Name,Network }

									Plates[Plate] = Passport
									GlobalState:set("Plates",Plates,true)
								end
							else
								local VehiclePrice = VehiclePrice(Name)
								if vRP.Request(source,"Retirar o veículo por <b>$"..parseFormat(VehiclePrice * 0.05).."</b> dólares?","Sim, efetuar o pagamento","Não, volto depois") then
									if vRP.GetBank(source) >= parseInt(VehiclePrice * 0.05) then
										TriggerClientEvent("dynamic:closeSystem",source)
										local Exist,Network = Creative.ServerVehicle(Name,Coords[1],Coords[2],Coords[3],Coords[4],Plate,vehicle[1]["nitro"],vehicle[1]["doors"],vehicle[1]["body"])

										if Exist then
											vCLIENT.CreateVehicle(-1,Name,Network,vehicle[1]["engine"],vehicle[1]["health"],Mods,vehicle[1]["windows"],vehicle[1]["tyres"])
											TriggerClientEvent("Notify",source,"azul",CompleteTimers(vehicle[1]["tax"] - os.time()),1000)
											TriggerEvent("engine:tryFuel",Plate,vehicle[1]["fuel"])
											Spawn[Plate] = { Passport,Name,Network }
											vRP.PaymentBank(Passport,VehiclePrice * 0.05, true)

											Plates[Plate] = Passport
											GlobalState:set("Plates",Plates,true)
										end
									elseif vRP.InventoryItemAmount(Passport, "dollars")[1] >= parseInt(VehiclePrice * 0.05) then
										TriggerClientEvent("dynamic:closeSystem",source)
										local Exist,Network = Creative.ServerVehicle(Name,Coords[1],Coords[2],Coords[3],Coords[4],Plate,vehicle[1]["nitro"],vehicle[1]["doors"],vehicle[1]["body"])

										if Exist then
											vCLIENT.CreateVehicle(-1,Name,Network,vehicle[1]["engine"],vehicle[1]["health"],Mods,vehicle[1]["windows"],vehicle[1]["tyres"])
											TriggerClientEvent("Notify",source,"azul",CompleteTimers(vehicle[1]["tax"] - os.time()),1000)
											TriggerEvent("engine:tryFuel",Plate,vehicle[1]["fuel"])
											Spawn[Plate] = { Passport,Name,Network }
											vRP.PaymentFull(Passport,VehiclePrice * 0.05, true)

											Plates[Plate] = Passport
											GlobalState:set("Plates",Plates,true)
										end
									else
										TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
									end
								end
							end
						else
							TriggerClientEvent("dynamic:closeSystem",source)
							local Exist,Network = Creative.ServerVehicle(Name,Coords[1],Coords[2],Coords[3],Coords[4],Plate,vehicle[1]["nitro"],vehicle[1]["doors"],vehicle[1]["body"])

							if Exist then
								vCLIENT.CreateVehicle(-1,Name,Network,vehicle[1]["engine"],vehicle[1]["health"],Mods,vehicle[1]["windows"],vehicle[1]["tyres"])
								TriggerClientEvent("Notify",source,"azul",CompleteTimers(vehicle[1]["tax"] - os.time()),1000)
								TriggerEvent("engine:tryFuel",Plate,vehicle[1]["fuel"])
								Spawn[Plate] = { Passport,Name,Network }

								Plates[Plate] = Passport
								GlobalState:set("Plates",Plates,true)
							end
						end
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("car",function(source,Message)
	local Passport = vRP.Passport(source)
	if Passport then
		--if vRP.HasGroup(Passport,"Admin") and Message[1] then
			local VehicleName = Message[1]
			local Ped = GetPlayerPed(source)
			local Coords = GetEntityCoords(Ped)
			local Heading = GetEntityHeading(Ped)
			local Plate = "VEH"..(10000 + Passport)
			local Exist,Network,Vehicle = Creative.ServerVehicle(VehicleName,Coords["x"],Coords["y"],Coords["z"],Heading,Plate,2000,nil,1000)

			if not Exist then
				return
			end

			vCLIENT.CreateVehicle(-1,VehicleName,Network,1000,1000,nil,false,false)
			Spawn[Plate] = { Passport,VehicleName,Network }
			TriggerEvent("engine:tryFuel",Plate,100)
			SetPedIntoVehicle(Ped,Vehicle,-1)

			local Plates = GlobalState["Plates"]
			Plates[Plate] = Passport
			GlobalState:set("Plates",Plates,true)
		end
	--end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DV
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("dv",function(source)
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasGroup(Passport,"Admin",2) then
		TriggerClientEvent("garages:Delete",source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:KEY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("garages:Key")
AddEventHandler("garages:Key",function(entity)
	local source = source
	local Plate = entity[1]
	local Passport = vRP.Passport(source)
	if Passport and GlobalState["Plates"][Plate] == Passport then
		vRP.GenerateItem(Passport,"vehkey-"..Plate,1,true,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:LOCK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("garages:Lock")
AddEventHandler("garages:Lock",function(Network,Plate)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and GlobalState["Plates"][Plate] == Passport then
		TriggerEvent("garages:LockVehicle",source,Network)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:LOCKVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("garages:LockVehicle",function(source,Network)
	local Network = NetworkGetEntityFromNetworkId(Network)
	local Doors = GetVehicleDoorLockStatus(Network)

	if parseInt(Doors) <= 1 then
		TriggerClientEvent("Notify",source,"locked","Veículo trancado.",5000)
		TriggerClientEvent("sounds:Private",source,"locked",0.7)
		SetVehicleDoorsLocked(Network,2)
	else
		TriggerClientEvent("Notify",source,"unlocked","Veículo destrancado.",5000)
		TriggerClientEvent("sounds:Private",source,"unlocked",0.7)
		SetVehicleDoorsLocked(Network,1)
	end

	if not vRP.InsideVehicle(source) then
		vRPC.playAnim(source,true,{"anim@mp_player_intmenu@key_fob@","fob_click"},false)
		Wait(350)
		vRPC.stopAnim(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETE
-----------------------------------------------------------------------------------------------------------------------------------------
function Creative.Delete(Network,Health,Engine,Body,Fuel,Doors,Windows,Tyres,Plate)
	if Spawn[Plate] then
		local Passport = Spawn[Plate][1]
		local vehName = Spawn[Plate][2]

		if parseInt(Engine) <= 100 then
			Engine = 100
		end

		if parseInt(Body) <= 100 then
			Body = 100
		end

		if parseInt(Fuel) >= 100 then
			Fuel = 100
		end

		if parseInt(Fuel) <= 0 then
			Fuel = 0
		end

		local vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = vehName })
		if vehicle[1] ~= nil then
			vRP.Query("vehicles/updateVehicles",{ Passport = Passport, vehicle = vehName, nitro = (GlobalState["Nitro"][Plate] or 0), engine = parseInt(Engine), body = parseInt(Body), health = parseInt(Health), fuel = parseInt(Fuel), doors = json.encode(Doors), windows = json.encode(Windows), tyres = json.encode(Tyres) })
		end
	end

	TriggerEvent("garages:deleteVehicle",Network,Plate)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:DELETEVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("garages:deleteVehicle")
AddEventHandler("garages:deleteVehicle",function(Network,Plate)
	if Network ~= nil and Plate ~= nil then
		if GlobalState["Plates"][Plate] then
			local Plates = GlobalState["Plates"]
			Plates[Plate] = nil
			GlobalState:set("Plates",Plates,true)
		end

		if GlobalState["Nitro"][Plate] then
			local Nitro = GlobalState["Nitro"]
			Nitro[Plate] = nil
			GlobalState:set("Nitro",Nitro,true)
		end

		if Signal[Plate] then
			Signal[Plate] = nil
		end

		if Spawn[Plate] then
			Spawn[Plate] = nil
		end

		if string.sub(Plate,1,4) == "DISM" then
			local Passport = parseInt(string.sub(Plate,5,8)) - 1000
			local source = vRP.Source(Passport)
			if source then
				TriggerClientEvent("inventory:Disreset",source)
				TriggerClientEvent("Notify",source,"amarelo","O veículo do seu contrato foi encaminhado para o <b>Impound</b> e o <b>Lester</b> disse que você pode assinar um novo contrato quando quiser.",10000)
			end
		end

		local Network = NetworkGetEntityFromNetworkId(Network)
		if DoesEntityExist(Network) and not IsPedAPlayer(Network) and GetEntityType(Network) == 2 and GetVehicleNumberPlateText(Network) == Plate then
			DeleteEntity(Network)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:PROPERTYS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("garages:Propertys")
AddEventHandler("garages:Propertys",function(Name)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		TriggerClientEvent("dynamic:closeSystem",source)
		TriggerClientEvent("Notify",source,"amarelo","Selecione o local da garagem.",5000)

		local Hash = "prop_offroad_tyres02"
		local Application,Coords,Heading = vRPC.objectCoords(source,Hash)
		if Application then
			if #(Coords - exports["propertys"]:Coords(Name)) <= 25 then
				TriggerClientEvent("Notify",source,"amarelo","Selecione o local do veículo.",5000)

				local Open = Coords
				local Hash = "patriot"
				local Application,Coords,Heading = vRPC.objectCoords(source,Hash)
				if Application then
					if #(Coords - exports["propertys"]:Coords(Name)) <= 25 then
						local New = {
							["1"] = { mathLength(Open["x"]),mathLength(Open["y"]),mathLength(Open["z"] + 1) },
							["2"] = { mathLength(Coords["x"]),mathLength(Coords["y"]),mathLength(Coords["z"] + 1),mathLength(Heading) }
						}

						Garages[Name] = { name = "Garage", payment = false }

						Propertys[Name] = {
							["x"] = New["1"][1],
							["y"] = New["1"][2],
							["z"] = New["1"][3],
							["1"] = New["2"]
						}

						vRP.Query("propertys/Garage",{ name = Name, garage = json.encode(New) })
						TriggerClientEvent("garages:Propertys",-1,Propertys)
					else
						TriggerClientEvent("Notify",source,"amarelo","A garagem precisa ser próximo da entrada.",5000)
					end
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","A garagem precisa ser próximo da entrada.",5000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local Consult = vRP.Query("propertys/Garages")
	for _,v in pairs(Consult) do
		local Name = v["Name"]
		if not Propertys[Name] and v["Garage"] ~= "{}" then
			local Table = json.decode(v["Garage"])
			Garages[Name] = { name = "Garage", payment = false }

			Propertys[Name] = {
				["x"] = Table["1"][1],
				["y"] = Table["1"][2],
				["z"] = Table["1"][3],
				["1"] = Table["2"]
			}
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SIGNAL
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Signal",function(Plate)
	return Signal[Plate]
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	TriggerClientEvent("garages:Propertys",source,Propertys)
end)
------------------ ADD CAR

RegisterCommand("addcar",function(source,args,rawCommand)
	local Passport = vRP.Passport(source)
	if Passport then
		if Passport and vRP.HasGroup(Passport,"Admin",2) then
			vRP.Query("vehicles/addVehicles",{ Passport = parseInt(args[1]), vehicle = args[2], plate = vRP.generatePlate(), work = tostring(false) })
		--	vRP.execute("vRP/add_vehicle",{ Passport = parseInt(args[1]), vehicle = args[2], plate = vRP.generatePlateNumber(), phone = vRP.getPhone(args[1]), work = tostring(false) })
			TriggerClientEvent("Notify",args[1],"verde","Recebido o veículo <b>"..args[2].."</b> em sua garagem.",5000)
			TriggerClientEvent("Notify",source,"verde","Adicionado o veiculo <b>"..args[2].."</b> na garagem de ID <b>"..args[1].."</b>.",10000)
			-- SendWebhookMessage(webaddcar,"```prolog\n[ID]: "..Passport.." \n[Para Id:]: "..args[1].."\n[Carro:]: "..args[2]..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)

----------------- REM CAR (Para remover o carro)

RegisterCommand("remcar",function(source,args,rawCommand)
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.HasGroup(Passport,"Admin") and args[1] and args[2] then
			local OtherPassport = parseInt(args[1])
			vRP.Query("vehicles/removeVehicles",{ Passport = parseInt(args[1]), vehicle = args[2]})
		--	vRP.execute("vRP/add_vehicle",{ Passport = parseInt(args[1]), vehicle = args[2], plate = vRP.generatePlateNumber(), phone = vRP.getPhone(args[1]), work = tostring(false) })
			TriggerClientEvent("Notify",OtherPassport,"verde","Removido o veículo <b>"..args[2].."</b> em sua garagem.",5000)
			TriggerClientEvent("Notify",source,"verde","Removido o veiculo <b>"..args[2].."</b> na garagem de ID <b>"..args[1].."</b>.",10000)
			-- SendWebhookMessage(webaddcar,"```prolog\n[ID]: "..Passport.." \n[Para Id:]: "..args[1].."\n[Carro Removido:]: "..args[2]..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)