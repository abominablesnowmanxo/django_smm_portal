# django_smm_portal

1. Clone the repo
```
https://github.com/abominablesnowmanxo/django_smm_portal.git
```
2. Run docker-compose file
```
docker-compose up -d --build
```
3. Import the db dump
```
cat dump_17-08-2023_15_48_35.sql | docker exec -i db_smm psql -U postgres
```
