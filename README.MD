## Prerequisites
- docker
- mssql image
- SSMS or DataGrip


## Excalidraw

https://excalidraw.com/#json=jMJUAlkFIXNULwb_FF7Ro,h5gfPKUYw4COYfUb-BkrFA

Diagram: 
![Diagram](database.excalidraw.svg)

## How to start

Open terminal in project's root folder. 
Run
```console
docker compose up -d
```


## How to connect using DataGrip

Click on `File` -> `New` -> `Datasource`
Then select `Microsoft SQL Server`

![alt text](image.png)

> Default username is `sa`

Pick a password specified in `docker-compose.yml` file `SA_PASSWORD` variable.

If you keep all default settings, the `URL` would be `jdbc:sqlserver://localhost:1433`

Once you enter `host`,`port`,`username` and `password` click `Test Connection`
You should see 
![alt text](image-1.png)