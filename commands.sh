python3 -m venv ~/.venv
source ~/.venv/bin/activate
make install 
make lint
az webapp up -n flask-ml-azure-cicd --sku F1
az webapp log config --web-server-logging filesystem --name flask-ml-azure-cicd --resource-group MainResourceGroup && az webapp log tail --name flask-ml-azure-cicd --resource-group MainResourceGroup
./make_predict_azure_app.sh