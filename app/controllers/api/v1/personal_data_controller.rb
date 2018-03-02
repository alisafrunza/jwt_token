class Api::V1::PersonalDataController < ActionController::Base
  before_action :validate_jwt

  def index
    return render json: {}, status: 401 unless consumer.present?
    render json: { data: AddressBook.all }
  end

  private

  def validate_jwt
    JWT.decode(params[:consumer_data], OpenSSL::PKey::RSA.new(consumer.public_key), true, { algorithm: "RS256" })
  rescue => error
    render json: { errors: error }
  end

  def consumer
    @consumer ||= Consumer.find_by(secret: request.headers["HTTP_SECRET"])
  end
end
