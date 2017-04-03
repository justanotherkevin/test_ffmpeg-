class Ffmpeg < ApplicationRecord
  # has_attached_file :video,
  #   processors: [:ffmpeg]
  has_attached_file :video,
  styles: {
    mp4: { format: "mp4",
      convert_options: {
        output: { strict: "experimental", s: "480x320" }}},
    thumb: { format: "jpg",
      convert_options: {
        output: { strict: "experimental", ss: 1, vframes: 1, s: "120x67" }}}
    },
    processors: [:transcoder]

  validates_presence_of :video
  validates_attachment_content_type :video,   :content_type => /\Avideo\/.*\Z/
  validates_attachment_size :video, :less_than => 5.megabytes
  # process_in_background :video

  # validates_attachment_content_type :video, :content_type => ["video/mp4", "video/quicktime", "video/x-flv", "video/x-msvideo", "video/x-ms-wmv", "video/webm"]
end
