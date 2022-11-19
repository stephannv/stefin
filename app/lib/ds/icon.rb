module Ds
  class Icon < Ds::Base
    DEFAULT_ATTRIBUTES = {xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 24 24"}.freeze

    PATH_ATTRIBUTES = {
      add: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M11 11V5h2v6h6v2h-6v6h-2v-6H5v-2z"}],
      check_circle: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16zm-.997-4L6.76 11.757l1.414-1.414 2.829 2.829 5.656-5.657 1.415 1.414L11.003 16z"}],
      chevron_left: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M10.828 12l4.95 4.95-1.414 1.414L8 12l6.364-6.364 1.414 1.414z"}],
      exclamation_circle: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16zm-1-5h2v2h-2v-2zm0-8h2v6h-2V7z"}],
      information: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16zM11 7h2v2h-2V7zm0 4h2v6h-2v-6z"}],
      list_check: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M11 4h10v2H11V4zm0 4h6v2h-6V8zm0 6h10v2H11v-2zm0 4h6v2h-6v-2zM3 4h6v6H3V4zm2 2v2h2V6H5zm-2 8h6v6H3v-6zm2 2v2h2v-2H5z"}],
      logout: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M4 18h2v2h12V4H6v2H4V3a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3zm2-7h7v2H6v3l-5-4 5-4v3z"}],
      menu: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M3 4h18v2H3V4zm0 7h18v2H3v-2zm0 7h18v2H3v-2z"}],
      save: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M7 19v-6h10v6h2V7.828L16.172 5H5v14h2zM4 3h13l4 4v13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1zm5 12v4h6v-4H9z"}],
      tag: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M10.9 2.1l9.899 1.415 1.414 9.9-9.192 9.192a1 1 0 0 1-1.414 0l-9.9-9.9a1 1 0 0 1 0-1.414L10.9 2.1zm.707 2.122L3.828 12l8.486 8.485 7.778-7.778-1.06-7.425-7.425-1.06zm2.12 6.364a2 2 0 1 1 2.83-2.829 2 2 0 0 1-2.83 2.829z"}],
      trash: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M17 6h5v2h-2v13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V8H2V6h5V3a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v3zm1 2H6v12h12V8zm-9 3h2v6H9v-6zm4 0h2v6h-2v-6zM9 4v2h6V4H9z"}],
      wallet: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M22 7h1v10h-1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h18a1 1 0 0 1 1 1v3zm-2 10h-6a5 5 0 0 1 0-10h6V5H4v14h16v-2zm1-2V9h-7a3 3 0 0 0 0 6h7zm-7-4h3v2h-3v-2z"}],
      x_circle: [{"fill" => "none", "d" => "M0 0h24v24H0z"}, {"d" => "M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16zm0-9.414l2.828-2.829 1.415 1.415L13.414 12l2.829 2.828-1.415 1.415L12 13.414l-2.828 2.829-1.415-1.415L10.586 12 7.757 9.172l1.415-1.415L12 10.586z"}]
    }

    def initialize(name:, size: "w-6 h-6", color: nil, **html_options)
      @name = name
      @size = size
      @color = color
      @extra_classes = html_options.delete(:class)
      @html_options = html_options
    end

    private

    attr_reader :name, :size, :color, :extra_classes, :html_options

    def template
      validate_icon!

      svg(**DEFAULT_ATTRIBUTES.merge(classes(size, color_class, extra_classes)), **html_options) do
        PATH_ATTRIBUTES[name].each do |attributes|
          path(**attributes)
        end
      end
    end

    def validate_icon!
      raise StandardError, "Icon not defined" unless PATH_ATTRIBUTES.key?(name)
    end

    def color_class
      color || "fill-current"
    end
  end
end
