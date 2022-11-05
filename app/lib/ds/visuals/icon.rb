module Ds
  module Visuals
    class Icon < Ds::Base
      DEFAULT_ATTRIBUTES = {xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 24 24"}.freeze

      SOLID_PATH_ATTRIBUTES = {
        credit_card: [{"d" => "M4.5 3.75a3 3 0 00-3 3v.75h21v-.75a3 3 0 00-3-3h-15z"}, {"fill-rule" => "evenodd", "d" => "M22.5 9.75h-21v7.5a3 3 0 003 3h15a3 3 0 003-3v-7.5zm-18 3.75a.75.75 0 01.75-.75h6a.75.75 0 010 1.5h-6a.75.75 0 01-.75-.75zm.75 2.25a.75.75 0 000 1.5h3a.75.75 0 000-1.5h-3z", "clip-rule" => "evenodd"}],
        menu: [{"fill-rule" => "evenodd", "d" => "M3 6.75A.75.75 0 013.75 6h16.5a.75.75 0 010 1.5H3.75A.75.75 0 013 6.75zM3 12a.75.75 0 01.75-.75h16.5a.75.75 0 010 1.5H3.75A.75.75 0 013 12zm0 5.25a.75.75 0 01.75-.75h16.5a.75.75 0 010 1.5H3.75a.75.75 0 01-.75-.75z", "clip-rule" => "evenodd"}],
        pencil_square: [{"d" => "M21.731 2.269a2.625 2.625 0 00-3.712 0l-1.157 1.157 3.712 3.712 1.157-1.157a2.625 2.625 0 000-3.712zM19.513 8.199l-3.712-3.712-8.4 8.4a5.25 5.25 0 00-1.32 2.214l-.8 2.685a.75.75 0 00.933.933l2.685-.8a5.25 5.25 0 002.214-1.32l8.4-8.4z"}, {"d" => "M5.25 5.25a3 3 0 00-3 3v10.5a3 3 0 003 3h10.5a3 3 0 003-3V13.5a.75.75 0 00-1.5 0v5.25a1.5 1.5 0 01-1.5 1.5H5.25a1.5 1.5 0 01-1.5-1.5V8.25a1.5 1.5 0 011.5-1.5h5.25a.75.75 0 000-1.5H5.25z"}],
        tag: [{"fill-rule" => "evenodd", "d" => "M5.25 2.25a3 3 0 00-3 3v4.318a3 3 0 00.879 2.121l9.58 9.581c.92.92 2.39 1.186 3.548.428a18.849 18.849 0 005.441-5.44c.758-1.16.492-2.629-.428-3.548l-9.58-9.581a3 3 0 00-2.122-.879H5.25zM6.375 7.5a1.125 1.125 0 100-2.25 1.125 1.125 0 000 2.25z", "clip-rule" => "evenodd"}]
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
