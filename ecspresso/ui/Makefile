.PHONY: push
push:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 091512051921.dkr.ecr.ap-northeast-1.amazonaws.com
	docker build -t ecsp/ui .
	docker tag ecsp/ui:latest 091512051921.dkr.ecr.ap-northeast-1.amazonaws.com/ecsp/ui:latest
	docker push 091512051921.dkr.ecr.ap-northeast-1.amazonaws.com/ecsp/ui:latest
