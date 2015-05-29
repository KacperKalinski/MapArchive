class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to documents_path, notice: "Document #{@document.name} added!"
    else
      render 'new'
    end
  end

  # def download
  #   doc = Document.find(params[:id])
  #   send doc.attachment_url
  #             # :filename => open("http://0.0.0.0:3000#{doc.attachment_url}").filename,
  #             # :type => open(Rails.root + doc.attachment_url).content_type,
  #             # :disposition => 'attachment'
  #             # x_sendfile => true
  #
  #   render 'index', notice: "#{doc.name} download started!"
  # end

  private
  def document_params
    params.require(:document).permit(:name, :short_description, :attachment)
  end

end
