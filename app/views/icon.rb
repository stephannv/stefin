class Icon < Phlex::View
  DEFAULT_ATTRIBUTES = {xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 24 24"}.freeze

  PATH_ATTRIBUTES = {
    menu: [{"fill-rule" => "evenodd", "d" => "M3 6.75A.75.75 0 013.75 6h16.5a.75.75 0 010 1.5H3.75A.75.75 0 013 6.75zM3 12a.75.75 0 01.75-.75h16.5a.75.75 0 010 1.5H3.75A.75.75 0 013 12zm0 5.25a.75.75 0 01.75-.75h16.5a.75.75 0 010 1.5H3.75a.75.75 0 01-.75-.75z", "clip-rule" => "evenodd"}],
    credit_card: [{"d" => "M4.5 3.75a3 3 0 00-3 3v.75h21v-.75a3 3 0 00-3-3h-15z"}, {"fill-rule" => "evenodd", "d" => "M22.5 9.75h-21v7.5a3 3 0 003 3h15a3 3 0 003-3v-7.5zm-18 3.75a.75.75 0 01.75-.75h6a.75.75 0 010 1.5h-6a.75.75 0 01-.75-.75zm.75 2.25a.75.75 0 000 1.5h3a.75.75 0 000-1.5h-3z", "clip-rule" => "evenodd"}]
  }.freeze

  attr_reader :name, :size, :color

  def initialize(name:, size: "w-6 h-6", color: "fill-current")
    raise StandardError, "Invalid icon name" unless PATH_ATTRIBUTES.key?(name)

    @name = name
    @size = size
    @color = color
  end

  def template
    svg(**DEFAULT_ATTRIBUTES.merge(classes(size, color))) do
      PATH_ATTRIBUTES[name].each do |path_attributes|
        path(**path_attributes)
      end
    end
  end
end
