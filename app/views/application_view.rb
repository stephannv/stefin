class ApplicationView < Phlex::HTML
  include Rails.application.routes.url_helpers
  include Ds::Helpers

  private

  def t(key, **options)
    @translation_path ||= self.class.name&.underscore&.split("/")&.join(".").to_s

    key = "#{@translation_path}#{key}" if key.start_with?(".")

    I18n.translate(key, **options)
  end

  def current_controller?(controller_class)
    helpers.request.controller_class == controller_class
  end
end
