SELECT planets.name, distance_from_star, planetary_system_name
FROM planets join planets_consist_of on planets_consist_of.planet_name = planets.name
	 join planetary_systems on planets.planetary_system_name = planetary_systems.name
where planets_consist_of.chemical_element = 'Carbon' and 
	  planets_consist_of.percentage >= 30 and
      planets.has_atmosphere = 1 and
      planetary_systems.start_of_habitable_zone < planets.distance_from_star and
      planetary_systems.end_of_habitable_zone > planets.distance_from_star