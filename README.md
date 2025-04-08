# Setup instructions

1. Follow this guide on setting up ODBC17

    https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16&tabs=ubuntu18-install%2Calpine17-install%2Cubuntu16-install%2Credhat7-13-install%2Crhel7-offline#17

2. create the environment

```
python3 -m venv vnev
```

3. install requirments

```
source venv/bin/activate # for linux/mac users
venv/scripts/activate # for windows users

pip install -r requirements.txt
```

4. create the sql file in the /sql tab, say for example "foo.sql"

5. Change the line in up.py

```
create_table("sql/00-investor.sql")
```

into

```
create_table("sql/foo.sql")
```

this is for testing. in reality, we will do 1 whole for loop for all files in the /sql directory

okthxbye
