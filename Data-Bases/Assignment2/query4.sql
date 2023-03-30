SELECT moons.name
FROM moons
WHERE moons.average_temperature > -30 and
	  moons.average_temperature < 50 and
      moons.mass > (SELECT planets.mass FROM planets WHERE planets.name = 'Earth') 