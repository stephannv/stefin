module Ds
  module Visuals
    class Icon < Ds::Base
      DEFAULT_ATTRIBUTES = {xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 24 24"}.freeze

      SOLID_PATH_ATTRIBUTES = {
        credit_card: [{"d" => "M4.5 3.75a3 3 0 00-3 3v.75h21v-.75a3 3 0 00-3-3h-15z"}, {"fill-rule" => "evenodd", "d" => "M22.5 9.75h-21v7.5a3 3 0 003 3h15a3 3 0 003-3v-7.5zm-18 3.75a.75.75 0 01.75-.75h6a.75.75 0 010 1.5h-6a.75.75 0 01-.75-.75zm.75 2.25a.75.75 0 000 1.5h3a.75.75 0 000-1.5h-3z", "clip-rule" => "evenodd"}],
        menu: [{"fill-rule" => "evenodd", "d" => "M3 6.75A.75.75 0 013.75 6h16.5a.75.75 0 010 1.5H3.75A.75.75 0 013 6.75zM3 12a.75.75 0 01.75-.75h16.5a.75.75 0 010 1.5H3.75A.75.75 0 013 12zm0 5.25a.75.75 0 01.75-.75h16.5a.75.75 0 010 1.5H3.75a.75.75 0 01-.75-.75z", "clip-rule" => "evenodd"}]
      }.freeze

      OUTLINE_PATH_ATTRIBUTES = {
        check_circle: [{"stroke-linecap" => "round", "stroke-linejoin" => "round", "d" => "M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"}],
        exclamation_triangle: [{"stroke-linecap" => "round", "stroke-linejoin" => "round", "d" => "M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z"}],
        information_circle: [{"stroke-linecap" => "round", "stroke-linejoin" => "round", "d" => "M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z"}],
        x_circle: [{"stroke-linecap" => "round", "stroke-linejoin" => "round", "d" => "M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z"}]
      }
      attr_reader :name, :size, :color, :outline, :extra_classes, :html_options

      def initialize(name:, size: "w-6 h-6", color: nil, outline: false, **html_options)
        @name = name
        @size = size
        @color = color
        @outline = outline
        @extra_classes = html_options.delete(:class)
        @html_options = html_options
      end

      def template
        validate_icon!

        svg(**DEFAULT_ATTRIBUTES.merge(classes(size, color_classes, extra_classes)), **html_options) do
          path_attributes.each do |attributes|
            path(**attributes)
          end
        end
      end

      def color_classes
        return color if color.present?

        outline ? "stroke-current fill-transparent stroke-2" : "fill-current"
      end

      def path_attributes
        @path_attributes ||= outline ? OUTLINE_PATH_ATTRIBUTES[name] : SOLID_PATH_ATTRIBUTES[name]
      end

      def validate_icon!
        raise StandardError, "Icon not defined" if path_attributes.blank?
      end
    end
  end
end
