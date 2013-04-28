# Helper methods defined here can be accessed in any controller or view in the application

class ErrataHelper
  def self.render_errata_content(path)
	if File.exist?("public/content/errata/code/#{path}.md")
		markdown_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
		file_contents = File.read("public/content/errata/code/#{path}.md")
		markdown_renderer.render(file_contents)
	end
  end
end