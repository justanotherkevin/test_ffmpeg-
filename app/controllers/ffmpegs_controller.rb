class FfmpegsController < ApplicationController
  before_action :find_ffmpeg, only: [:show, :edit, :update, :destroy]

  def index
    @ffmpegs = Ffmpeg.all.order('created_at DESC')
  end

  def show
  end

  def new
    @options_format = ["AVI", "ASF", "MOV", "AVCHD", "FLV","MPG","MP4","WMV"]
    @options_resolution = ["720×480","640×480", "512×384", "480×320", "320×240", "1920x1080", "1280x720", "854×480", "768×432", "640×360", "512×288", "320×180"]
    @ffmpeg = Ffmpeg.new
  end

  def create
    # debugger
    @ffmpeg = Ffmpeg.new(ffmpeg_params)
    movie = FFMPEG::Movie.new(params[:ffmpeg][:video].path)
    options = {
      video_codec: "libx264", frame_rate: 10, resolution: "320x240", video_bitrate: 300, video_bitrate_tolerance: 100,
      aspect: 1.333333, keyframe_interval: 90, x264_vprofile: "high", x264_preset: "slow",
      audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 22050, audio_channels: 1,
      threads: 2, custom: %w(-vf crop=60:60:10:10 -map 0:0 -map 0:1)
    }
    @new_movie = nil

    if movie
      puts "movie made"
      @new_movie = movie.transcode("/var/folders/b8/9g2ntwwd53l945xndhdbmm100000gn/T/RackMultipart20170412-10485-1mj8zc6.ogg")
    end
    # debugger
    # if param.format == avi
    #     FfmpegAvi
    # # if >> Ffmpg-to-mp3.new(papr )
    if @ffmpeg.save
      flash[:notice] = "Post successfully created"
      # sample = eval(@ffmpeg.video_meta)
      # redirect_to @ffmpeg
      render "show"
    else
      render 'new'
    end
  end

  # def edit
  # end
  # def update
  #   if @ffmpeg.update(ffmpeg_params)
  #     redirect_to @ffmpeg
  #   else
  #     render 'edit'
  #   end
  # end
  # def destroy
  #   @ffmpeg.destroy
  #   redirect_to root_path, notice: "deleted"
  # end

  private
  def ffmpeg_params
    params.require(:ffmpeg).permit(:video, :conversion_option)
  end

  def find_ffmpeg
    @ffmpeg = Ffmpeg.find(params[:id])
  end
end
