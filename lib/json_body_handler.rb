module JsonBodyHandler
  extend ActiveSupport::Concern

  included do
    extend ClassMethods
  end

  module ClassMethods
    def handle_json_body(options = {})
      options.merge!(:if => :modifier_request_type?)
      before_filter options do |controller|
        controller.send(:handle_json_body)
      end
    end
  end

  def handle_json_body
    params.merge!(parsed_request_body) if request_body?
  end

  def request_body?
    request_body.present?
  end

  def request_body
    @request_body ||= request.body.read
  end

  def parsed_request_body
    @parsed_request_body ||= MultiJson.load(request_body)
  rescue MultiJson::LoadError
    @parsed_request_body = []
  end

  def modifier_request_type?
    %w(POST PUT DELETE).include?(request.request_method)
  end
end
