variable  "tags" {
  type        = map
  default     = {
    project = "expense"
    resource = "k8-master"
    terraform = true
  }
 }
