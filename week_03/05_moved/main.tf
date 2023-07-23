resource "local_file" "a" {
    content = "moved test"
    filename = "${path.module}/test.txt"
}

# moved {
#     from = local_file.a
#     to = local_file.b
# }

output "file_content" {
    value = local_file.b.content
}