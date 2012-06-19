
class TagsController < ApplicationController
  def search
    @tag = Tag.find_by_name(params[:name])
    if @tag
      @copipes = @tag.copipes
    else
      @tag = Tag.new()
      @tag.name = params[:name]
    end
  end
end
