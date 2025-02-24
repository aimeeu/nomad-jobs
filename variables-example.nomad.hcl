# Use Nomad Variables to modify this job's output:
# run "nomad var put nomad/jobs/variables-example name=YOUR_NAME" to get started

job "variables-example" {
  # Specifies the datacenter where this job should be run
  # This can be omitted and it will default to ["*"]
  datacenters = ["*"]

  ui {
    description = "A job that uses **Nomad Variables** to modify its output"
    link {
      label = "Learn more about Nomad Variables"
      url = "https://developer.hashicorp.com/nomad/docs/concepts/variables"
    }
    link {
      label = "See this job on Github"
      url = "https://github.com/hashicorp/nomad/blob/main/ui/app/utils/default_jobs/variables.js"
    }
  }

  group "web" {

    network {
      # Task group will have an isolated network namespace with
      # an interface that is bridged with the host
      port "www" {
        to = 9001
      }
    }

    service {
      provider = "nomad"
      port     = "www"
    }

    task "http" {

      driver = "docker"

      config {
        image   = "busybox:1"
        command = "httpd"
        args    = ["-v", "-f", "-p", "8001", "-h", "/local"]
        ports   = ["www"]
      }

      # Create a template resource that will be used to render the html file
      # using the Nomad variable at "nomad/jobs/variables-example"
      template {
        data        = "<html>hello, {{ with nomadVar \" nomad/jobs/variables-example \" }}{{ .name }}{{ end }}</html>"
        destination = "local/index.html"
      }

      resources {
        cpu    = 128
        memory = 128
      }

    }
  }
}
