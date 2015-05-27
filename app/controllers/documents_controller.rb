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
      flash[:notice] = "Document #{@document.name} added!"
      redirect_to new_document_path
    else
      render 'new'
    end
  end
  private
  def document_params
    params.require(:document).permit(:name, :short_description, :attachment)
  end
end
