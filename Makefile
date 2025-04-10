test:
	venv/bin/python test.py

run-all:
	venv/bin/python down.py && venv/bin/python up.py && venv/bin/python seed.py && make say-hi

query:
	venv/bin/python query.py

say-hi:
	echo "Success ✅"