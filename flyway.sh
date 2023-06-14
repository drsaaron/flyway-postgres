#! /bin/sh 

if [ $# != 1 ]
then
    echo "usage: $(basename $0) clean|migrate" 1>&2
    exit 1
fi

case $1 in
    clean)
	action=flyway:clean
	;;
    migrate)
	action=flyway:migrate
	;;
    *)
	echo "action is clean or migrate, nothing else." 1>&2
	exit 1
esac
    
server=localhost
userID=drsaaron
[ "$server" = "localhost" ] && key="local-postgres" || key=$server
password=$(pass Database/$key/$userID)

url="jdbc:postgresql://$server:5432/drsaaron?currentSchema=test_flyway"

mvn -Dflyway.url="$url" -Dflyway.driver="org.postgresql.Driver" -Dflyway.user="$userID" -Dflyway.password="$password" -Dflyway.sqlMigrationPrefix=DBR -Dflyway.locations=filesystem:`pwd` -Dflyway.table=schema_version $action

