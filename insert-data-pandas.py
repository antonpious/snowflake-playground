# pandas is installed as part of snowflake pandas
import pandas as pd
import snowflake.connector as snow
from snowflake.connector.pandas_tools import write_pandas
from dotenv import load_dotenv
import os

# loading variables from .env file
load_dotenv() 


username = os.getenv("SNOWFLAKE_USERNAME")
password = os.getenv("SNOWFLAKE_PASSWORD")
account = os.getenv("SNOWFLAKE_ACCOUNT")

conn = snow.connect(
user=username,
password=password,
account=account,
warehouse="COMPUTE_WH",
database="playground",
schema="humanresources")

# index_col=0 did not work

source_data_df = pd.read_csv('data/getting-started/employees06.csv')

pd.options.display.max_columns = len(source_data_df.columns)
                                     

# when interacting with snowflake
# all objects should be in upper case
source_data_df.columns = map(lambda x: str(x).upper(), source_data_df.columns)

# All columns would be inserted as string 
# special processing is need to create the date and other column types

print(source_data_df)

# it is case sensitive
# employee is not same as EMPLOYEE
# all objects should be in upper case
write_pandas(conn, source_data_df, table_name='EMPLOYEE', auto_create_table=True)

cur = conn.cursor()

sql = "select * from humanresources.employee"
results = cur.execute(sql).fetchall()

for rec in results:
    print('%s, %s' % (rec[0], rec[1]))

cur.close()
conn.close()
