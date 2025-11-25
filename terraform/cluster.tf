resource "aws_ecs_cluster" "main" {
  name = "ecsp"
  configuration {
    execute_command_configuration {
      kms_key_id = null
      logging    = "DEFAULT"
    }
  }
  service_connect_defaults {
    # TODO: この aws_service_discovery_private_dns_namespace をimportする
    namespace = "arn:aws:servicediscovery:ap-northeast-1:091512051921:namespace/ns-zk76jgg6umbfy3x4"
  }
  setting {
    name  = "containerInsights"
    value = "enhanced"
  }
}
