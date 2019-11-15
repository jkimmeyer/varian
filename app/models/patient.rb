class Patient < ActiveModelSerializers::Model
  include HTTParty
  base_uri 'https://junction-planreview.azurewebsites.net/api/patients'
  attr_accessor :id, :first_name, :middle_name, :last_name

  def initialize(attributes = {})
    attributes.symbolize_keys!

    @id          = attributes[:Id]
    @first_name  = attributes[:FirstName]
    @middle_name = attributes[:MiddleName]
    @last_name   = attributes[:LastName]

    super(
      id: @id,
      first_name: @first_name,
      middle_name: @middle_name,
      last_name: @last_name,
    )
  end

  class << self
    def all
      response = get(base_uri)
      response.parsed_response.map do |id|
        find(id)
      end
    end

    def find(id)
      response = get(URI.join(base_uri + '/', id))
      raise ActiveRecord::RecordNotFound, "couldn't find patient with id #{id}" if response.code == 404

      new(response.parsed_response)
    end
  end
end
