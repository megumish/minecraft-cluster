module "folder" {
  source  = "terraform-google-modules/folders/google"
  version = "3.1.0"

  all_folder_admins  = []
  folder_admin_roles = []
  names = [
    var.folder_name,
  ]
  parent            = "organizations/${var.organization_id}"
  per_folder_admins = {}
  set_roles         = false
}
