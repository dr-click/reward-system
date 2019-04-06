class RoutingBase
  attr_accessor :params

  def initialize(attrs={})
    @params = attrs
  end

  #########
  protected
  #########

  def render(file_name)
    File.read(
      File.join('views', self.class.name.downcase, file_name_with_html(file_name))
    )
  end

  #######
  private
  #######

  def file_name_with_html(file_name)
    "#{file_name}.html" unless file_name.to_s.include?(".html")
  end

end