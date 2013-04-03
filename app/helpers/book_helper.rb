# Helper methods defined here can be accessed in any controller or view in the application

class BookHelper
  def self.render_article_content(path)
	if File.exist?("public/content/#{path}.md")
		markdown_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)

		file_contents = File.read("public/content/#{path}.md")
		markdown_renderer.render(file_contents)
	else
		"Nopers, I can't find it. views/content/#{path}.md"
	end
  end
end