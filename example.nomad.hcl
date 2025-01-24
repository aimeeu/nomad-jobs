job "example" {
  group "group" {
    # claim the dynamic host volume for the allocation
    volume "groupvol" {
      type            = "host"
      source          = "example"
      access_mode     = "single-node-single-writer"
      attachment_mode = "file-system"
    }
    network {
      mode = "bridge"
      port "www" {
        to = 8001
      }
    }
    task "task" {
      driver = "docker"
      config {
        image   = "busybox:1"
        command = "httpd"
        args    = ["-vv", "-f", "-p", "8001", "-h", "/srv"]
        ports   = ["www"]
      }
      # mount the claimed volume to the task
      volume_mount {
        volume      = "groupvol"
        destination = "/srv"
      }
    }
  }
}
