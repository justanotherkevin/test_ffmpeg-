class FfmpegsController < ApplicationController
  before_action :find_ffmpeg, only: [:show, :edit, :update, :destroy]

  def index
    @ffmpegs = Ffmpeg.all.order('created_at DESC')
  end

  def show
  end

  def new
    @options_formate = ["AVI", "ASF", "MOV", "AVCHD", "FLV","MPG","MP4","WMV"]
    @options_resolution = ["720×480","640×480", "512×384", "480×320", "320×240", "1920x1080", "1280x720", "854×480", "768×432", "640×360", "512×288", "320×180",]
    @ffmpeg = Ffmpeg.new
  end

  def create
    debugger
    conversion_option = params[:ffmpeg][:conversion_option]
    transcoder_options =
    @ffmpeg = Ffmpeg.new(ffmpeg_params)

    if @ffmpeg.save
      flash[:notice] = "Post successfully created"
      redirect_to @ffmpeg
    else
      render 'new'
    end
  end

  def edit
  end
  def update
    if @ffmpeg.update(ffmpeg_params)
      redirect_to @ffmpeg
    else
      render 'edit'
    end
  end
  def destroy
    @ffmpeg.destroy
    redirect_to root_path, notice: "deleted"
  end

  private

  def ffmpeg_params
    params.require(:ffmpeg).permit(
      :title, :description, :video,
      conversion_option_attributes:[
        :file_type,
        :resolution,
        :frame_rate
      ])
  end

  def find_ffmpeg
    @ffmpeg = Ffmpeg.find(params[:id])
  end
end
