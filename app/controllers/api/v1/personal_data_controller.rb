class Api::V1::PersonalDataController < ActionController::Base
  before_action :validate_jwt, only: :index

  def index
    render json: { data: AddressBook.all }
  end

  def authorize
    return render json: {}, status: 401 unless consumer.present?

    consumer.update!(token: jwt)

    render json: { data: { token: consumer.token } }
  end

  private

  def jwt
    JWT.encode(payload, private_key, "RS256")
  end

  def payload
    {
      email:  consumer.email,
      secret: consumer.secret,
      expire: 5.minutes.from_now
    }
  end

  def private_key
    private_key_file = File.read(Rails.root.join("config", "private_key.pem"))
    OpenSSL::PKey::RSA.new(private_key_file)
  end

  def validate_jwt
    JWT.decode(request.authorization.split.last, OpenSSL::PKey::RSA.new(private_key.public_key), true, { algorithm: "RS256" })
  rescue => error
    render json: { errors: error }
  end

  def consumer
    @consumer ||= Consumer.find_by(secret: request.headers["HTTP_SECRET"])
  end
end
