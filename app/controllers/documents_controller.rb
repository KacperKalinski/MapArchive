class DocumentsController < ApplicationController
  before_action :require_user
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

  def download
    path = "#{request.original_fullpath[1..-1]}"
    send_file path, :disposition => 'attachment', :x_sendfile=>true
  end

  private

  def document_params
    params.require(:document).permit(:name, :short_description, :attachment)
  end

end
