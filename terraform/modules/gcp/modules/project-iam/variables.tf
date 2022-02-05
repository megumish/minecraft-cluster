variable "project_id" {
  type = string
}

variable "project_factory_email" {
  type = string
}

variable "project_number" {
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
