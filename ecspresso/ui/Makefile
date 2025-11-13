.PHONY: push
push:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 091512051921.dkr.ecr.ap-northeast-1.amazonaws.com
	docker build -t ecsp/ui .
	docker tag ecsp/ui:latest 091512051921.dkr.ecr.ap-northeast-1.amazonaws.com/ecsp/ui:latest
	docker push 091512051921.dkr.ecr.ap-northeast-1.amazonaws.com/ecsp/ui:latest

.PHONY: open
open:
	aws ecs list-tasks --cluster ecsp --service-name ecsp-ui --desired-status RUNNING --query 'taskArns[0]' --output text | \
		xargs -I {} aws ecs describe-tasks --cluster ecsp --tasks {} --query 'tasks[0].attachments[0].details[?name==`networkInterfaceId`].value' --output text | \
		xargs -I {} aws ec2 describe-network-interfaces --network-interface-ids {} --query 'NetworkInterfaces[0].Association.PublicIp' --output text | \
		xargs -I {} open http://{}

.PHONY: image-digest
image-digest:
	@aws ecr describe-images --repository-name ecsp/ui --region ap-northeast-1 --image-ids imageTag=latest --query 'imageDetails[0].imageDigest' --output text
