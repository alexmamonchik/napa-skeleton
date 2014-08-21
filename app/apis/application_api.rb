class ApplicationApi < Grape::API
  format :json
  prefix 'api'
  extend Napa::GrapeExtenders

  mount HelloApi => '/'

  add_swagger_documentation
end

