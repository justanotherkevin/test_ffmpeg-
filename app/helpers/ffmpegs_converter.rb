class FfmpegsConverter

  def initialize(params)
    @video_info = params[:ffmpeg][:video]
    @conversion_option = params[:ffmpeg][:conversion_option]
  end
  def file_path
    @video_info.tempfile.path
  end
  def file_type
    @conversion_option[:file_type]
  end
  def resolution
    @conversion_option[:resolution]
  end

  def frame_rate
    @conversion_option[:frame_rate]
  end
  def transcoder_options
    options = {
      resolution: resolution,
      frame_rate: frame_rate,
    }
  end

  # "outoutvideo."+ conversion_option[:file_type]
  def out_put
    movie = FFMPEG::Movie.new(file_path)
    movie.path.gsub!(/[^.]+$/, file_type)
    new_movie = movie.transcode(movie.path, transcoder_options)
  end
    # transcoded_movie = movie.transcode("movie.mp4", options){ |progress| puts progress }

end
