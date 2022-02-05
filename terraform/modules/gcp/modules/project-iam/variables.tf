variable "project_id" {
  type = string
}

variable "project_factory_email" {
  type = string
}

variable "api_sa_email" {
  type = string
}

variable "project_owners" {
  type = list(object(
    {
      type  = string
      email = string
    }
  ))
}
