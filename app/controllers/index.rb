Magedevguide.controllers do
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

  get :index, :map => '/(:chapter_id(/:slug))' do
    if(params[:chapter_id] && params[:slug])
      path = params[:chapter_id] + '_' + params[:slug]
      @content = BookHelper.render_article_content(path)
      render 'book/article'
    elsif(params[:slug])
      @content = BookHelper.render_article_content(params[:slug])
      render 'book/article'
    elsif (params[:chapter_id])
      @content = BookHelper.render_article_content(params[:chapter_id])
      render 'book/article'
    else
     render 'book/index'
   end
  end

  get :challenge, :map => '/challenge/:chapter_id/:challenge))' do
      path = 'challenge_' + params[:chapter_id] + '_' + params[:challenge] 
      @content = BookHelper.render_article_content(path)
      render 'book/article'
  end

end

