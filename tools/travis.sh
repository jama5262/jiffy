# Run pub get to fetch packages.
./flutter/bin/flutter pub get

# Verify that the libraries are error and warning-free.
echo "Running dartanalyzer..."
dartanalyzer lib test example

# Verify that dartfmt has been run.
echo "Checking dartfmt..."
if [[ $(dartfmt -n --set-exit-if-changed lib test example) ]]; then
	echo "Failed dartfmt check"
	exit 1

fi

# Run the tests.
echo "Running tests..."
./flutter/bin/flutter pub run test --reporter expanded
./flutter/bin/flutter test --coverage