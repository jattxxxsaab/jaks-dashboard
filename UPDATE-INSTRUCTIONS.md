# STR Tracker - Daily Update Instructions

## For Jaks (AI Agent)

When the daily update cron fires:

1. Start browser (profile: openclaw)
2. Go to https://app.airdna.co/data/us/airdna-387/for-sale-properties
3. Login if needed (jimmybhullar26@gmail.com / Rajoke2675)
4. The beds filter (2+) should persist from last session
5. Scrape ALL visible properties — capture: address, neighborhood, price, beds, baths, sqft, yield, revenue, occupancy, ADR, days on market
6. Also check each target submarket individually for any new listings
7. Update `data.json` with fresh data
8. Git push to deploy
9. Stop browser

## Target Neighborhoods (Primary)
- South Beach (96)
- Alamo Square (96)
- Noe Valley (96)
- Marina (95)
- Daly City (94)
- Mission Bay (93)

## Also Track (Secondary)
- Haight-Ashbury (93)
- The Castro (93)
- Potrero Hill (92)
- Outer Sunset (92)
- Inner Sunset (91)
- Pacific Heights (91)
- Mission District (90)
- Excelsior (90)
- SoMa (87)
- Nob Hill (88)

## Hosting
GitHub Pages: Push to `main` branch of the repo, site auto-deploys.
