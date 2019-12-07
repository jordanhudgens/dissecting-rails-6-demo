class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @guides = Guide.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @page_title = @guide.title
  end

  def new
    @guide = Guide.new
  end

  def edit
  end

  def create
    @guide = Guide.new(guide_params)
    @guide.user = current_user

    respond_to do |format|
      if @guide.save
        format.html { redirect_to @guide, notice: 'Guide was successfully created.' }
        format.json { render :show, status: :created, location: @guide }
      else
        format.html { render :new }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @guide.update(guide_params)
        puts "UPDATING FOR GUIDE", @guide.id
        ActionCable.server.broadcast(
          "guide_channel_#{@guide.id}",
          @guide.content
        )

        format.html { redirect_to @guide, notice: 'Guide was successfully updated.' }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { render :edit }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @guide.destroy
    respond_to do |format|
      format.html { redirect_to guides_url, notice: 'Guide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_guide
      @guide = Guide.find(params[:id])
    end

    def guide_params
      params.require(:guide).permit(
        :title,
        :content,
        :topic_id,
        :status,
        :featured_image,
        :live_updates
      )
    end
end
