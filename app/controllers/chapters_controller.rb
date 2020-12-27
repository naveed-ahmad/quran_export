class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.includes(:translated_name).order("chapter_number asc")

    render stream: true
  end

  def show
    @chapter = Chapter
                   .includes(:translated_name)
                   .find(params[:id])

    send_response
  end

  protected

  def send_response
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "quran", layout: 'application', encoding: 'UTF-8', enable_local_file_access: true,
               header: {html: {layout: false, template: 'chapters/_header.html.erb'}, space: 10},
               footer: {html: {layout: false, template: 'chapters/_footer.html.erb'}},
               margin: {bottom: 15, top: 15}
      end
    end
  end
end
