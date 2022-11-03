resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-example"
    namespace = "not default"
    labels = {
      test = "MyExampleApp"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "MyExampleApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyExampleApp"
        }
        spec {
          automount_service_account_token = false
        }
      }
    }
  }
}
