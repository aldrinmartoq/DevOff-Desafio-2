require 'sinatra'

def encriptar(largo, texto)
  mensaje = ''
  n = (texto.length / largo.to_f).ceil
  (0...largo).each do |i|
    (0...n).each do |j|
      mensaje += texto[j * largo + i] || ' '
    end
  end

  mensaje.strip
end

def desencriptar(largo, mensaje)
  texto = ''
  n = (mensaje.length / largo.to_f).ceil
  (0...n).each do |i|
    (0...largo).each do |j|
      texto += mensaje[j * n + i] || ' '
    end
  end

  texto.strip
end

puts <<~FIN
  Ejemplo de invocación:

  curl -d '{ "vueltas": 4, "mensaje": "Devoff se puso ATR" }' -X POST http://localhost:4567/encriptar
  # => {"mensaje":"DfesTef oRv p  osuA"}
  curl -d '{ "vueltas": 4, "mensaje": "DfesTef oRv p  osuA" }' -X POST http://localhost:4567/desencriptar
  # => {"mensaje":"Devoff se puso ATR"}

FIN

post '/encriptar' do
  data = JSON.parse(request.body.read)
  { mensaje: encriptar(data['vueltas'], data['mensaje']) }.to_json
end

post '/desencriptar' do
  data = JSON.parse(request.body.read)
  { mensaje: desencriptar(data['vueltas'], data['mensaje']) }.to_json
end
