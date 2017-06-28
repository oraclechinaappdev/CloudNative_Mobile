-- this script should be executed by sysdba to create the required USER
-- e.g. ** remember to sudo su - oracle before running it
--    sqlplus "/as sysdba" @init-create-dbuser.sql
ALTER SESSION SET CONTAINER = pdb1;
DROP USER loyalty cascade;
GRANT all privileges to loyalty IDENTIFIED BY "Welcome_1";
COMMIT;
exit;
