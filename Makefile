
ACCOUNT_ID=$(shell aws sts get-caller-identity --query Account | tr -d '"')
AWS_REGION=$(shell aws configure get region)

setup-cdk-local:
	npm install -g aws-cdk@2.51.1
	python -m venv venv
	. venv/bin/activate
	pip3 install -r requirements.txt

deploy-mlops:
	cdk bootstrap aws://$(ACCOUNT_ID)/$(AWS_REGION)
	cdk deploy --parameters ProjectName=mlflow --require-approval never


destroy-mlops:
	cdk destroy --require-approval never

