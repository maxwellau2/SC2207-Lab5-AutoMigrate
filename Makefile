run-all:
	venv/bin/python down.py && venv/bin/python up.py && venv/bin/python seed.py

query:
	venv/bin/python query.py

say-hi:
	echo "hi"