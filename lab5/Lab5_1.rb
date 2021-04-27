require 'socket'
require 'rack'
require 'rack/utils'
require_relative 'App'

server = TCPServer.new('0.0.0.0', 3000)
app = App.new
cash_machine = CashMachine.new

while (connection = server.accept)
  request = connection.gets
  method, full_path = request.split(' ')
  path, params = full_path.split('?')

  status, headers, body = app.call(
    {
           'REQUEST_METHOD' => method,
           'PATH_INFO' => path
        }, params, cash_machine)

  connection.print("HTTP/1.1 #{status}\r\n")

  headers.each { |key, value|  connection.print("#{key}: #{value}\r\n") }

  connection.print "\r\n"

  body.each { |part| connection.print(part) }

  connection.close
end
