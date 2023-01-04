function data()
return {
	info = {
		minorVersion = 2,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
			{
				name = "ModWerkstatt",
				role = "CREATOR",
			},
		},
		tags = { "train", "waggon", "europe", "auto", "autotransporter", "deutsche bahn" },
		dependencies = { },
		url = { },
        params = {
			{
				key = "autotransportfake",
				name = _("Use_Fake"),
				values = { _("No"), _("Yes"), },
				tooltip = _("option_autotransport_fake_desc"),
				defaultIndex = 0,
			},
            {
				key = "autotransportloaded",
				name = _("Use_Loaded"),
				values = { _("No"), _("Yes"), },
				tooltip = _("option_autotransport_loaded_desc"),
				defaultIndex = 0,
			},
		},
	},

	runFn = function (settings, modParams)

		local hidden = {
				["DDm915_fernblau_fake.mdl"] = true,
				["DDm915_gruen_fake.mdl"] = true,
				["DDm915_oebb_fake.mdl"] = true,
				["DDm915_verkehrsrot_fake.mdl"] = true,
				["flachwagen_fake.mdl"] = true,
				["Hccrss328_ars_fake.mdl"] = true,
				["Hccrss328_fake.mdl"] = true,
				["Laae540_fake.mdl"] = true,
				["Laaers560_fake.mdl"] = true,
				["Laeqrss548_fake.mdl"] = true,
				["Laeqrss550_fake.mdl"] = true,
				["Laes542_fake.mdl"] = true,
				["Laes547_fake.mdl"] = true,
				["Leeks544_fake.mdl"] = true,
				["Off52_fake.mdl"] = true,
				["Offhs66_fake.mdl"] = true,
				["Offs55_fake.mdl"] = true,
		}

        local hidden_loaded = {

				["DDm915_fernblau_beladen.mdl"] = true,
				["DDm915_gruen_beladen.mdl"] = true,
				["DDm915_oebb_beladen.mdl"] = true,
				["DDm915_verkehrsrot_beladen.mdl"] = true,
				["flachwagen_beladen.mdl"] = true,
				["Hccrss328_ars_beladen.mdl"] = true,
				["Hccrss328_beladen.mdl"] = true,
				["Laae540_beladen.mdl"] = true,
				["Laaers560_beladen.mdl"] = true,
				["Laeqrss548_beladen.mdl"] = true,
				["Laeqrss550_beladen.mdl"] = true,
				["Laes542_beladen.mdl"] = true,
				["Laes547_beladen.mdl"] = true,
				["Leeks544_beladen.mdl"] = true,
				["Off52_beladen.mdl"] = true,
				["Offhs66_beladen.mdl"] = true,
				["Offs55_beladen.mdl"] = true,
			}

		local modelFilter = function(fileName, data)
				local modelName = fileName:match('/([^/]*_fake.mdl)')
				return (modelName==nil or hidden[modelName]~=true)
			end
        local modelFilterLoaded = function(fileName, data)
				local modelName = fileName:match('/([^/]*_beladen.mdl)')
				return (modelName==nil or hidden_loaded[modelName]~=true)
			end

		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["autotransportfake"] == 0 then
				addFileFilter("model/vehicle", modelFilter)
			end
            if params["autotransportloaded"] == 0 then
				addFileFilter("model/vehicle", modelFilterLoaded)
			end
		else
			addFileFilter("model/vehicle", modelFilter)
		end
	end
}
end
