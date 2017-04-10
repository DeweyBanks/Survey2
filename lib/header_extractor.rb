class HeaderExtractor
  attr_reader :value, :header

  def initialize(header, _env)
    @header = header
    @value  = _env[header_variations.detect { |variation| _env[variation] }]
  end

  protected

  def header_variations
    @header_variations ||= [
      header,
      ('HTTP_' + header.upcase.gsub('-', '_'))
    ]
  end
end
