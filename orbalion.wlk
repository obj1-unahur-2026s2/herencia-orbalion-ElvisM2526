//Equipo

class Equipo {
  const property nombre
  var nivelDeEnergiaBase = 0
  var entrenador
  const listaDeTecnologiasComplementarias = []

  method nivelDeEnergiaBase() = nivelDeEnergiaBase
  method entrenador() = entrenador
  method listaDeTecnologiasComplementarias() = listaDeTecnologiasComplementarias

  method energiaTotal() {
    const tecnologiasActivas = listaDeTecnologiasComplementarias.filter({unaTecnologia => unaTecnologia.activo()})
    return nivelDeEnergiaBase + tecnologiasActivas.sum({unaTecnologia => unaTecnologia.valorEnergetico()})
  }

  method esDePrestigioUniversal() = false
}

//Linajes

class Luminico inherits Equipo{
  var nivelDeRadiacionCapturado = 0
  const listaDeCristalesSolares = []

  method nivelDeRadiacionCapturado() = nivelDeRadiacionCapturado
  method listaDeCristalesSolares() = listaDeCristalesSolares

  override method energiaTotal() {
    if(nivelDeRadiacionCapturado < 5000){
        return super() * 1.1
    } else{
        return super()
    }
  }

  override method esDePrestigioUniversal() {
    const almenosUnaTecnologiaActiva = listaDeTecnologiasComplementarias.any({unaTecnologia => unaTecnologia.activo()})

    return (listaDeCristalesSolares.size() >= 3) and self.entrenador().esDeEliteGalactica() and almenosUnaTecnologiaActiva
  }
}

class Sintetico inherits Equipo{
  var nivelDeProcesamientoCentral = 0
  var cantidadDeModulosActivos = 0
  var unidadEstable = false

  method nivelDeProcesamientoCentral() = nivelDeProcesamientoCentral
  method cantidadDeModulosActivos() = cantidadDeModulosActivos
  method unidadEstable() = unidadEstable

  override method energiaTotal() {
    if(cantidadDeModulosActivos > 5){
        return super() * 0.8
    } else{
        return super()
    }
  }

  override method esDePrestigioUniversal() {
    const todasLasTecnologiasActivas = listaDeTecnologiasComplementarias.all({unaTecnologia => unaTecnologia.activo()})

    return unidadEstable and (cantidadDeModulosActivos > 3) and todasLasTecnologiasActivas
  }
}

class Eterico inherits Equipo{
  var nivelDeFluctuacionDimensional = 0
  var cantidadDePortalesEnergicosAbiertos = 0

  method nivelDeFluctuacionDimensional() = nivelDeFluctuacionDimensional
  method cantidadDePortalesEnergicosAbiertos() = cantidadDePortalesEnergicosAbiertos
}

//Entrenadores

class Entrenador {
  var cantidadDeCiclosSolaresDeExperiencia = 0
  var estaEnSintoniaConSuEquipo = false
  var nivelDePresicionEstrategica = 0
  var rol = "Estratega Cuantico"

  method cantidadDeCiclosSolaresDeExperiencia() = cantidadDeCiclosSolaresDeExperiencia
  method estaEnSintoniaConSuEquipo() = estaEnSintoniaConSuEquipo
  method nivelDePresicionEstrategica() = (nivelDePresicionEstrategica).max(0).min(100)
  method rol() = rol

  method cambiar(unRol) {
    if(unRol == "Estratega Cuantico" or unRol == "Arquitecto de Energia" or unRol == "Guia Mental"){
        rol = unRol
    } else{
        self.error("Rol no homologado por la FOZ")
    }
  }

  method esDeEliteGalactica() {
    return cantidadDeCiclosSolaresDeExperiencia > 10 and ((rol == "Estratega Cuantico" and nivelDePresicionEstrategica > 80) or (rol == "Arquitecto de Energia" and estaEnSintoniaConSuEquipo) or (rol == "Guia Mental"))
  }
}

//Tecnologias especiales

class TecnologiaComplementaria {
  const property nombre
  var valorEnergetico = 0
  var activo = false

  method valorEnergetico() = valorEnergetico
  method activo() = activo
}

