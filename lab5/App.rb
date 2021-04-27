require_relative 'CashMachine'

ENCODING = '<meta charset="utf-8">'

class App
  def call(env, params, cash_machine)
    req = Rack::Request.new(env)
    p = Rack::Utils.parse_nested_query(params)

    case req.path
    when '/balance'
      [200, {'Content-Type' => 'text/html'}, [ENCODING + cash_machine.balance]]
    when '/withdraw'
      [200, {'Content-Type' => 'text/html'}, [ENCODING + cash_machine.withdraw(p['value'].to_f)]]
    when '/deposit'
      [200, {'Content-Type' => 'text/html'}, [ENCODING + cash_machine.deposit(p['value'].to_f)]]
    else
      [404, {'Content-Type' => 'text/html'}, ["Not found"]]
    end
  end
end