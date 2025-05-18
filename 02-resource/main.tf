provider "null" {}

resource "null_resource" "test" {}
resource "null_resource" "test1" {}

output "test" {
  value = null_resource.test.id
}

resource "null_resource" "test1" {}
output "test1" {
  value = null_resource.test1.id
}