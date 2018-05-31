enzoFR60.CVoiture = enzoFR60.CVoiture or {}

enzoFR60.CVoiture.CheckVersionAddon = true -- true = La verification marche, false = elle marche pas ;)

enzoFR60.CVoiture.JobYes = true -- Pas Touchée ! true = Le metier marche, false = le metier marche pas ;)

enzoFR60.CVoiture.SelectedLanguage = "en" -- en = english , fr = french

enzoFR60.CVoiture.Metier = { -- true = accés a l'addon, false = N'a pas accés a l'addon
	["Restaurateur De Vehicules"] = true,
	["Vehicle Restorer"] = true,
	-- ['Citoyen'] = true, -- Exemple
}

enzoFR60.CVoiture.TxtYes = false -- true = Sa Affiche le Txt sur les entitées, false = Sa l'affiche pas ;)

enzoFR60.CVoiture.DistanceTxt = 110 -- Distance d'affichage  des txts, Text display distance

enzoFR60.CVoiture.PrixMin = 5000 -- Prix Minimum d'une voiture, Minimum price of a car

enzoFR60.CVoiture.PrixMax = 10000 -- Prix Maximum d'une voiture, Maximum price of a car

enzoFR60.CVoiture.TempsChangement = 5 -- (En secondes) Temps de chargement, (In seconds) Loading time

-- Language config

if (enzoFR60.CVoiture.SelectedLanguage == "en") then

 -- Job
 enzoFR60.CVoiture.LanguageNameJob = "Vehicle Restorer"

 enzoFR60.CVoiture.LanguageDescriptionJob = [[You need to rebuild vehicles]]

 -- Entity
 enzoFR60.CVoiture.LanguageVR = "Vehicle to be restored"

 enzoFR60.CVoiture.LanguageLight = 'Light'

 enzoFR60.CVoiture.LanguageSiege = "Seat"
 
 enzoFR60.CVoiture.LanguageVitre = "Window"
 
 enzoFR60.CVoiture.LanguageRoue = "Wheel"
 
 enzoFR60.CVoiture.LanguageDoor = "Door"
 
 enzoFR60.CVoiture.LanguagePlaqueI = "License plate"
 
 enzoFR60.CVoiture.LanguageTime = "Time"
 
 enzoFR60.CVoiture.LanguageEtat = "Stat"
 
 enzoFR60.CVoiture.LanguageSign = "$"
 
 -- Sell
 
 enzoFR60.CVoiture.LanguageCVente = "You are on the phone with a customer ..."
 
 enzoFR60.CVoiture.LanguageFVente = "Bravo, You have managed to sell it"
 
 enzoFR60.CVoiture.LanguageNopVente = "The vehicle is already entrein to be sold!"
 
 enzoFR60.CVoiture.LanguageNFVente = "The Vehicle is not complete!"
 
 enzoFR60.CVoiture.LanguageErrorPhoneVente = "You must equip your phone!"
 
 enzoFR60.CVoiture.LanguageErrorJobVente = "You are no Vehicle Restorator"
 
 -- Weapons
 
 enzoFR60.CVoiture.LanguageArmeCle = "Key Of The Restorer"
 
 enzoFR60.CVoiture.LanguageArmePhone = "Restorer Telephone"
 
 -- Notif Check Version
 
 enzoFR60.CVoiture.LanguageCheckVersionValide = "You have the right version of the addon enzoFR60_cvoiture."
 
 enzoFR60.CVoiture.LanguageCheckVersionNonValide = "The version of the addon enzoFR60_cvoiture is not up to date."
 
 enzoFR60.CVoiture.LanguageCheckVersionError = "There was an error at the time of the audit"

elseif (enzoFR60.CVoiture.SelectedLanguage == "fr") then

 -- Job
 enzoFR60.CVoiture.LanguageNameJob = "Restaurateur De Vehicules"

 enzoFR60.CVoiture.LanguageDescriptionJob = [[Vous devez reconstrure des vehicules]]

 -- Entity
 enzoFR60.CVoiture.LanguageVR = "Vehicule à restaurateur"

 enzoFR60.CVoiture.LanguageLight = 'Phare'

 enzoFR60.CVoiture.LanguageSiege = "Siege"
 
 enzoFR60.CVoiture.LanguageVitre = "Vitre"
 
 enzoFR60.CVoiture.LanguageRoue = "Roue"
 
 enzoFR60.CVoiture.LanguageDoor = "Porte"
 
 enzoFR60.CVoiture.LanguagePlaqueI = "Plaque Immatriculation"
 
 enzoFR60.CVoiture.LanguageTime = "Temps"
 
 enzoFR60.CVoiture.LanguageEtat = "Etat"
 
 enzoFR60.CVoiture.LanguageSign = "€"
 
 -- Sell
 
 enzoFR60.CVoiture.LanguageCVente = "Vous etes au téléphone avec un client ..."
 
 enzoFR60.CVoiture.LanguageFVente = "Bravo, Vous avez reussi a la vendre"
 
 enzoFR60.CVoiture.LanguageNopVente = "Le vehicule est deja entrein d'etre vendu !"
 
 enzoFR60.CVoiture.LanguageNFVente = "Le Vehicule n'est pas complet!"
 
 enzoFR60.CVoiture.LanguageErrorPhoneVente = "Vous devez equiper votre telephone !"
 
 enzoFR60.CVoiture.LanguageErrorJobVente = "Tu est point restaurateur De Vehicules"
 
 -- Armes
 
 enzoFR60.CVoiture.LanguageArmeCle = "Cle Du Restaurateur"
 
 enzoFR60.CVoiture.LanguageArmePhone = "Telephone Du Restaurateur"
 
 -- Notif Check Version
 
 enzoFR60.CVoiture.LanguageCheckVersionValide = "Vous avez la bonne version de l'addon enzoFR60_cvoiture."
 
 enzoFR60.CVoiture.LanguageCheckVersionNonValide = "La version de l'addon enzoFR60_cvoiture est pas a jour."
 
 enzoFR60.CVoiture.LanguageCheckVersionError = "Il y a eu une erreur au moment de la verification"
 
end
