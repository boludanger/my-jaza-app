#!/bin/sh
# Start Firebase emulators in the background
firebase emulators:start --only firestore,auth &

# Wait for a few seconds to ensure emulators are fully started
sleep 10

# Start the web server to serve the application
serve -s . -l 3000