class Ffmpeg < ApplicationRecord
  # has_attached_file :video,
  #   processors: [:ffmpeg]
  # def initialize(params)
  #   @video_info = params[:ffmpeg][:video]
  #   @conversion_option = params[:ffmpeg][:conversion_option]
  # end

  has_attached_file :video,
  styles: {
    mp4: { format: "mp4",
      convert_options: {
        output: { strict: "experimental",
                  s:      "480x320"
                }
      }
    }
  },
  processors: [:transcoder]

  validates_presence_of :video
  validates_attachment_content_type :video,   :content_type => /\Avideo\/.*\Z/
  validates_attachment_size :video, :less_than => 5.megabytes
  # process_in_background :video
  # validates_attachment_content_type :video, :content_type => ["video/mp4", "video/quicktime", "video/x-flv", "video/x-msvideo", "video/x-ms-wmv", "video/webm"]
  def self.format
    "avi"
  end
end
