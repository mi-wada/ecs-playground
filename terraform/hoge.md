```
[0m[1maws_iam_openid_connect_provider.github_actions: Refreshing state... [id=arn:aws:iam::091512051921:oidc-provider/token.actions.githubusercontent.com][0m
[0m[1mdata.aws_iam_policy.power_user_access: Reading...[0m[0m
[0m[1mdata.aws_iam_policy.amazon_ecs_task_execution_role_policy: Reading...[0m[0m
[0m[1maws_ecs_cluster.main: Refreshing state... [id=arn:aws:ecs:ap-northeast-1:091512051921:cluster/ecsp][0m
[0m[1maws_service_discovery_http_namespace.main: Refreshing state... [id=ns-zk76jgg6umbfy3x4][0m
[0m[1maws_cloudwatch_log_group.main["ecsp-omikuji"]: Refreshing state... [id=/ecs/ecsp-omikuji][0m
[0m[1maws_vpc.main: Refreshing state... [id=vpc-041ec08650dfd2662][0m
[0m[1maws_iam_role.ecs_task_execution: Refreshing state... [id=ecsTaskExecutionRole][0m
[0m[1maws_cloudwatch_log_group.main["ecsp-ui"]: Refreshing state... [id=/ecs/ecsp-ui][0m
[0m[1maws_ecr_repository.omikuji: Refreshing state... [id=ecsp/omikuji][0m
[0m[1maws_iam_role.ecs_task: Refreshing state... [id=ecsTaskRole][0m
[0m[1maws_ecr_repository.ui: Refreshing state... [id=ecsp/ui][0m
[0m[1mdata.aws_iam_policy.amazon_ssm_managed_instance_core: Reading...[0m[0m
[0m[1maws_route_table.private: Refreshing state... [id=rtb-0429b2be8d27db694][0m
[0m[1maws_security_group.alb: Refreshing state... [id=sg-04cba5278b85bbe66][0m
[0m[1maws_security_group.private: Refreshing state... [id=sg-0b390c276aeaac81e][0m
[0m[1maws_lb_target_group.ui: Refreshing state... [id=arn:aws:elasticloadbalancing:ap-northeast-1:091512051921:targetgroup/ecsp-ui-tg/0a0a34b01cc16d43][0m
[0m[1maws_subnet.public["ap-northeast-1a"]: Refreshing state... [id=subnet-0f0993dad47891679][0m
[0m[1maws_subnet.public["ap-northeast-1c"]: Refreshing state... [id=subnet-0c1a1ea95c60a7b35][0m
[0m[1maws_subnet.private["ap-northeast-1c"]: Refreshing state... [id=subnet-0aed015f85b762c00][0m
[0m[1maws_subnet.private["ap-northeast-1a"]: Refreshing state... [id=subnet-0fe21f9e3f3f3dffc][0m
[0m[1maws_internet_gateway.main: Refreshing state... [id=igw-0a82f53f903ad5712][0m
[0m[1maws_security_group.interface_vpc_endpoint: Refreshing state... [id=sg-0da5af9928f0e2b7c][0m
[0m[1maws_vpc_endpoint.s3: Refreshing state... [id=vpce-045bf23c1c69cd81a][0m
[0m[1maws_vpc_security_group_egress_rule.alb: Refreshing state... [id=sgr-01b38c8a79a3c1e61][0m
[0m[1maws_vpc_security_group_ingress_rule.alb: Refreshing state... [id=sgr-0cf01858fc2a6aa01][0m
[0m[1maws_vpc_security_group_ingress_rule.private_allow_private_inbound: Refreshing state... [id=sgr-0c90fc0f75fff7007][0m
[0m[1maws_vpc_security_group_egress_rule.private_allow_all_outbound: Refreshing state... [id=sgr-06056e11d2707527c][0m
[0m[1maws_lb.ui: Refreshing state... [id=arn:aws:elasticloadbalancing:ap-northeast-1:091512051921:loadbalancer/app/ecsp/b5e1e1f7c261bf25][0m
[0m[1maws_route_table_association.private["ap-northeast-1c"]: Refreshing state... [id=rtbassoc-09ab0d9a5e5a8f6df][0m
[0m[1maws_route_table_association.private["ap-northeast-1a"]: Refreshing state... [id=rtbassoc-035de31c833af1dd2][0m
[0m[1maws_route_table.public: Refreshing state... [id=rtb-08292e5be709cccc2][0m
[0m[1maws_iam_role.github_actions: Refreshing state... [id=GitHubActionsRole][0m
[0m[1maws_vpc_endpoint.ecr_dkr: Refreshing state... [id=vpce-033cb400b8700b58c][0m
[0m[1maws_vpc_endpoint.logs: Refreshing state... [id=vpce-05242447fbe13c2ef][0m
[0m[1maws_vpc_security_group_ingress_rule.interface_vpc_endpoint_allow_private: Refreshing state... [id=sgr-016f658abba9602ae][0m
[0m[1maws_vpc_endpoint.ecr_api: Refreshing state... [id=vpce-0713dd3340f8659e2][0m
[0m[1maws_route_table_association.public["ap-northeast-1a"]: Refreshing state... [id=rtbassoc-0bc927f0b6a59060d][0m
[0m[1maws_route_table_association.public["ap-northeast-1c"]: Refreshing state... [id=rtbassoc-041aa910333e4853c][0m
[0m[1maws_lb_listener.ui_http: Refreshing state... [id=arn:aws:elasticloadbalancing:ap-northeast-1:091512051921:listener/app/ecsp/b5e1e1f7c261bf25/12b783f7bacac236][0m
[0m[1mdata.aws_iam_policy.power_user_access: Read complete after 4s [id=arn:aws:iam::aws:policy/PowerUserAccess][0m
[0m[1maws_iam_role_policy_attachment.github_actions: Refreshing state... [id=GitHubActionsRole/arn:aws:iam::aws:policy/AdministratorAccess][0m
[0m[1mdata.aws_iam_policy.amazon_ecs_task_execution_role_policy: Read complete after 5s [id=arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy][0m
[0m[1maws_iam_role_policy_attachment.ecs_task_execution: Refreshing state... [id=ecsTaskExecutionRole/arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy][0m
[0m[1mdata.aws_iam_policy.amazon_ssm_managed_instance_core: Read complete after 5s [id=arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore][0m
[0m[1maws_iam_role_policy_attachment.ecs_task: Refreshing state... [id=ecsTaskRole/arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore][0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
[31m-[0m/[32m+[0m destroy and then create replacement[0m

Terraform will perform the following actions:

[1m  # aws_iam_role_policy_attachment.github_actions[0m must be [1m[31mreplaced[0m
[0m[31m-[0m/[32m+[0m[0m resource "aws_iam_role_policy_attachment" "github_actions" {
      [33m~[0m[0m id         = "GitHubActionsRole/arn:aws:iam::aws:policy/AdministratorAccess" -> (known after apply)
      [33m~[0m[0m policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess" [33m->[0m[0m "arn:aws:iam::aws:policy/PowerUserAccess" [31m# forces replacement[0m[0m
        [90m# (1 unchanged attribute hidden)[0m[0m
    }

[1mPlan:[0m [0m1 to add, 0 to change, 1 to destroy.
[90m
─────────────────────────────────────────────────────────────────────────────[0m

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
```
## hoge


