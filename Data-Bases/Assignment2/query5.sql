SELECT moons.name
FROM planetary_systems join planets on planets.planetary_system_name = planetary_systems.name 
	 join moons on moons.planet_name = planets.name
WHERE moons.average_temperature > -30 and
	  moons.average_temperature < 50 and
      moons.mass > (SELECT planets.mass FROM planets WHERE planets.name = 'Earth') and
      planetary_systems.galaxy_name = 'Milky Way'