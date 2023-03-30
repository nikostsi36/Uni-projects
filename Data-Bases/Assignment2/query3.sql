SELECT stars.name as 'stars', constellations.name as 'constellation' 
FROM stars join constellations on stars.constellation_name = constellations.name
where constellations.hemisphere = 'North' and
stars.brightness > 1