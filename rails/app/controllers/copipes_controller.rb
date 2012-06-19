# encoding: utf-8
class CopipesController < ApplicationController
  # GET /copipes
  # GET /copipes.json
  def index
    @copipes = Copipe.find(:all, :order=> 'id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @copipes }
    end
  end

  # GET /copipes/1
  # GET /copipes/1.json
  def show
    @copipe = Copipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @copipe }
    end
  end

  
  def txt
    @copipe = Copipe.find(params[:id])
    render :layout => "empty"
  end

  # GET /copipes/new
  # GET /copipes/new.json
  def new
    @copipe = Copipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @copipe }
    end
  end
  # GET /copipes/1/edit
  #def edit
    #@copipe = Copipe.find(params[:id])
  #end

  # POST /copipes
  # POST /copipes.json
  def create
    @copipe = Copipe.new(params[:copipe])
    @copipe.user_id = 0
    respond_to do |format|
      if @copipe.save
        # タグ投稿
        tags = params[:tags]
        tags = tags.split(/[\s|　]/)
        tags = tags.uniq
        tags.each{|tag_name|
          tag = Tag.find_or_create_by_name(tag_name)
          CopipeTag.create({:copipe_id => @copipe.id, :tag_id => tag.id})
        }
=begin
        format.html {
          redirect_to @copipe,
          notice: 'Article was successfully created.'
        }
=end
        format.html { redirect_to "/", notice: t(:create_complete)}
        format.json { render json: @copipe, status: :created, location: @copipe }
      else
        format.html { render action: "new" }
        format.json { render json: @copipe.errors, status: :unprocessable_entity }
      end
    end
  end
=begin
  # PUT /copipes/1
  # PUT /copipes/1.json
  def update
    @copipe = Copipe.find(params[:id])
    respond_to do |format|
      if @copipe.update_attributes(params[:copipe])
        format.html { redirect_to @copipe, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @copipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /copipes/1
  # DELETE /copipes/1.json

  def destroy
    @copipe = Copipe.find(params[:id])
    @copipe.destroy

    respond_to do |format|
      format.html { redirect_to copipes_url }
      format.json { head :no_content }
    end
  end
=end
end
