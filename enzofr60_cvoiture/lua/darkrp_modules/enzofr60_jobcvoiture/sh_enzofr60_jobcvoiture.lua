TEAM_ENZOFR60_CVOITURE = DarkRP.createJob(enzoFR60.CVoiture.LanguageNameJob, {
            color = Color(0, 0, 0, 255),
            model = "models/player/eli.mdl",
            description = enzoFR60.CVoiture.LanguageDescriptionJob,
            weapons = {"enzofr60_cvoiture_tel"},
            command = 'enzofr60cvoiture',
            max = 2,
            salary = 50,
            admin = 0,
            category = "Citizens",
            vote = true,
            hasLicense = false
      })

      DarkRP.createEntity(enzoFR60.CVoiture.LanguageVR, {
            ent = 'enzofr60_cvoiture_voiturev',
            model = 'models/props_vehicles/car002b_physics.mdl',
            price = 5000,
            max = 2,
            cmd = 'buycvoiturevoiturev',
            allowed = {TEAM_ENZOFR60_CVOITURE}
      })

	DarkRP.createEntity(enzoFR60.CVoiture.LanguageLight, {
            ent = 'enzofr60_cvoiture_phare',
            model = 'models/maxofs2d/light_tubular.mdl',
            price = 200,
            max = 10,
            cmd = 'buycvoiturephare',
            allowed = {TEAM_ENZOFR60_CVOITURE}
    })
	  
	DarkRP.createEntity(enzoFR60.CVoiture.LanguagePlaqueI, {
            ent = 'enzofr60_cvoiture_plaquei',
            model = 'models/enzofr60/cvoiture/enzofr60_cvoiture_plaquei.mdl',
            price = 200,
            max = 10,
            cmd = 'buycvoitureplaquei',
            allowed = {TEAM_ENZOFR60_CVOITURE}
   })
   
   DarkRP.createEntity(enzoFR60.CVoiture.LanguageDoor, {
            ent = 'enzofr60_cvoiture_porte',
            model = 'models/props_vehicles/carparts_door01a.mdl',
            price = 200,
            max = 10,
            cmd = 'buycvoitureporte',
            allowed = {TEAM_ENZOFR60_CVOITURE}
  })
  
  DarkRP.createEntity(enzoFR60.CVoiture.LanguageRoue, {
            ent = 'enzofr60_cvoiture_roue',
            model = 'models/props_vehicles/carparts_wheel01a.mdl',
            price = 200,
            max = 10,
            cmd = 'buycvoitureroue',
            allowed = {TEAM_ENZOFR60_CVOITURE}
  })
  
  DarkRP.createEntity(enzoFR60.CVoiture.LanguageVitre, {
            ent = 'enzofr60_cvoiture_vitre',
            model = 'models/props_phx/construct/glass/glass_plate1x1.mdl',
            price = 200,
            max = 10,
            cmd = 'buycvoiturevitre',
            allowed = {TEAM_ENZOFR60_CVOITURE}
  })
  
  DarkRP.createEntity(enzoFR60.CVoiture.LanguageSiege, {
            ent = 'enzofr60_cvoiture_siege',
            model = 'models/props_phx/carseat2.mdl',
            price = 200,
            max = 10,
            cmd = 'buycvoituresiege',
            allowed = {TEAM_ENZOFR60_CVOITURE}
  })
