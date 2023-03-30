SELECT planets.name, distance_from_star, planetary_system_name
FROM planets join planets_consist_of on planets_consist_of.planet_name = planets.name
where planets_consist_of.chemical_element = 'Carbon' and 
	  planets_consist_of.percentage >= 30 and
      planets.has_atmosphere = 1