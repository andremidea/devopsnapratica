class loja_virtual {
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  Exec['apt-update'] -> Package <| |>
}
