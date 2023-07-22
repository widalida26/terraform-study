locals {
  default_tags = {
    env = var.environment
  }

  vpc_tag = merge(local.default_tags, {
    Name = format(
      "%s-%s-%s-vpc",
      var.company,
      var.environment,
      var.project
    )
  })
}