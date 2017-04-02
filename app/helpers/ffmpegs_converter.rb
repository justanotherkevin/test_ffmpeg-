class FfmpegsConverter

  def initialize(params)
    conversion_option = params[:ffmpeg][:conversion_option]
    @resolution = conversion_option[:resolution]
    @frame_rate = conversion_option[:frame_rate]
    @file_type = conversion_option[:file_type]
  end


  def self.resolution
    @resolution
  end

  def self.resolution

  end

  def self.conversion_option(params)
    conversion_option = params[:ffmpeg][:conversion_option]
    # transcoder_options = {
    # resolution: conversion_option[:resolution],
    # frame_rate: conversion_option[:frame_rate],
    # }
    # conversion_option[:file_type]
    # "outoutvideo."+ conversion_option[:file_type]
  end
    # options = {
    #   video_codec: "libx264", frame_rate: 10, resolution: "320x240", video_bitrate: 300, video_bitrate_tolerance: 100,
    #   aspect: 1.333333, keyframe_interval: 90, x264_vprofile: "high", x264_preset: "slow",
    #   audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 22050, audio_channels: 1,
    #   threads: 2, custom: %w(-vf crop=60:60:10:10 -map 0:0 -map 0:1)
    # }
    #
    # movie.transcode("movie.mp4", options)

end
