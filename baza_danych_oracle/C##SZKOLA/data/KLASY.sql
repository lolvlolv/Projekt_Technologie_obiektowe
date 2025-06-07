drop user c##szkola cascade;
create user c##szkola identified by admin;
grant connect, resource to c##szkola;
alter user c##szkola quota unlimited on USERS;
grant dba to C##SZKOLA;