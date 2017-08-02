class Ahoy::Store < Ahoy::Intercom::Store
  def credentials
    { token: ENV['INTERCOM_ACCESS_TOKEN']}
  end
end
