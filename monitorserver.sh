#htmlfiles= ls /task6data/ | grep .html | wc -l
#phpfiles=  ls /task6data/ | grep .php | wc -l
cd /root/task6data/
if ls * | grep .html
then 
if kubectl get deployment | grep webserver
then
echo "webserver setup already running"
POD=$(kubectl get pods -l app=webserver -o jsonpath="{.items[0].metadata.name}")
kubectl cp *.html $POD:/usr/local/apache2/htdocs/
else
kubectl apply -f webserver.yaml
POD=$(kubectl get pods -l app=webserver -o jsonpath="{.items[0].metadata.name}")
kubectl cp *.html $POD:/usr/local/apache2/htdocs/
fi
else
echo "No files so no nedd for set up"
fi

if ls * | grep .php
then 
if  kubectl get deployment | grep php
then
echo "php setup already running"
POD=$(kubectl get pods -l app=php -o jsonpath="{.items[0].metadata.name}")
kubectl cp *.php $POD:/var/www/html
else
kubectl apply -f phpserver.yaml
POD=$(kubectl get pods -l app=php -o jsonpath="{.items[0].metadata.name}")
kubectl cp *.php $POD:/var/www/html
fi
else
echo "No files so no nedd for set up"
fi
