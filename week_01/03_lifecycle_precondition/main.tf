resource "local_file" "test_file" {
  content  = "lifecycle test"
  filename = "${path.module}/${var.file_name}"

  lifecycle {
    postcondition {
      condition     = contains(["step00.txt", "step01.txt", "step02.txt", "step03.txt", "step04.txt", "step05.txt", "step06.txt", "step07.txt"], "${var.file_name}")
      error_message = "step is over \"step07\""
    }
  }
}