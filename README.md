# README

## Dependencies
This app using Rails 5.0.2 and ruby 2.2.3
You need to get a citymapper_key and put in the .env file (rename .env.prod to .env)

## App specifications
- Set addresses or plot points on a map where our negotiators need to visit (the negotiator should always start at our office in Barbican)
- Set the start time and date the negotiator will be leaving on their journey
- See the arrival time of the negotiator at each of the points along the route
- Allow us to set how long the negotiator will be at each location for, before setting off for their next location
- Specifically limit addresses/plot points to London

## Goal of this app
Use Citymapper API to get the travel time between two addresses and calculate arrival time depending on visits/meetings duration.  