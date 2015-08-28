class TagsController < ApplicationController
  before_action :set_tag


  def show
    render json: @tag, serializer: FulltagsSerializer, root: "tag"
  end


  private

  def set_tag
    @tag = Tag.find_by_name(params[:id])
  end

end
