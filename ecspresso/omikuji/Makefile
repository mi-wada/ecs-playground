.PHONY: push
push:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 091512051921.dkr.ecr.ap-northeast-1.amazonaws.com
	docker build -t ecsp/omikuji .
	docker tag ecsp/omikuji:latest 091512051921.dkr.ecr.ap-northeast-1.amazonaws.com/ecsp/omikuji:latest
	docker push 091512051921.dkr.ecr.ap-northeast-1.amazonaws.com/ecsp/omikuji:latest
