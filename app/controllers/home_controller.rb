class HomeController < ApplicationController
  
  def index
    @chapters = Chapter.where(chapter_number: (params[:chapter] || (1.upto(114).to_a))).order("chapter_number asc")

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "quran", dpi: "96", window_status: "doc_ready", layout: 'application', :template => 'home/index.html.erb', encoding: 'UTF-8', enable_local_file_access: true,
        header: { html: { layout: false, template: 'home/_header.html.erb'}, space: 10},
        footer: { html: { layout: false, template: 'home/_footer.html.erb'}},
        margin: {bottom: 15, top: 15}
      end
    end
    
  end
  
end
