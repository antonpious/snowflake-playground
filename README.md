# snowflake-playground
Working with Snowflake Trial Standard Edition


Download and Install SnowSQL

Connecting to SnowSQL   

After executing without a correct account you would get this error.

`250003 (08001): 404 Not Found: post https://WXC75416.snowflakecomputing.com:443/session/v1/login-request?request_id=36bd10b6-3f64-4c4b-8365-3ef1c031fba7&request_guid=e2a10717-97cd-4929-a903-152dc5342d37
If the error message is unclear, enable logging using -o log_level=DEBUG and see the log to find out the cause. Contact support for further help.

The account identifier  
xxxxx-xxxxx
`
The account is the Account Identifier on your Account View Account Details Tab  
It should combine Organization Name and Account Name  
Don't copy only the account name

For the Password create an entry in the ~/.zshrc file  
`export SNOWSQL_PWD=<Your Password>`  

`snowsql -a <your org account id> -u <Your Username>`  

The password would be automatically picked up.


Short cut to execute the SQL at the given line is  Snow


For running the current line in query  Snowsight editor 
`Cmd + enter`   


## Snowflake extension for VS Code  
You can use this this extension to run the queries from within Code without having to go to the Snowsight IDE.  

After installing go to the Extension on the left, complete the login credentials.  

Now you can execuite SQL commands and see the result in VS Code.  


