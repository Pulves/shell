#Script para download de docker-engine e airflow

#download of the docker-engine
echo -n "Instalando docker..."
var=`curl -fsSL https://get.docker.com -o get-docker.sh`
if [ $? -gt 0 ];
then echo "Erro: $var"
else
	sh ./get-docker.sh --dry-run
fi

var=`curl -fsSL https://get.docker.com -o get-docker.sh`


if [ $? -gt 0 ];
then echo "Erro: $var"
else
	sh get-docker.sh
fi

var=`curl -fsSL https://test.docker.com -o test-docker.sh`
if [ $? -gt 0 ];
then echo "Erro: $var"
else
	sh test-docker.sh
fi
#download and installed apache-airflow
echo -n "Instalando apache airflow..."
var=`curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.6.3/docker-compose.yaml'`

if [ $? -gt 0 ];
then echo "Erro: $var"
else

	mkdir -p ./dags ./logs ./plugins ./config

	echo -e "AIRFLOW_UID=$(id -u)" > .env
fi

docker compose up airflow-init

docker compose up