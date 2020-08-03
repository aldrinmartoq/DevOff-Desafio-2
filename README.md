Mi implementación del [desafío 2 de @devoffarg](https://github.com/devoffarg/DevOff-Desafio-2) en Ruby.

Para ejecutar:
```
  ruby main.rb

  curl -d '{ "vueltas": 4, "mensaje": "Devoff se puso ATR" }' -X POST http://localhost:4567/encriptar
  # => {"mensaje":"DfesTef oRv p  osuA"}

  curl -d '{ "vueltas": 4, "mensaje": "DfesTef oRv p  osuA" }' -X POST http://localhost:4567/desencriptar
  # => {"mensaje":"Devoff se puso ATR"}
```
