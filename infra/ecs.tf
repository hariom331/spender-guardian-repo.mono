resource "aws_ecs_cluster" "app_cluster" {
  name = "spender-guardian-cluster"
}

# ECS Task Definition (The blueprint for running your Docker container)
resource "aws_ecs_task_definition" "app_task" {
  family                   = "spender-guardian-task-family"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  # The JSON configuration is loaded from the template file:
  container_definitions    = file("${path.module}/task-definition-template.json")
}


resource "aws_ecs_service" "app_service" {
  name             = "spender-guardian-service"
  cluster          = aws_ecs_cluster.app_cluster.name
  task_definition  = aws_ecs_task_definition.app_task.arn
  desired_count    = 1
  launch_type      = "FARGATE"


}
