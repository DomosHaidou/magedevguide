Magedevguide.controllers :errata do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index do
    @parsed = Array.new
    Dir.glob('public/content/errata/*.json').sort.each do |file|
      json_file = open(file)
      json = json_file.read
      @parsed.push(JSON.parse(json))
    end
    render 'errata/index' 
  end

end
