class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  def create
    @tag = Tag.new(tag_params)
      if @tag.save
        render :json => @tag.to_json
      else
        render :json => @tag.errors.to_json
      end
  end


  private

  def tag_params
    params.permit(:tags)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

end
