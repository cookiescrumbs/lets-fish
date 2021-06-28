# Trips 🏔️⚡🐟🗺️🦌⛈️⛺🥃🥾🏞️🗒️🖊️

An app for documenting our fishing trips

** This is only the view for viewing the trips. **
** Adding a trip is contained in the rails app. I may move it into the Angular app later. **

#### Development

During development we can server the app via the rails dev server. 
Start postgres & the rails app `rake pg_db:start && foreman start`
Then compile and watch the Angular app ...  `npm run dev:build` ... run this in the "trips-app" folder

This will watch for changes and compile the app to `/trips-app/` which is served via a static route in rails.
No hot-reload so you'll need to refresh the browser like it 2012 👻

These routes should work in rails...

http://localhost:5000/trips/-MIYqXXPkV0d4hfhpZAN


 #### Production 
 
 In production the app is just compiled locally and deployed. It's served via the static route in the rails app, just like in development 🦄 🌈
 
 Build for production: `npm run prod:build` 

