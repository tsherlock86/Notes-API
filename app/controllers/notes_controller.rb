class NotesController < ApplicationController

  def index
    @notes = Note.all
    render :json => @notes
  end

  def create
    @note = Note.new(note_params)
    tags = params[:tags].split(",").collect(&:strip)
      if @note.save
          tags.each do |tag|
            @note.tags << Tag.create(name: tag)
          end
        render :json => @note
      else
        render :json => @note.errors
      end
  end

  def show
    @note = Note.find(params[:id])
    render :json => @note
  end



  private

  def note_params
    params.permit(:title, :body)
  end

  def set_note
    @note = Note.find(params[:id])
  end

end
