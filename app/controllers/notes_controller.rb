class NotesController < ApplicationController
  before_action :set_note, only: [:update]

  def index
    @notes = Note.all

    if User.find_by_api_token(params[:api_token])
      render :json => @user.notes
    else
      render :json => @notes, each_serializer: NotesSerializer
    end
  end

  def create
    @note = Note.new(note_params)

      if @note.save
        if params[:tags]
          tags = params[:tags].split(",").collect(&:strip)
          tags.each do |tag|
            @note.tags << Tag.find_or_create_by(name: tag)
          end
        end
        render :json => @note, serializer: NotesSerializer, root: "note"
      else
        render :json => @note.errors
      end
  end

  def show
    @note = Note.find(params[:id])
    render :json => @note
  end

  def update
    if @note.update(note_params)
      render json: @note, serializer: NotesSerializer, root: "note"
    else
      render json: @note.errors
    end
  end

  private

  def note_params
    params.permit(:title, :body)
  end

  def set_note
    @note = Note.find(params[:id])
  end

end
