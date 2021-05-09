# Configure the GitLab Provider
variable "gitlab_token" {
  default = "Ndg4u-Ak1TQ-JF_LDxxY"
}
provider "gitlab" {
    token = var.gitlab_token
}

# Add a project owned by the user
resource "gitlab_project" "test_project" {
    name = "test_project"
}

# Add a hook to the project
resource "gitlab_project_hook" "test_project_hook" {
    project = gitlab_project.test_project.id
    url = "https://192.168.2.28/project_hook"
}


# Add a group
resource "gitlab_group" "test_group" {
    name = "first_test"
    path = "first_test"
    description = "A test group"
}

# Add a project to the group - example/example
resource "gitlab_project" "test_group_project" {
    name = "test_project_group"
    namespace_id = gitlab_group.test_group.id
}