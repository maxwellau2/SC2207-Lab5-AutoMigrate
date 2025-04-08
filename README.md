# Setup instructions

1. Follow this guide on setting up ODBC17. Pls note we only noticed success in using it in WSL2 (ubutnu 22.04)

    https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16&tabs=ubuntu18-install%2Calpine17-install%2Cubuntu16-install%2Credhat7-13-install%2Crhel7-offline#17

2. create the environment

```
python3 -m venv venv
```

3. install requirments

```
source venv/bin/activate # for linux/mac users
venv/scripts/activate # for windows users

pip install -r requirements.txt
```

4. Run tips

-   To remove all tables

```
python down.py
```

-   To create all tables

```
python up.py
```

-   To seed the tables

```
python seed.py
```

-   To run the sequence (down,up,seed), ensure you have MAKE

```
sudo apt install make
```

-   Then you can run the macro that does (down,up,seed) for you

```
make run-all
```

-   To run queries (it will run all the queries in the queries folder in ascending order)

```
python query.py
```
