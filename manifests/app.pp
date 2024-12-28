# atualizar as listas de pacotes disponíveis
exec { "app-update":
    command => "/usr/bin/apt-get update"
}

# instalar o Apache
package { ["apache2"]:
    ensure => installed
}

# criar o service do Apache
service { "apache2":
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Package["apache2"]
}
